"
A SIYLevelFactory is a factory for creating diffrent levels.
Each level can build and return an arena.

Instance Variables
	arena: <SIYArena>
"
Class {
	#name : #SIYLevelFactory,
	#superclass : #Object,
	#instVars : [
		'arena'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:38'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/4/2024 22:10'
}
SIYLevelFactory class >> newWithScale: aFloat [

	^ (self basicNew initializeWithScale: aFloat)
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 12/5/2023 10:45'
}
SIYLevelFactory >> arena [

	^ arena
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevelFactory >> arenaExtent [

	^ SubclassResponsibility
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/5/2024 22:14'
}
SIYLevelFactory >> arenaMargin [
	"arena margin measured in pixel"

	^ SIYGame basicNew keyHintHeight / 2 + 20 px
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 13:30'
}
SIYLevelFactory >> backgroundColor [

	^ Color black
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/5/2023 13:29'
}
SIYLevelFactory >> buildLevel [

	^ SubclassResponsibility
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/5/2024 20:21'
}
SIYLevelFactory >> calculateScale [

	| aNumber |
	
	aNumber := (World clearArea extent x - (2 * self arenaMargin) / self arenaExtent x)
		min: (World clearArea extent y - (2 * self arenaMargin) / self arenaExtent y).
	
	^ aNumber / SIYArena basicNew textureSize
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 13:31'
}
SIYLevelFactory >> createLevelScaled: aFloat [
	
	arena := SIYArena newWithExtent: self arenaExtent scaled: aFloat.
	
	self buildLevel.
	self arena color: self backgroundColor.
	self arena openInWorld

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:17'
}
SIYLevelFactory >> description [

	^ SubclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:48'
}
SIYLevelFactory >> initialize [

	self initializeWithScale: self calculateScale
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:51'
}
SIYLevelFactory >> initializeWithScale: aFloat [
	
	super initialize.
	self createLevelScaled: (aFloat ifNil: [self calculateScale])
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 00:33'
}
SIYLevelFactory >> nextLevel [

	^ SubclassResponsibility
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 16:18'
}
SIYLevelFactory >> placeBlock: aBlockClass at: aPoint [
	"place new block in arena, remove the block that was on the tile before"

	self removeBlockAt: aPoint.
	aBlockClass newInArena: self arena at: aPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 00:30'
}
SIYLevelFactory >> placeHorizontalRule: aBlockClass is: aPropertyClass at: aPoint [
	"place horizontal rule, where aPoint is the coordinate of the SIYIs block"
	
	self placeNounFor: aBlockClass at: (-1)@0 + aPoint.
	self placeBlock: SIYIs at: aPoint.
	self placeBlock: aPropertyClass at: 1@0 + aPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 16:23'
}
SIYLevelFactory >> placeMultipleBlocks: aBlockClass at: aCollection [

	aCollection do: [:aPoint | self placeBlock: aBlockClass at: aPoint]
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 16:23'
}
SIYLevelFactory >> placeMultipleBlocks: aBlockClass from: firstPoint to: secondPoint [

	| incrementX incrementY |
	
	(firstPoint x < secondPoint x)
		ifTrue: [incrementX := 1]
		ifFalse: [incrementX := -1].
		
	(firstPoint y < secondPoint y)
		ifTrue: [incrementY := 1]
		ifFalse: [incrementY := -1].

	firstPoint x to: secondPoint x by: incrementX do: 
		[:coordX | firstPoint y to: secondPoint y by: incrementY do: 
			[:coordY | self placeBlock: aBlockClass at: coordX@coordY]].

]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 16:36'
}
SIYLevelFactory >> placeMultipleBlocksHollow: aBlockClass from: firstPoint to: secondPoint [

	self placeMultipleBlocks: aBlockClass
		from: firstPoint
		to: (firstPoint x)@(secondPoint y).
		
	self placeMultipleBlocks: aBlockClass
		from: firstPoint
		to: (secondPoint x)@(firstPoint y).
		
	self placeMultipleBlocks: aBlockClass
		from: (firstPoint x)@(secondPoint y)
		to: secondPoint.
		
	self placeMultipleBlocks: aBlockClass
		from: (secondPoint x)@(firstPoint y)
		to: secondPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 21:24'
}
SIYLevelFactory >> placeNounFor: aBlockClass at: aPoint [
	
	self removeBlockAt: aPoint.
	(SIYNoun newInArena: self arena at: aPoint)
		representsBlock: aBlockClass
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 00:30'
}
SIYLevelFactory >> placeVerticalRule: aBlockClass is: aPropertyClass at: aPoint [
	"place vertical rule, where aPoint is the coordinate of the SIYIs block"
	
	self placeNounFor: aBlockClass at: 0@(-1) + aPoint.
	self placeBlock: SIYIs at: aPoint.
	self placeBlock: aPropertyClass at: 0@1 + aPoint
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:21'
}
SIYLevelFactory >> previousLevel [

	^ SubclassResponsibility
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/6/2024 00:28'
}
SIYLevelFactory >> removeBlockAt: aPoint [
	"remove all blocks on specified tile"

	(self arena blockMediator getBlocks: aPoint)
		do: [:each | each delete]
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 16:23'
}
SIYLevelFactory >> removeMultipleBlocksAt: aCollection [
	
	aCollection do: [:aPoint | self removeBlockAt: aPoint]
]
