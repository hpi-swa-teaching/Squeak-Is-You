"
A SIYGame is the main class of the game. It can start a new game and creates the arena for the corresponding level.

If you want to start a new game, run `SIYGame start`. To prevent the game from running in fullscreen, specify a scale factor when starting the game: `SIYGame startWithScale: 1.0`.

Instance Variables
	arena: <SIYArena>
	level: <SIYLevel>
	backgroundMorph: <Morph>
	customScaleFactor: <Float>
	levelDescription: <TextMorph>

"
Class {
	#name : #SIYScaledGame,
	#superclass : #SIYGame,
	#instVars : [
		'scaleFactor'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : '<historical>'
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
	#'squeak_changestamp' : 'LK 1/31/2024 22:44'
}
SIYScaledGame >> initializeWithScale: aScaleFactor [
	
	self scaleFactor: aScaleFactor.
	self initialize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:51'
}
SIYScaledGame >> initializeWithScale: aScaleFactor atLevel: aLevelClass [
	
	self level: aLevelClass.
	self initializeWithScale: aScaleFactor
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
	#'squeak_changestamp' : 'LK 1/31/2024 21:58'
}
SIYScaledGame >> updateExtent [
	
	| aPoint |

	aPoint := self center.
	
	self extent: self arena extent;
		center: aPoint
]
