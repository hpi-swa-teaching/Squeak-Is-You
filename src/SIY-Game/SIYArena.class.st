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
	scaleFactor: <Float>

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
		'undoCaretaker',
		'flexShell',
		'scaleFactor'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 21:48'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/4/2024 21:51'
}
SIYArena class >> newWithExtent: aPoint [

	^ SIYArena basicNew initializeWithExtent: aPoint
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/4/2024 21:52'
}
SIYArena class >> newWithExtent: aPoint scaled: aFloat [

	^ SIYArena basicNew initializeWithExtent: aPoint scaled: aFloat
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
	#'squeak_changestamp' : 'LK 1/4/2024 22:31'
}
SIYArena >> checkKeyboardInputs [
	
	| aKey |
	
	aKey := self pressedKey.
	aKey ifNil: [self stepFaster] ifNotNil: [self stepSlower].
    
	aKey caseOf: {
		"restart & undo"
		[$r] -> [self game restartLevel].
        	[$z] -> [self undoCaretaker restoreSnapshot].
		"movement with arrow keys"
		[Character arrowUp] -> [self moveBlocksDirection: 0@(-1)].
		[Character arrowDown] -> [self moveBlocksDirection: 0@1].
		[Character arrowRight] -> [self moveBlocksDirection: 1@0].
		[Character arrowLeft] -> [self moveBlocksDirection: (-1)@0].
		"movement with WASD"
		[$w] -> [self moveBlocksDirection: 0@(-1)].
		[$s] -> [self moveBlocksDirection: 0@1].
		[$d] -> [self moveBlocksDirection: 1@0].
		[$a] -> [self moveBlocksDirection: (-1)@0].
		"level switching"
            [$m] -> [self game nextLevel].
            [$n] -> [self game previousLevel].
     } otherwise: ["do nothing"]
	
]

{
	#category : #dropping,
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
	#'squeak_changestamp' : 'LK 1/4/2024 23:39'
}
SIYArena >> initialize [

	super initialize.
	self color: self backgroundColor.
	self gmRegisterToKeyHandler
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:18'
}
SIYArena >> initializeWithExtent: aPoint [

	self initialize.
	self arenaWidth: aPoint x.
	self arenaHeight: aPoint y
	
	
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 21:52'
}
SIYArena >> initializeWithExtent: aPoint scaled: aFloat [

	self scaleFactor: aFloat.
	self initializeWithExtent: aPoint
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 18:47'
}
SIYArena >> moveBlocksDirection: aDirection [
	"Informs all isYou blocks in arena to move in specified direction"

	| movementQueue |
	
	movementQueue := self blockMediator generateQueueForDirection: aDirection.
	
	self preMoveBlocksRoutine.
	movementQueue do: [:aBlock | aBlock isYou ifTrue: [aBlock move: aDirection]].
	self postMoveBlocksRoutine
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/5/2024 12:59'
}
SIYArena >> pixelPerBlock [

	^ self textureSize * self scaleFactor
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
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 18:49'
}
SIYArena >> postMoveBlocksRoutine [
	"This routine gets triggered, after every block has been moved through the 	moveBlocksDirection method, for example after keyboard input.
	This routine will NOT get triggered, if blocks are moved using the halo."

	self undoCaretaker createSnapshotOf: self.
	

	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 18:50'
}
SIYArena >> preMoveBlocksRoutine [
	"This routine gets triggered, bevore every block will be moved through the 	moveBlocksDirection method, for example after keyboard input.
	This routine will NOT get triggered, if blocks are moved using the halo."

	self resetPositionDictionary.
	self ruleManager updateRulesInArena: self.

	
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
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/4/2024 22:18'
}
SIYArena >> scaleFactor [

	^ scaleFactor ifNil: [scaleFactor := 1]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/4/2024 21:48'
}
SIYArena >> scaleFactor: aScaleFactor [

	scaleFactor := aScaleFactor
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
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/5/2024 12:59'
}
SIYArena >> textureSize [
	"size of block textures in pixel"
	
	^ 72
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
	#category : #dropping,
	#'squeak_changestamp' : 'LK 12/15/2023 20:33'
}
SIYArena >> wantsDroppedMorph: aMorph event: evt [

	^ aMorph isKindOf: SIYBlock
]