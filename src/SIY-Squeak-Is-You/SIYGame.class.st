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
		'globalScaleFactor'
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
	#'squeak_changestamp' : 'LK 1/4/2024 21:45'
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
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/4/2024 22:07'
}
SIYGame >> globalScaleFactor [

	^ globalScaleFactor ifNil: [globalScaleFactor := 1]
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/4/2024 22:07'
}
SIYGame >> globalScaleFactor: aFloat [

	globalScaleFactor := aFloat
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:20'
}
SIYGame >> initialize [

	super initialize.
	
	self startLevel: SIYLevel00 atPosition: Display center
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:11'
}
SIYGame >> initializeScaled: aFloat [
	
	self globalScaleFactor: aFloat.
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
	#'squeak_changestamp' : 'LK 1/4/2024 22:31'
}
SIYGame >> nextLevel [

	self level nextLevel ifNotNil: [self replaceLevelWith: self level nextLevel]
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 22:32'
}
SIYGame >> previousLevel [

	self level previousLevel ifNotNil: [self replaceLevelWith: self level previousLevel]
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
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 22:08'
}
SIYGame >> startLevel: aLevel [

	self level: (aLevel newWithScale: self globalScaleFactor).
	self arena game: self
	
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 17:38'
}
SIYGame >> startLevel: aLevel atPosition: aPoint [

	self startLevel: aLevel.
	self arena center: aPoint
]
