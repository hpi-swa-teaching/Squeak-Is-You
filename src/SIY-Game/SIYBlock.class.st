"
A SIYBlock is one block visible in the arena.

Instance Variables
	arena:	<SIYArena>

"
Class {
	#name : #SIYBlock,
	#superclass : #ImageMorph,
	#instVars : [
		'arena'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 14:51'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:42'
}
SIYBlock class >> isAndOperator [

	^ self basicNew isAndOperator
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:42'
}
SIYBlock class >> isIsOperator [

	^ self basicNew isIsOperator
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:43'
}
SIYBlock class >> isNoun [

	^ self basicNew isNoun
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:42'
}
SIYBlock class >> isOperator [

	^ self basicNew isOperator
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:43'
}
SIYBlock class >> isProperty [

	^ self basicNew isProperty
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:43'
}
SIYBlock class >> isText [

	^ self basicNew isText
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 12/4/2023 17:02'
}
SIYBlock class >> newInArena: anArena [
	"create new block in SIY arena"

	^ self newInArena: anArena at: 0@0
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/3/2024 23:48'
}
SIYBlock class >> newInArena: anArena at: aPoint [
	"create new block in SIY arena at given coordinates"

	^ self basicNew initializeInArena: anArena at: aPoint
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/4/2024 15:08'
}
SIYBlock class >> symbol [

	^ self basicNew symbol
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 00:07'
}
SIYBlock >> alignToGrid [

	self coordX: self coordX.
	self coordY: self coordY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 11/21/2023 20:47'
}
SIYBlock >> arena [
	
	^ arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:06'
}
SIYBlock >> arena: anArena [
	
	arena := anArena
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 15:05'
}
SIYBlock >> basicMove: aDirection [
	"Moves this block in specified direction, WITHOUT considering the rules that currently
	apply. For example, calling this method won't push other blocks that are in the way."

	self preMoveRoutine: aDirection;
		coords: self coords + aDirection;
		postMoveRoutine: aDirection.
	
	"we return true, because the block was successfully moved"
	^ true

]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYBlock >> blockTexture [

	^ SubclassResponsibility
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 14:44'
}
SIYBlock >> blockTextureDown [
	"block texture if block has been moved down, defaults to the normal block texture"

	^ self blockTexture
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 14:44'
}
SIYBlock >> blockTextureLeft [
	"block texture if block has been moved left, defaults to the normal block texture"

	^ self blockTexture
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 14:44'
}
SIYBlock >> blockTextureRight [
	"block texture if block has been moved right, defaults to the normal block texture"

	^ self blockTexture
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 14:44'
}
SIYBlock >> blockTextureUp [
	"block texture if block has been moved up, defaults to the normal block texture"

	^ self blockTexture
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> cantMoveIn: aDirection [
	"gets called if block tries to move in specific direction, but can't"
	
	self isWeak 
		ifTrue: [self basicMove: aDirection.
			self rulebook invokeWeak: {self}.
			^ true].
	
	"we return false, because the block couldn't be moved"
	^ false
	
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/11/2024 21:19'
}
SIYBlock >> comeToFrontIfFloat [
	
	self isFloat ifTrue: [^ self comeToFront].
	
	(self neighborsHere anySatisfy: [:aBlock | aBlock isFloat])
		ifTrue: [^ self goBehind].
	
	self comeToFront
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 14:35'
}
SIYBlock >> coordX [
	"calculates and returns x coordinate within arena (rounded to nearest block)"
	
	^ 1 + (self relativePosition x / self arena pixelPerBlock) rounded
			clampLow: 1
			high: self arena arenaWidth
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'KD 2/1/2024 14:29'
}
SIYBlock >> coordX: aNumber [
	"set x coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self arena arenaWidth) - 1.
	aPoint := anotherNumber * self arena pixelPerBlock@self relativePosition y.
	super position: self arena position + aPoint.
	
	self postPositionRoutine
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 14:35'
}
SIYBlock >> coordY [
	"calculates and returns y coordinate within arena (rounded to nearest block)"

	^ 1 + (self relativePosition y / self arena pixelPerBlock) rounded
		clampLow: 1
		high: self arena arenaHeight
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'KD 2/1/2024 14:28'
}
SIYBlock >> coordY: aNumber [
	"set y coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self arena arenaHeight) - 1.
	aPoint := self relativePosition x@(anotherNumber * self arena pixelPerBlock).
	super position: self arena position + aPoint.
	
	self postPositionRoutine
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'KD 2/1/2024 14:28'
}
SIYBlock >> coords [
	
	^ self coordX@self coordY
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 14:35'
}
SIYBlock >> coords: aPoint [

	self coordX: aPoint x.
	self coordY: aPoint y
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> delete [
	
	self gameBoard saveBlock: self at: nil.
	super delete.
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'LK 1/5/2024 12:28'
}
SIYBlock >> deleteAndRemember [
	"deleting a block using this method, allows to undo the deletion"
	
	(self arena positionDictionary includesKey: self)
		ifFalse: [self arena positionDictionary at: self put: self coords].
		
	self delete
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 14:46'
}
SIYBlock >> duplicateMorph: evt [
	"makes block duplication with halo possible"
	
	^ self class newInArena: self arena at: self coords

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> gameBoard [

	^ self arena gameBoard
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'KD 2/1/2024 14:41'
}
SIYBlock >> getTextureForDirection: aPoint [
	"returns block texture for specified direction"

	aPoint caseOf: {
		[1@0] -> [^ self blockTextureRight].
		[-1@0] -> [^ self blockTextureLeft].
		[0@1] -> [^ self blockTextureDown].
		[0@ -1] -> [^ self blockTextureUp]
	} otherwise: [^ self blockTexture]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:57'
}
SIYBlock >> initialize [
	
	self setDefaultTexture.
	self arena addMorph: self.
	self updateGameBoard
	
	
	

	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/3/2024 23:47'
}
SIYBlock >> initializeInArena: anArena at: aPoint [

	self arena: anArena.
	super initialize.
	self coords: aPoint.
	self initialize
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:00'
}
SIYBlock >> isAndOperator [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isDefeat [

	^ self rulebook isDefeat: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isFloat [

	^ self rulebook isFloat: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isHot [

	^ self rulebook isHot: self
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:00'
}
SIYBlock >> isIsOperator [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isMelt [

	^ self rulebook isMelt: self
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 19:59'
}
SIYBlock >> isNoun [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isOpen [

	^ self rulebook isOpen: self
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:02'
}
SIYBlock >> isOperator [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 19:59'
}
SIYBlock >> isProperty [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isPush [

	^ self rulebook isPush: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isShut [

	^ self rulebook isShut: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isSink [

	^ self rulebook isSink: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isStop [

	^ self rulebook isStop: self
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 19:59'
}
SIYBlock >> isText [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isWeak [

	^ self rulebook isWeak: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isWin [

	^ self rulebook isWin: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> isYou [

	^ self rulebook isYou: self
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/3/2024 21:04'
}
SIYBlock >> move: aDirection [
	
	self move: aDirection pushedBy: SIYNullBlock new

]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/4/2024 15:17'
}
SIYBlock >> move: aDirection pushedBy: aBlock [
	"Moves this block in specified direction, while considering the rules that currently apply.
	Calling this method only has an effect, if the blocks in front of it allow it. 
	This method returns true/false, depending on whether the block who pushed this block
	(aBlock) should be able to move onto this blocks tile."
	
	| neighbours canMoveHere |
	
	neighbours := self gameBoard getBlocksOnTile: self coords + aDirection.
	
	canMoveHere := self rulebook checkMovementRulesFor: self 
		pushedBy: aBlock
		havingNeighbours: neighbours 
		inDirection: aDirection.
	canMoveHere ifNotNil: [^ canMoveHere].
	
	neighbours ifEmpty: [^ self basicMove: aDirection].
	neighbours ifNil: [^ self cantMoveIn: aDirection].
	
	(neighbours allSatisfy: [:each | each move: aDirection pushedBy: self])
		ifTrue: [^ self basicMove: aDirection]
		ifFalse: [^ self cantMoveIn: aDirection]

]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> neighborsAbove [
	"Return set of blocks at coords above.
	Returns empty set if none. Return nil if out of arena."
	
	^ self gameBoard getBlocksOnTile: 0@(-1) + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> neighborsBelow [
	"Return set of blocks at coords below.
	Returns empty set if none. Return nil if out of arena."
	
	^ self gameBoard getBlocksOnTile: 0@1 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> neighborsHere [
	"Return set of blocks at current coords.
	Returns empty set if none. Return nil if out of arena."
	
	^ self gameBoard getBlocksOnTile: self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> neighborsLeft [
	"Return set of blocks at coords to the left.
	Returns empty set if none. Return nil if out of arena."
	
	^ self gameBoard getBlocksOnTile: (-1)@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> neighborsRight [
	"Return set of blocks at coords to the right.
	Returns empty set if none. Return nil if out of arena."
	
	^ self gameBoard getBlocksOnTile: 1@0 + self coords
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/2/2024 12:56'
}
SIYBlock >> nounTexture [

	^ SubclassResponsibility
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 14:36'
}
SIYBlock >> position: aPoint [
	"overwritten position method forces blocks to stay aligned when moving
	them with the halo"
	
	super position: aPoint.
	self alignToGrid
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/15/2024 17:13'
}
SIYBlock >> postMoveRoutine: aDirection [
	"This routine gets triggered, after the block has been moved using basicMove,
	for example through keyboard inputs. It will NOT get triggered, if the block has been
	moved using the halo."

	self setTextureForDirection: aDirection
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/31/2024 22:57'
}
SIYBlock >> postPositionRoutine [
	"This routine gets triggered, after the block changed its position, no matter how.
	For example, this routine will also be triggered, if the block was moved through the halo."

	self updateGameBoard.
	
	"only come to front if game is unlocked, to prevent the block from overlapping
	the win animation"
	self arena isGameLocked ifFalse: [self comeToFrontIfFloat]
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/6/2024 18:17'
}
SIYBlock >> preMoveRoutine: aDirection [
	"This routine gets triggered, before the block will be moved using basicMove,
	for example through keyboard inputs. It will NOT get triggered, if the block will be
	moved using the halo."

	self arena positionDictionary at: self put: self coords

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 14:36'
}
SIYBlock >> relativePosition [
	"returns position relative to arena (measured in pixel)"

	^ self position - self arena position
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'LK 1/8/2024 23:24'
}
SIYBlock >> replaceWithAndRemember: aBlockClass [

	| aBlock |

	aBlock := aBlockClass newInArena: self arena at: self coords.
	self arena replacementSet add: aBlock.
	
	self deleteAndRemember
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 14:47'
}
SIYBlock >> respawn [
	"Makes a deleted block reappear."

	self openInWorld.
	self arena addMorph: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 22:59'
}
SIYBlock >> rulebook [

	^ self arena rulebook
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 14:46'
}
SIYBlock >> setDefaultTexture [

	self setTextureForDirection: 0@0
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'KD 2/1/2024 14:26'
}
SIYBlock >> setTextureForDirection: aPoint [

	| aForm |
	
	aForm := SIYTextureLoader new getTexture: (self getTextureForDirection: aPoint).
	
	self image: (aForm scaledToSize: self arena pixelPerBlock@self arena pixelPerBlock)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/4/2024 15:08'
}
SIYBlock >> symbol [

	^ nil
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYBlock >> updateGameBoard [
	"notifies blockMediator of current position"

	^ self gameBoard saveBlock: self at: self coords
]
