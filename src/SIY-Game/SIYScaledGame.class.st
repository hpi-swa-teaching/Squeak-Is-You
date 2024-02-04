"
Creating an instance of this class will start the game in a non-fullscreen, scaled version.

Instance Variables
	scaleFactor: <Float>
"
Class {
	#name : #SIYScaledGame,
	#superclass : #SIYGame,
	#instVars : [
		'scaleFactor'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 19:59'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/5/2024 12:48'
}
SIYScaledGame class >> startWithScale: aScaleFactor [

	^ self basicNew initializeWithScale: aScaleFactor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:51'
}
SIYScaledGame class >> startWithScale: aScaleFactor atLevel: aLevelClass [

	^ self basicNew initializeWithScale: aScaleFactor atLevel: aLevelClass
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 21:56'
}
SIYScaledGame >> arenaPosition [

	^ self center
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 2/3/2024 21:17'
}
SIYScaledGame >> exitGame [

	^ nil "do nothing"
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 21:57'
}
SIYScaledGame >> initializeBackground [
	
	self openInHand;
		position: self arenaPosition;
		color: self backgroundColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 2/1/2024 13:45'
}
SIYScaledGame >> initializeWithScale: aScaleFactor [
	
	self scaleFactor: aScaleFactor;
		initialize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 2/1/2024 13:46'
}
SIYScaledGame >> initializeWithScale: aScaleFactor atLevel: aLevelClass [
	
	self level: aLevelClass;
		initializeWithScale: aScaleFactor
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/31/2024 21:58'
}
SIYScaledGame >> scaleFactor [

	^ scaleFactor
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/31/2024 21:58'
}
SIYScaledGame >> scaleFactor: aFloat [
	
	scaleFactor := aFloat
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 2/4/2024 20:00'
}
SIYScaledGame >> updateExtent [
	
	| aPoint |

	aPoint := self center.
	
	self extent: self arena extent;
		center: aPoint
]
