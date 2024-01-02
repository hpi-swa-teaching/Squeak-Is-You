Class {
	#name : #SIYBlock,
	#superclass : #ImageMorph,
	#instVars : [
		'arena',
		'stepTime',
		'mediator',
		'rules'
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
	#'squeak_changestamp' : 'LK 12/8/2023 11:07'
}
SIYBlock class >> newInArena: anArena at: aPoint [
	"create new block in SIY arena at given coordinates"

	^ (self basicNew arena: anArena) superInitialize;
		coords: aPoint;
		initialize;
		yourself
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/7/2023 21:15'
}
SIYBlock >> alignToGrid [

	self coordX: self coordX.
	self coordY: self coordY.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 11/21/2023 20:47'
}
SIYBlock >> arena [
	
	^ arena
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 21:24'
}
SIYBlock >> arena: anArena [
	
	arena := anArena.
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYBlock >> blockTexture [

	^ SubclassResponsibility
]

{
	#category : #rules,
	#'squeak_changestamp' : 'LK 12/21/2023 18:19'
}
SIYBlock >> checkRulesAtCurrentTile [
	"Method to invoke location based rules"

	| currentTile |
	currentTile := self neighborsHere.
	
	"isDefeat"
	(currentTile anySatisfy: [:each | rules isDefeat: each])
				ifTrue: [rules invokeDeath: self].
	
	"isWin"
	(rules isYou: self) 
		ifTrue:	[(currentTile  anySatisfy: [:each | rules isWin: each])
			  		ifTrue: [rules invokeWin: self]]
				
	
	
	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/7/2023 21:03'
}
SIYBlock >> coordX [
	"x coordinate within arena (rounded to nearest block)"
	
	^ (((self relativePosition x) / (arena pixelPerBlock)) rounded + 1) clampLow: 1 high: arena arenaWidth
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/21/2023 16:31'
}
SIYBlock >> coordX: aNumber [
	"set x coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: ((aNumber clampLow: 1 high: arena arenaWidth ) - 1) * arena pixelPerBlock
		setY: self relativePosition y.
	
	super position: arena position + newPos.
	
	self informMediator.

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/7/2023 21:02'
}
SIYBlock >> coordY [
	"y coordinate within arena (rounded to nearest block)"
	
	^ (((self relativePosition y) / (arena pixelPerBlock)) rounded + 1) clampLow: 1 high: arena arenaHeight

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/7/2023 20:49'
}
SIYBlock >> coordY: aNumber [
	"set y coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: self relativePosition x
		setY: ((aNumber clampLow: 1 high: arena arenaHeight) - 1) * arena pixelPerBlock.
	
	super position: arena position + newPos.
	
	self informMediator

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
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/19/2023 00:08'
}
SIYBlock >> delete [
	
	mediator rememberBlock: self withPos: nil.
	
	super delete.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/12/2023 11:10'
}
SIYBlock >> duplicateMorph: evt [
	
	| dup |
	
	dup := self class newInArena: arena at: self coords.

	^ dup
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 12/3/2023 20:26'
}
SIYBlock >> imageForm [

	^ SubclassResponsibility
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/15/2023 13:44'
}
SIYBlock >> informMediator [

	^ (mediator notNil) ifTrue: [mediator rememberBlock: self withPos: self coords]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYBlock >> initialize [
	
	self image: (SIYTextureManager new getTexture: self blockTexture).
	
	arena addMorph: self.
	
	rules := arena ruleManager.
	mediator := arena mediator.
	mediator rememberBlock: self withPos: self coords
	
	
	

	
]

{
	#category : #rules,
	#'squeak_changestamp' : 'LK 12/31/2023 20:22'
}
SIYBlock >> moveDirection: aPoint [
	
	| neighbours |
	neighbours := mediator requestPos: (self coords + aPoint).
		
	(rules isStop: self)
		ifTrue: [^ false].
	
	((rules isPush: self) not and: (rules isYou: self) not)
		ifTrue: [^ true].
		
	(neighbours isNil)
		ifTrue: [^ false].
	
	(neighbours size = 0)
		ifTrue: [
			arena blockPositionDict at: (self) put: (self coords). 
			self coords: self coords + aPoint.
			^ true]
		ifFalse: [
			(neighbours allSatisfy: [:each | each moveDirection: aPoint])
				ifTrue: [
					arena blockPositionDict at: (self) put: (self coords). 
					self coords: self coords + aPoint.
					self checkRulesAtCurrentTile.
					^ true]
				ifFalse: [^ false]
			]
		
	
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/31/2023 16:22'
}
SIYBlock >> neighborsAbove [
	"Return set of neighbor blocks (objects) at coords above.
	Return empty set if none. Return nil if out of arena."
	
	^ mediator requestPos: (-1)@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/31/2023 16:23'
}
SIYBlock >> neighborsBelow [
	"Return set of neighbor blocks (objects) at coords below.
	Return empty set if none. Return nil if out of arena."
	
	^ mediator requestPos: 1@0 + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/15/2023 19:51'
}
SIYBlock >> neighborsHere [
	"Return set of neighbor blocks (objects) at coords where self is right now.
	Return empty set if none. Return nil if out of arena."
	
	^ mediator requestPos: self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/31/2023 16:23'
}
SIYBlock >> neighborsLeft [
	"Return set of neighbor blocks (objects) at coords to the left.
	Return empty set if none. Return nil if out of arena."
	
	^ mediator requestPos: 0@(-1) + self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/31/2023 16:23'
}
SIYBlock >> neighborsRight [
	"Return set of neighbor blocks (objects) at coords to the right.
	Return empty set if none. Return nil if out of arena."
	
	^ mediator requestPos: 0@1 + self coords
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
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 16:51'
}
SIYBlock >> relativePosition [
	"returns position relative to Morph (measured in pixel)"

	^ self position - arena position
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
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 21:39'
}
SIYBlock >> superInitialize [

	super initialize
]
