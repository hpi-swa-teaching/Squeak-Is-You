"
A SIYGame is the main class of the game. It can start a new game and creates the arena for the corresponding level.

Instance Variables
	arena: <SIYArena>
	level: <SIYLevel>

"
Class {
	#name : #SIYGame,
	#superclass : #Morph,
	#instVars : [
		'arena',
		'level',
		'scaleFactor'
	],
	#category : #'SIY-Squeak-Is-You',
	#'squeak_changestamp' : 'LK 1/4/2024 15:35'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 11/30/2023 15:20'
}
SIYGame class >> start [

	self new
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 17:47'
}
SIYGame class >> startWithScale: aScaleFactor [

	^ self basicNew initializeScaled: aScaleFactor
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> abortLevel [
	
	self arena delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:46'
}
SIYGame >> arena [

	^ self level arena
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/21/2023 16:40'
}
SIYGame >> initialize [

	super initialize.
	
	self startLevel: SIYLevel01
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 17:44'
}
SIYGame >> initializeScaled: aScaleFactor [
	
	self scaleFactor: aScaleFactor.
	self initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> level [ 

	^ level
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:49'
}
SIYGame >> level: aLevel [

	level := aLevel
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:48'
}
SIYGame >> nextLevel [

	self replaceLevelWith: self level nextLevel
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 17:38'
}
SIYGame >> replaceLevelWith: aLevelClass [
	"stops current level and starts specified level at the same position on screen,
	as the current one"
	
	| aPoint |
	
	aPoint := self arena center.
	self level ifNotNil: [self abortLevel].
	aLevelClass ifNotNil: [self startLevel: aLevelClass atPosition: aPoint]
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:49'
}
SIYGame >> restartLevel [

	self replaceLevelWith: self level class
	
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/4/2024 17:43'
}
SIYGame >> scaleFactor [

	^ scaleFactor ifNil: [scaleFactor := 1]
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/4/2024 17:43'
}
SIYGame >> scaleFactor: aScaleFactor [

	scaleFactor := aScaleFactor
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 17:36'
}
SIYGame >> startLevel: aLevel [

	self level: aLevel new.
	self arena game: self.
	self arena scale: self scaleFactor
	
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 17:38'
}
SIYGame >> startLevel: aLevel atPosition: aPoint [

	self startLevel: aLevel.
	self arena center: aPoint
]
