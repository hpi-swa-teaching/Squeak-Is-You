"
The SIYArena is the visible part of the game, that contains all SIYBlocks.

If you want to start a new game, run `SIYGame start`. To prevent the game from running in fullscreen, specify a scale factor when starting the game: `SIYGame startWithScale: 1.0`.

Instance Variables
	arenaHeight: <Integer>
	arenaWidth: <Integer>
	scaleFactor: <Float>
	positionDictionary: <Dictionary>
	transformationSet: <Set>
	game: <SIYGame>
	gameBoard: <SIYGameboard>
	rulebook: <SIYRulebook>
	undoCaretaker: <SIYUndoCaretaker>


"
Class {
	#name : #SIYArena,
	#superclass : #Morph,
	#instVars : [
		'arenaWidth',
		'arenaHeight',
		'game',
		'positionDictionary',
		'undoCaretaker',
		'scaleFactor',
		'gameLock',
		'gameBoard',
		'rulebook',
		'transformationSet'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 19:42'
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
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 14:25'
}
SIYArena >> audioPlayer [

	^ self game audioPlayer
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/3/2024 22:08'
}
SIYArena >> backgroundColor [

	^ Color black
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 2/4/2024 19:20'
}
SIYArena >> clampPointToArenaDimension: aPoint [

	^ (aPoint x clampLow: 1 high: self arenaWidth)
		@(aPoint y clampLow: 1 high: self arenaHeight)

]

{
	#category : #dropping,
	#'squeak_changestamp' : 'LK 12/12/2023 11:07'
}
SIYArena >> dropEnabled [

	^ true
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
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYArena >> gameBoard [

	^ gameBoard ifNil: [gameBoard := SIYGameBoard newForArena: self]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 17:30'
}
SIYArena >> initialize [

	super initialize.
	self color: self backgroundColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 1/31/2024 16:37'
}
SIYArena >> initializeWithExtent: aPoint [

	self initialize;
		arenaWidth: aPoint x;
		arenaHeight: aPoint y
	
	
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 1/31/2024 16:37'
}
SIYArena >> initializeWithExtent: aPoint scaled: aFloat [

	self scaleFactor: aFloat;
		initializeWithExtent: aPoint
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 19:30'
}
SIYArena >> isGameLocked [

	^ gameLock ifNil: [gameLock := false]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 2/4/2024 19:22'
}
SIYArena >> isPointInArenaDimensions: aPoint [

	^ (aPoint x between: 1 and: self arenaWidth) 
		and: (aPoint y between: 1 and: self arenaHeight) 

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/7/2024 19:06'
}
SIYArena >> lockGame [

	gameLock := true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 19:34'
}
SIYArena >> moveBlocksDirection: aDirection [
	
	self preMoveBlocksRoutine.
	(self gameBoard getBlocksFromDirection: aDirection)
		do: [:aBlock | aBlock isYou ifTrue: [aBlock move: aDirection]].
	self postMoveBlocksRoutine
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 17:12'
}
SIYArena >> moveBlocksDown [
	
	self moveBlocksDirection: 0@1
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 17:12'
}
SIYArena >> moveBlocksLeft [
	
	self moveBlocksDirection: -1@0
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 17:12'
}
SIYArena >> moveBlocksRight [
	
	self moveBlocksDirection: 1@0
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 17:12'
}
SIYArena >> moveBlocksUp [
	
	self moveBlocksDirection: 0@(-1)
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
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 18:34'
}
SIYArena >> postMoveBlocksRoutine [
	"This routine gets triggered, after every block has been moved through the 	moveBlocksDirection method, for example after keyboard input.
	This routine will NOT get triggered, if blocks are moved using the halo."

	self rulebook updateRulesInArena: self.

	self gameBoard getAllBlocks
		do: [:aBlock | self rulebook checkRulesFor: aBlock].	
			
	self undoCaretaker createSnapshotOf: self

]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 19:35'
}
SIYArena >> preMoveBlocksRoutine [
	"This routine gets triggered, bevore every block will be moved through the 	moveBlocksDirection method, for example after keyboard input.
	This routine will NOT get triggered, if blocks are moved using the halo."

	self resetDictionaryAndSet.
	self rulebook updateRulesInArena: self

	
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYArena >> resetDictionaryAndSet [

	self positionDictionary removeAll.
	self transformationSet removeAll
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYArena >> restoreSnapshot: aSnapshot [
	"restores arena state to this snapshot"
	
	self undoMovement: aSnapshot positionDictionary;
		undoTransformations: aSnapshot transformationSet
	
	
		


]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYArena >> rulebook [

	^ rulebook ifNil: [rulebook := SIYRulebook new]
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
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/5/2024 12:59'
}
SIYArena >> textureSize [
	"size of block textures in pixel"
	
	^ 72
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYArena >> transformationSet [

	^ transformationSet ifNil: [transformationSet := Set new]
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYArena >> undoCaretaker [

	^ undoCaretaker ifNil: [undoCaretaker := SIYUndoCaretaker newInArena: self]
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYArena >> undoMovement: aPositionDictionary [
	
	aPositionDictionary keysAndValuesDo: [:key :value | 
		key owner ifNil: key respawn.
		key setTextureForDirection: key coords - value.
		key coords: value]
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYArena >> undoTransformations: aReplacementSet [
	
	aReplacementSet do: [:aBlock | aBlock delete]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/7/2024 19:06'
}
SIYArena >> unlockGame [

	gameLock := false
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 2/4/2024 19:34'
}
SIYArena >> updateDimensions [

	self arenaWidth ifNotNil: [self width: self pixelPerBlock * self arenaWidth].
	self arenaHeight ifNotNil: [self height: self pixelPerBlock * self arenaHeight]

]

{
	#category : #dropping,
	#'squeak_changestamp' : 'LK 12/15/2023 20:33'
}
SIYArena >> wantsDroppedMorph: aMorph event: evt [

	^ aMorph isKindOf: SIYBlock
]
