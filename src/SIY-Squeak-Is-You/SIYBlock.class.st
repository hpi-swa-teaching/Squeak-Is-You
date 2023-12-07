Class {
	#name : #SIYBlock,
	#superclass : #ImageMorph,
	#instVars : [
		'arena',
		'stepTime',
		'mediator',
		'rules'
	],
	#classInstVars : [
		'isYou'
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
	#'squeak_changestamp' : 'LK 12/6/2023 21:39'
}
SIYBlock class >> newInArena: anArena at: aPoint [
	"create new block in SIY arena at given coordinates"

	^ (self basicNew arena: anArena) superInitialize; coords: aPoint; initialize; yourself
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 17:00'
}
SIYBlock >> alignToGrid [

	self coordX: self coordX.
	self coordY: self coordY
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
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/6/2023 21:13'
}
SIYBlock >> coordX [
	"x coordinate within arena (rounded to nearest block)"
	
	^ ((self relativePosition x) / (arena pixelPerBlock)) rounded + 1

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/6/2023 21:50'
}
SIYBlock >> coordX: aNumber [
	"set x coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: ((aNumber clampLow: 1 high: arena arenaWidth ) - 1) * arena pixelPerBlock
		setY: self relativePosition y.
	
	super position: arena position + newPos.
	
	self informMediator

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/6/2023 21:13'
}
SIYBlock >> coordY [
	"y coordinate within arena (rounded to nearest block)"
	
	^ ((self relativePosition y) / (arena pixelPerBlock)) rounded + 1

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/6/2023 21:50'
}
SIYBlock >> coordY: aNumber [
	"set y coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: self relativePosition x
		setY: ((aNumber clampLow: 1 high: arena arenaHeight) - 1)* arena pixelPerBlock.
	
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
	#'squeak_changestamp' : 'LK 12/4/2023 17:03'
}
SIYBlock >> coords: aPoint [
	"place block at coordinates clamped within arena"

	self coordX: aPoint x.
	self coordY: aPoint y
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
	#'squeak_changestamp' : 'LK 12/6/2023 22:00'
}
SIYBlock >> informMediator [

	^ (mediator notNil) ifTrue: [mediator notify: self with: self coords]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 21:38'
}
SIYBlock >> initialize [
	
	self stepTime: self stepRefreshTime.
	
	self image: (SIYTextureManager new getTexture: self textureFile).
	
	arena addMorph: self.
	rules := arena ruleManager.
	mediator := arena mediator.
	mediator notify: self with: self coords
	
	
	

	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/6/2023 21:58'
}
SIYBlock >> move [
	"needs refactoring"
	
	(arena gmIsKeyPressed: Character arrowUp)
		ifTrue: [self moveUp. self stepTime: self stepInbetweenTime]
		ifFalse: [
	(arena gmIsKeyPressed: Character arrowDown)
		ifTrue: [self moveDown. self stepTime: self stepInbetweenTime]
		ifFalse: [
	(arena gmIsKeyPressed: Character arrowRight)
		ifTrue: [self moveRight. self stepTime: self stepInbetweenTime]
		ifFalse: [
	(arena gmIsKeyPressed: Character arrowLeft)
		ifTrue: [self moveLeft. self stepTime: self stepInbetweenTime]
		ifFalse: [self stepTime: self stepRefreshTime]
	]]].
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/6/2023 22:01'
}
SIYBlock >> moveDirection: aPoint [
	
	| neighbours |
	
	neighbours := mediator request: (self coords + aPoint).
	
	(neighbours isNil)
		ifTrue: [^ false].
		
	(rules isStop: self)
		ifTrue: [^ false].
		
	((rules isPush: self) or: (rules isYou: self)) not
		ifTrue: [^ true].
	
	(neighbours size = 0)
		ifTrue: [self coords: self coords + aPoint. ^ true]
		ifFalse: [
			(neighbours allSatisfy: [:each | each moveDirection: aPoint])
				ifTrue: [self coords: self coords + aPoint. ^ true]
				ifFalse: [^ false]
			]
		
	

]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/6/2023 21:57'
}
SIYBlock >> moveDown [
	
	^ self moveDirection: 0@1
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/6/2023 21:57'
}
SIYBlock >> moveLeft [
	
	^ self moveDirection: (-1)@0
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/6/2023 21:57'
}
SIYBlock >> moveRight [
	
	^ self moveDirection: 1@0
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/6/2023 21:42'
}
SIYBlock >> moveUp [
	
	^ self moveDirection: 0@(-1)
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/6/2023 22:25'
}
SIYBlock >> neighborsAbove [
	"Return set of neighbor blocks (objects) at coords above.
	Return empty set if none. Return nil if out of arena."
	
	| currentPosition abovePosition |
	currentPosition := self coords.
	abovePosition := [(currentPosition x) - 1 @ currentPosition y].
	
	^mediator request: abovePosition
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/6/2023 22:25'
}
SIYBlock >> neighborsBelow [
	"Return set of neighbor blocks (objects) at coords below.
	Return empty set if none. Return nil if out of arena."
	
	| currentPosition belowPosition |
	currentPosition := self coords.
	belowPosition := [(currentPosition x) + 1 @ currentPosition y].
	
	^mediator request: belowPosition
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/6/2023 22:25'
}
SIYBlock >> neighborsHere [
	"Return set of neighbor blocks (objects) at coords where self is right now.
	Return empty set if none. Return nil if out of arena."
	
	^mediator request: self coords
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/6/2023 22:25'
}
SIYBlock >> neighborsLeft [
	"Return set of neighbor blocks (objects) at coords to the left.
	Return empty set if none. Return nil if out of arena."
	
	| currentPosition leftPosition |
	currentPosition := self coords.
	leftPosition := [currentPosition @ currentPosition - 1].
	
	^mediator request: leftPosition
]

{
	#category : #'neighbour sensing',
	#'squeak_changestamp' : 'LK 12/6/2023 22:25'
}
SIYBlock >> neighborsRight [
	"Return set of neighbor blocks (objects) at coords to the right.
	Return empty set if none. Return nil if out of arena."
	
	| currentPosition rightPosition |
	currentPosition := self coords.
	rightPosition := [currentPosition @ currentPosition + 1].
	
	^mediator request: rightPosition
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 16:51'
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
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/4/2023 18:18'
}
SIYBlock >> step [

	(SIYRuleManager new isYou: self)
		ifTrue: [self move].

]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/5/2023 13:31'
}
SIYBlock >> stepInbetweenTime [

	^ 185
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/5/2023 13:31'
}
SIYBlock >> stepRefreshTime [

	^ 1
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/4/2023 18:21'
}
SIYBlock >> stepTime [
	
	^ stepTime
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/4/2023 17:12'
}
SIYBlock >> stepTime: aNumber [

	stepTime := aNumber

	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 21:39'
}
SIYBlock >> superInitialize [

	super initialize
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 12/4/2023 17:09'
}
SIYBlock >> textureFile [

	^ SubclassResponsibility
]
