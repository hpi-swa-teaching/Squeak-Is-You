Class {
	#name : #SIYArena,
	#superclass : #Morph,
	#instVars : [
		'arenaWidth',
		'arenaHeight',
		'stepTime',
		'game',
		'blockMediator',
		'ruleManager',
		'positionDictionary',
		'pressedKey',
		'snapshotCaretaker'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/3/2024 20:33'
}
SIYArena class >> newWithDimension: aDimension [

	^ SIYArena basicNew initializeWithDimension: aDimension
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/3/2024 23:55'
}
SIYArena >> arenaHeight [
	
	^ arenaHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/3/2024 23:55'
}
SIYArena >> arenaHeight: val [
	
	arenaHeight := val.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/3/2024 23:55'
}
SIYArena >> arenaWidth [
	
	^ arenaWidth
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/3/2024 23:55'
}
SIYArena >> arenaWidth: val [
	
	arenaWidth := val.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/3/2024 22:08'
}
SIYArena >> backgroundColor [

	^ Color black
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:17'
}
SIYArena >> blockMediator [

	^ blockMediator ifNil: [blockMediator := SIYBlockMediator newForArena: self]
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'LK 1/3/2024 22:55'
}
SIYArena >> checkKeyboardInputs [
	
	| aKey |
	
	aKey := self pressedKey.
	aKey ifNil: [self stepFaster] ifNotNil: [self stepSlower].
    
	aKey caseOf: {
		[$r] -> [self game restartLevel].
        	[$z] -> [self snapshotCaretaker restoreSnapshot].
		[Character arrowUp] -> [self moveBlocksDirection: 0 @ (-1)].
		[Character arrowDown] -> [self moveBlocksDirection: 0 @ 1].
		[Character arrowRight] -> [self moveBlocksDirection: 1 @ 0].
		[Character arrowLeft] -> [self moveBlocksDirection: (-1) @ 0]
	} otherwise: ["do nothing"]
	
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 23:56'
}
SIYArena >> createSnapshot [

	self snapshotCaretaker createSnapshot: 
		(SIYSnapshot newWithDictionary: (self positionDictionary copy))
]

{
	#category : #'halo features',
	#'squeak_changestamp' : 'LK 12/12/2023 11:07'
}
SIYArena >> dropEnabled [

	^ true
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 1/3/2024 21:45'
}
SIYArena >> fastStepTime [

	^ 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/21/2023 16:37'
}
SIYArena >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:22'
}
SIYArena >> game: aGame [

	game := aGame
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/3/2024 22:23'
}
SIYArena >> initialize [

	super initialize.
	self color: self backgroundColor.
	"self addFlexShell."
	
	self gmRegisterToKeyHandler.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/3/2024 23:56'
}
SIYArena >> initializeWithDimension: aDimension [

	self initialize.
	self arenaWidth: aDimension x.
	self arenaHeight: aDimension y
	
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'LK 1/3/2024 23:10'
}
SIYArena >> moveBlocksDirection: aDirection [
	"Move all isYou-blocks in arena, in specified direction."

	| movementQueue |
	
	movementQueue := self blockMediator generateQueueForDirection: aDirection.
	
	self resetPositionDictionary.
	movementQueue do: [:aBlock | aBlock isYou ifTrue: [aBlock move: aDirection]].
	self createSnapshot
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/2/2024 16:28'
}
SIYArena >> pixelPerBlock [

	^ 72
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 22:09'
}
SIYArena >> positionDictionary [

	^ positionDictionary ifNil: [positionDictionary := Dictionary new]
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 20:52'
}
SIYArena >> positionDictionary: aDictionary [

	positionDictionary := aDictionary
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'LK 1/3/2024 21:51'
}
SIYArena >> pressedKey [

	self eventHandler pressedKeys size caseOf: {
		[0] -> [pressedKey := nil].
		[1] -> [pressedKey := self eventHandler pressedKeys asOrderedCollection first]
	} otherwise: ["do nothing"].
	
	^ pressedKey
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 20:52'
}
SIYArena >> resetPositionDictionary [

	^ self positionDictionary removeAll
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:16'
}
SIYArena >> ruleManager [

	^ ruleManager ifNil: [ruleManager := SIYRuleManager new.]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 1/3/2024 21:45'
}
SIYArena >> slowStepTime [

	^ 185
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 22:57'
}
SIYArena >> snapshotCaretaker [

	^ snapshotCaretaker ifNil: [snapshotCaretaker := SIYSnapshotCaretaker new]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 1/3/2024 23:08'
}
SIYArena >> step [

	self checkKeyboardInputs
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 1/3/2024 21:46'
}
SIYArena >> stepFaster [

	self stepTime: self fastStepTime
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 1/3/2024 21:46'
}
SIYArena >> stepSlower [

	self stepTime: self slowStepTime
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 1/3/2024 22:07'
}
SIYArena >> stepTime [

	^ stepTime ifNil: [self stepFaster]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 12/15/2023 19:16'
}
SIYArena >> stepTime: aNumber [

	stepTime := aNumber
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/3/2023 20:55'
}
SIYArena >> updateDimensions [
	"Update arena dimensions according to width/height"

	(arenaWidth) ifNotNil: [self width: self pixelPerBlock * arenaWidth].
	(arenaHeight) ifNotNil: [self height: self pixelPerBlock * arenaHeight]

]

{
	#category : #'halo features',
	#'squeak_changestamp' : 'LK 12/15/2023 20:33'
}
SIYArena >> wantsDroppedMorph: aMorph event: evt [

	^ aMorph isKindOf: SIYBlock
]
