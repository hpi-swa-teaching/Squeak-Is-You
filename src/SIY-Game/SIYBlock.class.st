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
	#'squeak_changestamp' : 'LK 1/4/2024 14:26'
}
SIYBlock >> basicMove: aDirection [
	"Moves this block in specified direction, WITHOUT considering the rules that currently apply.
	For example, calling this method won't push other blocks that are in the way."

	self preMoveRoutine: aDirection.
	self coords: self coords + aDirection.
	self postMoveRoutine: aDirection.
	
	"we return true, because the block was successfully moved"
	^ true

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:31'
}
SIYBlock >> blockMediator [

	^ self arena blockMediator
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
	#'squeak_changestamp' : 'LK 1/4/2024 14:35'
}
SIYBlock >> coordX: aNumber [
	"set x coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self arena arenaWidth) - 1.
	aPoint := (anotherNumber * self arena pixelPerBlock)@(self relativePosition y).
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
	#'squeak_changestamp' : 'LK 1/4/2024 00:17'
}
SIYBlock >> coordY: aNumber [
	"set y coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self arena arenaHeight) - 1.
	aPoint := (self relativePosition x)@(anotherNumber * self arena pixelPerBlock).
	super position: self arena position + aPoint.
	
	self postPositionRoutine
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 17:03'
}
SIYBlock >> coords [
	
	^ (self coordX)@(self coordY)
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
	#'squeak_changestamp' : 'LK 1/4/2024 17:03'
}
SIYBlock >> delete [
	
	self blockMediator saveBlock: self at: nil.
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
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 14:45'
}
SIYBlock >> getTextureForDirection: aPoint [
	"returns block texture for specified direction"

	aPoint caseOf: {
		[1@0] -> [^ self blockTextureRight].
		[(-1)@0] -> [^ self blockTextureLeft].
		[0@1] -> [^ self blockTextureDown].
		[0@(-1)] -> [^ self blockTextureUp]
	} otherwise: [^ self blockTexture]
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 15:29'
}
SIYBlock >> informMediator [
	"notifies blockMediator of current position"

	^ self blockMediator saveBlock: self at: self coords
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 00:02'
}
SIYBlock >> initialize [
	
	self setDefaultTexture.
	self arena addMorph: self.
	self informMediator
	
	
	

	
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
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 19:41'
}
SIYBlock >> isDefeat [

	^ self ruleManager isDefeat: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/5/2024 14:19'
}
SIYBlock >> isHot [

	^ self ruleManager isHot: self
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/5/2024 14:19'
}
SIYBlock >> isMelt [

	^ self ruleManager isMelt: self
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/4/2024 18:20'
}
SIYBlock >> isOpen [

	^ self ruleManager isOpen: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 19:41'
}
SIYBlock >> isPush [

	^ self ruleManager isPush: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'KD 1/4/2024 17:03'
}
SIYBlock >> isShut [

	^ self ruleManager isShut: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'KD 1/4/2024 16:31'
}
SIYBlock >> isSink [

	^ self ruleManager isSink: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 19:39'
}
SIYBlock >> isStop [

	^ self ruleManager isStop: self
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 19:41'
}
SIYBlock >> isWin [

	^ self ruleManager isWin: self
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 19:39'
}
SIYBlock >> isYou [

	^ self ruleManager isYou: self
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 18:11'
}
SIYBlock >> move: aDirection [
	
	self move: aDirection pushedBy: nil

]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 18:23'
}
SIYBlock >> move: aDirection pushedBy: aBlock [
	"Moves this block in specified direction, while considering the rules that currently apply.
	For example, calling this method only has an effect, if the block is able to move. It might
	also push other blocks."
	
	| neighbours |
	
	neighbours := self blockMediator getBlocks: (self coords + aDirection).
	
	"check rules for isShut & isOpen"
	aBlock ifNotNil: [(self isShut and: aBlock isOpen) ifTrue: [^ true]].
	
	"check for rules, which would prevent this block from moving"
	(self isStop) ifTrue: [^ false].
	(self isPush or: self isYou) ifFalse: [^ true].
	(neighbours isNil) ifTrue: [^ false].
	(neighbours anySatisfy: [:each | each isStop and: (each isShut and: self isOpen) not])
		ifTrue: [^ false].
	
	"if there are any blocks in the way, try recursively moving them too"
	(neighbours size = 0)
		ifTrue: [^ self basicMove: aDirection]
		ifFalse: [(neighbours allSatisfy: [:each | each move: aDirection pushedBy: self])
					ifTrue: [^ self basicMove: aDirection]
					ifFalse: [^ false]]

]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/4/2024 15:29'
}
SIYBlock >> neighborsAbove [
	"Return set of blocks at coords above.
	Returns empty set if none. Return nil if out of arena."
	
	^ self blockMediator getBlocks: (-1)@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/4/2024 15:29'
}
SIYBlock >> neighborsBelow [
	"Return set of blocks at coords below.
	Returns empty set if none. Return nil if out of arena."
	
	^ self blockMediator getBlocks: 1@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/4/2024 15:29'
}
SIYBlock >> neighborsHere [
	"Return set of blocks at current coords.
	Returns empty set if none. Return nil if out of arena."
	
	^ self blockMediator getBlocks: self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/4/2024 15:29'
}
SIYBlock >> neighborsLeft [
	"Return set of blocks at coords to the left.
	Returns empty set if none. Return nil if out of arena."
	
	^ self blockMediator getBlocks: 0@(-1) + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/4/2024 15:29'
}
SIYBlock >> neighborsRight [
	"Return set of blocks at coords to the right.
	Returns empty set if none. Return nil if out of arena."
	
	^ self blockMediator getBlocks: 0@1 + self coords
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
	#'squeak_changestamp' : 'LK 1/4/2024 14:30'
}
SIYBlock >> postMoveRoutine: aDirection [
	"This routine gets triggered, after the block has been moved using basicMove,
	for example through keyboard inputs. It will NOT get triggered, if the block has been
	moved using the halo."

	self setTextureForDirection: aDirection.
	self ruleManager checkRulesFor: self
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/5/2024 18:12'
}
SIYBlock >> postPositionRoutine [
	"This routine gets triggered, after the block changed its position, no matter how.
	For example, this routine will also be triggered, if the block was moved through the halo."

	self informMediator.
	self comeToFront
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 14:31'
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
	#'squeak_changestamp' : 'LK 1/3/2024 22:26'
}
SIYBlock >> ruleManager [

	^ self arena ruleManager
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
	#'squeak_changestamp' : 'LK 1/5/2024 19:29'
}
SIYBlock >> setTextureForDirection: aPoint [

	| aForm |
	
	aForm := SIYTextureManager new getTexture: (self getTextureForDirection: aPoint).
	
	self image: (aForm scaledToSize: (self arena pixelPerBlock)@(self arena pixelPerBlock))
]
