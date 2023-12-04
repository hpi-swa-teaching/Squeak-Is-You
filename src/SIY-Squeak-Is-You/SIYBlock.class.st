Class {
	#name : #SIYBlock,
	#superclass : #ImageMorph,
	#instVars : [
		'arena'
	],
	#classInstVars : [
		'isYou'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #operators,
	#'squeak_changestamp' : 'LK 12/3/2023 21:01'
}
SIYBlock class >> isYou [

	^ isYou
]

{
	#category : #operators,
	#'squeak_changestamp' : 'LK 12/3/2023 21:01'
}
SIYBlock class >> isYou: aBoolean [

	isYou := aBoolean
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
	#'squeak_changestamp' : 'LK 12/4/2023 16:57'
}
SIYBlock class >> newInArena: anArena at: aPoint [
	"create new block in SIY arena at given coordinates"

	^ (self basicNew arena: anArena) initialize; coords: aPoint; yourself
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
	#'squeak_changestamp' : 'LK 12/4/2023 17:00'
}
SIYBlock >> arena: anArena [
	
	arena := anArena
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 16:52'
}
SIYBlock >> coordX [
	"x coordinate within arena (rounded to nearest block)"
	
	^ ((self relativePosition x) / (arena pixelPerBlock)) rounded

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 17:00'
}
SIYBlock >> coordX: aNumber [
	"set x coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: (aNumber clampLow: 0 high: arena arenaWidth - 1) * arena pixelPerBlock
		setY: self relativePosition y.
	
	super position: arena position + newPos

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 16:52'
}
SIYBlock >> coordY [
	"y coordinate within arena (rounded to nearest block)"
	
	^ ((self relativePosition y) / (arena pixelPerBlock)) rounded

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 12/4/2023 17:00'
}
SIYBlock >> coordY: aNumber [
	"set y coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: self relativePosition x
		setY: (aNumber clampLow: 0 high: arena arenaHeight - 1) * arena pixelPerBlock.
	
	super position: arena position + newPos

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
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/4/2023 17:01'
}
SIYBlock >> initialize [
	
	super initialize.
	
	self image: (Form fromFileNamed: self textureFile).
	arena addMorph: self.
	
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 12/4/2023 16:49'
}
SIYBlock >> move [

	(arena gmIsKeyPressed: Character arrowUp)
		ifTrue: [self coordY: self coordY -1].
	(arena gmIsKeyPressed: Character arrowDown)
		ifTrue: [self coordY: self coordY +1].
	(arena gmIsKeyPressed: Character arrowRight)
		ifTrue: [self coordX: self coordX +1].
	(arena gmIsKeyPressed: Character arrowLeft)
		ifTrue: [self coordX: self coordX -1].
	
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
	#'squeak_changestamp' : 'LK 12/3/2023 21:13'
}
SIYBlock >> step [
	"comment stating purpose of message"

	(self class isYou)
		ifTrue: [self move].

]

{
	#category : #movement,
	#'squeak_changestamp' : 'jt 11/30/2023 22:19'
}
SIYBlock >> stepTime [
	
	^ 125
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LK 12/3/2023 20:50'
}
SIYBlock >> textureFile [

	^ SubclassResponsibility
]
