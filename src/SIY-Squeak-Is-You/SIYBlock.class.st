Class {
	#name : #SIYBlock,
	#superclass : #ImageMorph,
	#instVars : [
		'arena'
	],
	#category : #'SIY-Squeak-Is-You'
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
	#'squeak_changestamp' : 'LK 1/3/2024 20:15'
}
SIYBlock >> basicMove: aDirection [

	self preMoveRoutine: aDirection.
	self coords: self coords + aDirection.
	self postMoveRoutine: aDirection.
	
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
	#'squeak_changestamp' : 'LK 1/2/2024 16:52'
}
SIYBlock >> blockTextureDown [

	^ self blockTexture
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/2/2024 16:52'
}
SIYBlock >> blockTextureLeft [

	^ self blockTexture
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/2/2024 16:52'
}
SIYBlock >> blockTextureRight [

	^ self blockTexture
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/2/2024 16:52'
}
SIYBlock >> blockTextureUp [

	^ self blockTexture
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 00:08'
}
SIYBlock >> coordX [
	"x coordinate within arena (rounded to nearest block)"
	
	^ 1 + (self relativePosition x / self arena pixelPerBlock) rounded
			clampLow: 1
			high: self arena arenaWidth
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/4/2024 00:15'
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
	#'squeak_changestamp' : 'LK 1/4/2024 00:09'
}
SIYBlock >> coordY [
	"y coordinate within arena (rounded to nearest block)"

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
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 11:59'
}
SIYBlock >> coords: aPoint [
	"place block at coordinates clamped within arena"

	self coordX: aPoint x.
	self coordY: aPoint y
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'LK 1/4/2024 00:05'
}
SIYBlock >> delete [
	
	self blockMediator rememberBlock: self withPos: nil.
	super delete.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 00:06'
}
SIYBlock >> duplicateMorph: evt [
	
	^ self class newInArena: self arena at: self coords.

]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 00:05'
}
SIYBlock >> getTextureForDirection: aPoint [

	aPoint caseOf: {
		[1@0] -> [^ self blockTextureRight].
		[(-1)@0] -> [^ self blockTextureLeft].
		[0@1] -> [^ self blockTextureDown].
		[0@(-1)] -> [^ self blockTextureUp]
	} otherwise: [^ self blockTexture]
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/3/2024 22:34'
}
SIYBlock >> informMediator [

	^ self blockMediator rememberBlock: self withPos: self coords
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
	#'squeak_changestamp' : 'LK 1/3/2024 19:41'
}
SIYBlock >> isPush [

	^ self ruleManager isPush: self
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
	#'squeak_changestamp' : 'LK 1/3/2024 22:34'
}
SIYBlock >> move: aDirection [
	
	| neighbours |
	
	neighbours := self blockMediator requestPos: (self coords + aDirection).
		
	(self isStop) ifTrue: [^ false].
	(self isPush or: self isYou) ifFalse: [^ true].
	(neighbours isNil) ifTrue: [^ false].
	(neighbours anySatisfy: [:each | each isStop]) ifTrue: [^ false].
	
	(neighbours size = 0)
		ifTrue: [^ self basicMove: aDirection]
		ifFalse: [(neighbours allSatisfy: [:each | each move: aDirection])
					ifTrue: [^ self basicMove: aDirection]
					ifFalse: [^ false]]

]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:34'
}
SIYBlock >> neighborsAbove [
	"Return set of neighbor blocks (objects) at coords above.
	Return empty set if none. Return nil if out of arena."
	
	^ self blockMediator requestPos: (-1)@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:34'
}
SIYBlock >> neighborsBelow [
	"Return set of neighbor blocks (objects) at coords below.
	Return empty set if none. Return nil if out of arena."
	
	^ self blockMediator requestPos: 1@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:35'
}
SIYBlock >> neighborsHere [
	"Return set of neighbor blocks (objects) at coords where self is right now.
	Return empty set if none. Return nil if out of arena."
	
	^ self blockMediator requestPos: self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:35'
}
SIYBlock >> neighborsLeft [
	"Return set of neighbor blocks (objects) at coords to the left.
	Return empty set if none. Return nil if out of arena."
	
	^ self blockMediator requestPos: 0@(-1) + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:35'
}
SIYBlock >> neighborsRight [
	"Return set of neighbor blocks (objects) at coords to the right.
	Return empty set if none. Return nil if out of arena."
	
	^ self blockMediator requestPos: 0@1 + self coords
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
	#'squeak_changestamp' : 'LK 12/21/2023 16:26'
}
SIYBlock >> position: aPoint [
	"Overwritten position method forces blocks to stay aligned when moving with halo."
	
	super position: aPoint.
	self alignToGrid
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/4/2024 00:02'
}
SIYBlock >> postMoveRoutine: aDirection [

	self setTextureForDirection: aDirection.
	self ruleManager checkRulesFor: self
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/3/2024 23:16'
}
SIYBlock >> postPositionRoutine [

	self informMediator.
	self ruleManager updateRulesInArena: self
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 1/3/2024 22:36'
}
SIYBlock >> preMoveRoutine: aDirection [

	self arena positionDictionary at: self put: self coords.

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 1/3/2024 22:36'
}
SIYBlock >> relativePosition [
	"returns position relative to Morph (measured in pixel)"

	^ self position - self arena position
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/21/2023 22:16'
}
SIYBlock >> respawn [

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
	#'squeak_changestamp' : 'LK 1/4/2024 00:02'
}
SIYBlock >> setDefaultTexture [

	self setTextureForDirection: 0@0
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/4/2024 00:02'
}
SIYBlock >> setTextureForDirection: aPoint [

	self image: (SIYTextureManager new getTexture: (self getTextureForDirection: aPoint)).
]
