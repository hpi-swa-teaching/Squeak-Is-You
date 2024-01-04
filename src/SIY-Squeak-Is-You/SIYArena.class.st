"
The SIYArena is the visible part of the game and contains all SIYBlocks.

Instance Variables
	arenaHeight: <Integer>
	arenaWidth: <Integer>
	blockMediator:	 <SIYBlockMediator>
	game:	<SIYGame>
	positionDictionary: <Dictionary>
	pressedKey: <Character>
	ruleManager: <SIYRuleManager>
	snapshotCaretaker: <SIYSnapshotCaretaker>
	stepTime: <Integer>

"
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
		'undoCaretaker'
	],
	#category : #'SIY-Squeak-Is-You',
	#'squeak_changestamp' : 'LK 1/4/2024 14:51'
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
	#'squeak_changestamp' : 'KD 1/4/2024 16:12'
}
SIYArena >> checkKeyboardInputs [
	
	| aKey |
	
	aKey := self pressedKey.
	aKey ifNil: [self stepFaster] ifNotNil: [self stepSlower].
    
	aKey caseOf: {
		[$r] -> [self game restartLevel].
        	[$z] -> [self undoCaretaker restoreSnapshot].
		[Character arrowUp] -> [self moveBlocksDirection: 0@(-1)].
		[Character arrowDown] -> [self moveBlocksDirection: 0@1].
		[Character arrowRight] -> [self moveBlocksDirection: 1@0].
		[Character arrowLeft] -> [self moveBlocksDirection: (-1)@0].
            [$1] -> [self game replaceLevelWith: SIYLevel01].
            [$2] -> [self game replaceLevelWith: SIYLevel02].
		[$3] -> [self game replaceLevelWith: SIYLevel03].
		[$4] -> [self game replaceLevelWith: SIYLevel04].
		[$5] -> [self game replaceLevelWith: SIYLevel05].
		[$6] -> [self game replaceLevelWith: SIYLevel06].
     } otherwise: ["do nothing"]
	
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
	#'squeak_changestamp' : 'LK 1/4/2024 14:42'
}
SIYArena >> fastStepTime [
	"faster step time for polling keyboard inputs, while no button is pressed"

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
	#'squeak_changestamp' : 'LK 1/4/2024 18:10'
}
SIYArena >> moveBlocksDirection: aDirection [
	"Informs all isYou blocks in arena to move in specified direction. 
	Tells undoManager to create new snapshot after all blocks have been moved."

	| movementQueue |
	
	movementQueue := self blockMediator generateQueueForDirection: aDirection.
	
	self resetPositionDictionary.
	movementQueue do: [:aBlock | aBlock isYou ifTrue: [aBlock move: aDirection]].
	self undoCaretaker createSnapshotOf: self
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
	#'squeak_changestamp' : 'LK 1/4/2024 14:38'
}
SIYArena >> pressedKey [
	"returns the key currently pressed, while ignoring multiple simultaneous keyboard inputs"

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
	#'squeak_changestamp' : 'LK 1/4/2024 14:43'
}
SIYArena >> slowStepTime [
	"slower step time affects the delay between block movements, while a keyboard
	button is held down"

	^ 185
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
	#'squeak_changestamp' : 'LK 1/4/2024 14:17'
}
SIYArena >> stepTime [

	^ stepTime ifNil: [stepTime := self stepFaster]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 12/15/2023 19:16'
}
SIYArena >> stepTime: aNumber [

	stepTime := aNumber
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/4/2024 14:07'
}
SIYArena >> undoCaretaker [

	^ undoCaretaker ifNil: [undoCaretaker := SIYUndoCaretaker new]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/4/2024 14:16'
}
SIYArena >> updateDimensions [

	arenaWidth ifNotNil: [self width: self pixelPerBlock * arenaWidth].
	arenaHeight ifNotNil: [self height: self pixelPerBlock * arenaHeight]

]

{
	#category : #'halo features',
	#'squeak_changestamp' : 'LK 12/15/2023 20:33'
}
SIYArena >> wantsDroppedMorph: aMorph event: evt [

	^ aMorph isKindOf: SIYBlock
]
