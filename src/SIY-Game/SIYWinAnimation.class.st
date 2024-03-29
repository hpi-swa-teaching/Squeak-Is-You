"
A SIYWinAnimation is the animation that is displayed, when isWin is being invoked.

Instance Variables
	animationStep: <Integer>
	arena: <SIYArena>

"
Class {
	#name : #SIYWinAnimation,
	#superclass : #ImageMorph,
	#instVars : [
		'animationStep',
		'arena'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/11/2024 22:30'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/7/2024 18:45'
}
SIYWinAnimation class >> playFor: aBlock [

	^ self basicNew initializeFor: aBlock
]

{
	#category : #step,
	#'squeak_changestamp' : 'LK 1/7/2024 19:09'
}
SIYWinAnimation >> animationDuration [

	^ 5
]

{
	#category : #step,
	#'squeak_changestamp' : 'LK 1/7/2024 18:38'
}
SIYWinAnimation >> animationStep [

	^ animationStep ifNil: [animationStep := 0]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/7/2024 18:50'
}
SIYWinAnimation >> arena [

	^ arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/7/2024 18:42'
}
SIYWinAnimation >> arena: anArena [

	^ arena := anArena
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'KD 1/31/2024 16:54'
}
SIYWinAnimation >> changeTexture [

	self incrementAnimationStep;
		image: (self getFormForTexture: self animationStep)
]

{
	#category : #step,
	#'squeak_changestamp' : 'LK 2/4/2024 20:19'
}
SIYWinAnimation >> checkIfAnimationDone [
	"if animation has finished playing, switch to next level"
	
	self arena 
		ifNotNil: [self animationStep >= self animationDuration
			ifTrue: [self arena game nextLevel]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 14:39'
}
SIYWinAnimation >> game [

	^ self arena game
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'KD 2/1/2024 15:00'
}
SIYWinAnimation >> getFormForTexture: aNumber [

	| aForm |
	
	aForm := SIYTextureLoader new getTexture: (self winAnimationTexture: aNumber).
	
	^ aForm scaledToHeight: self winAnimationTextureSize
]

{
	#category : #step,
	#'squeak_changestamp' : 'KD 2/1/2024 15:00'
}
SIYWinAnimation >> incrementAnimationStep [
	
	animationStep := self animationStep + 1
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 1/31/2024 16:54'
}
SIYWinAnimation >> initialize [

	super initialize.
	
	self game audioPlayer playWinSoundIfNotMuted.
	
	self changeTexture;
		openInWorld;
		comeToFront
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/7/2024 22:07'
}
SIYWinAnimation >> initializeFor: aBlock [

	self arena: aBlock arena.
	
	self initialize.
	
	self arena addMorph: self.
	self center: aBlock center
]

{
	#category : #step,
	#'squeak_changestamp' : 'KD 1/31/2024 16:55'
}
SIYWinAnimation >> step [

	self checkIfAnimationDone;
		changeTexture
]

{
	#category : #step,
	#'squeak_changestamp' : 'LK 1/7/2024 19:08'
}
SIYWinAnimation >> stepTime [
	
	^ 350
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/7/2024 18:25'
}
SIYWinAnimation >> winAnimationTexture: aNumber [

	(aNumber isDivisibleBy: 2)
		ifTrue: [^ 'WinAnimation-1.png']
		ifFalse: [^ 'WinAnimation-2.png']
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 2/4/2024 20:20'
}
SIYWinAnimation >> winAnimationTextureSize [
	
	^ 3 * self arena pixelPerBlock
]
