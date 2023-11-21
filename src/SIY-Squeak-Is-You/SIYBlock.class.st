Class {
	#name : #SIYBlock,
	#superclass : #Morph,
	#instVars : [
		'arena'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 11/21/2023 21:00'
}
SIYBlock class >> newInArena: arena [
	"create new block in SIY arena"

	^ (self basicNew arena: arena) initialize
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:44'
}
SIYBlock >> alignWithGrid [
	"align block with arena grid"

	self posX: self posX.
	self posY: self posY
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
	#'squeak_changestamp' : 'LK 11/21/2023 20:47'
}
SIYBlock >> arena: a [
	
	arena := a
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 11/21/2023 21:04'
}
SIYBlock >> initialize [
	
	super initialize.
	
	self width: arena pixelPerBlock.
	self height: arena pixelPerBlock.
	self color: Color white.
	
	arena addMorph: self.
	self position: arena position
	
	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:46'
}
SIYBlock >> posX [
	"x coordinate within arena (measured in blocks)"
	
	^ ((self relativePosition x) / (arena pixelPerBlock)) rounded

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:43'
}
SIYBlock >> posX: value [
	"set x coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: (value clampLow: 0 high: arena arenaWidth - 1) * arena pixelPerBlock
		setY: self relativePosition y.
	
	self position: arena position + newPos

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:43'
}
SIYBlock >> posX: valueX posY: valueY [

	self posX: valueX.
	self posY: valueY
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:46'
}
SIYBlock >> posY [
	"y coordinate within arena (measured in blocks)"
	
	^ ((self relativePosition y) / (arena pixelPerBlock)) rounded

	
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:43'
}
SIYBlock >> posY: value [
	"set y coordinate within arena (measured in blocks, clamped to arena dimensions)"
	
	| newPos |
	
	newPos := Point new
		setX: self relativePosition x
		setY: (value clampLow: 0 high: arena arenaHeight - 1) * arena pixelPerBlock.
	
	self position: arena position + newPos

]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 11/21/2023 21:12'
}
SIYBlock >> relativePosition [
	"position relative to Morph (measured in pixel)"

	^ self position - arena position
]
