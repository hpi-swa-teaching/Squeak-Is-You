"
The SIYLevelFactory is a factory for creating different levels. Each level builds and returns an arena.

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
	#'squeak_changestamp' : 'LK 2/4/2024 20:08'
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
	#'squeak_changestamp' : 'LK 1/15/2024 22:54'
}
SIYLevelFactory >> addBlock: aBlockClass at: aPoint [
	"place new block in arena, WITHOUT removing any block that was on the tile before"

	aBlockClass newInArena: self arena at: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/5/2023 10:45'
}
SIYLevelFactory >> arena [

	^ arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/11/2024 23:29'
}
SIYLevelFactory >> arena: anArena [

	arena := anArena
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
	#'squeak_changestamp' : 'LK 2/4/2024 20:08'
}
SIYLevelFactory >> arenaMargin [

	^ SIYFullscreenGame basicNew keyHintHeight / 2 + self defaultArenaMargin
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
	#'squeak_changestamp' : 'LK 1/11/2024 23:15'
}
SIYLevelFactory >> createLevelScaled: aFloat [
	
	self arena: (SIYArena newWithExtent: self arenaExtent scaled: aFloat).
	
	self buildLevel.
	self arena color: self backgroundColor.
	self arena openInWorld

]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 2/4/2024 20:08'
}
SIYLevelFactory >> defaultArenaMargin [

	^ 20 px
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:17'
}
SIYLevelFactory >> description [

	^ SubclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 18:33'
}
SIYLevelFactory >> gameBoard [

	^ self arena gameBoard
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
	#'squeak_changestamp' : 'LK 1/11/2024 23:32'
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
	#'squeak_changestamp' : 'LK 2/4/2024 19:25'
}
SIYLevelFactory >> placeBlock: aBlockClass at: aPoint [
	
	| anotherPoint |
	
	anotherPoint := self arena clampPointToArenaDimension: aPoint.
	
	self removeBlockAt: anotherPoint.
	aBlockClass newInArena: self arena at: anotherPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:10'
}
SIYLevelFactory >> placeHorizontalRule: aBlockClass and: anotherBlockClass is: aPropertyClass at: aPoint [
	
	self placeNounFor: aBlockClass at: -3@0 + aPoint;
		placeBlock: SIYAnd at: -2@0 + aPoint;
		placeHorizontalRule: anotherBlockClass is: aPropertyClass at: aPoint
	
	
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:10'
}
SIYLevelFactory >> placeHorizontalRule: aBlockClass is: aPropertyClass and: anotherPropertyClass at: aPoint [
	
	self placeHorizontalRule: aBlockClass is: aPropertyClass at: aPoint;
		placeBlock: SIYAnd at: 2@0 + aPoint;
		placeBlock: anotherPropertyClass at: 3@0 + aPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:10'
}
SIYLevelFactory >> placeHorizontalRule: aBlockClass is: aPropertyClass at: aPoint [

	self placeNounFor: aBlockClass at: -1@0 + aPoint;
		placeBlock: SIYIs at: aPoint;
		placeBlock: aPropertyClass at: 1@0 + aPoint
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
	#'squeak_changestamp' : 'LK 2/4/2024 20:10'
}
SIYLevelFactory >> placeMultipleBlocksHollow: aBlockClass from: firstPoint to: secondPoint [

	self placeMultipleBlocks: aBlockClass
			from: firstPoint
			to: (firstPoint x)@(secondPoint y);
		placeMultipleBlocks: aBlockClass
			from: firstPoint
			to: (secondPoint x)@(firstPoint y);
		placeMultipleBlocks: aBlockClass
			from: (firstPoint x)@(secondPoint y)
			to: secondPoint;
		placeMultipleBlocks: aBlockClass
			from: (secondPoint x)@(firstPoint y)
			to: secondPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:11'
}
SIYLevelFactory >> placeNounFor: aBlockClass at: aPoint [
	
	self removeBlockAt: aPoint.
	
	(SIYNoun newInArena: self arena at: aPoint)
		representsBlock: aBlockClass
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:11'
}
SIYLevelFactory >> placeVerticalRule: aBlockClass and: anotherBlockClass is: aPropertyClass at: aPoint [
	
	self placeNounFor: aBlockClass at: 0@(-3) + aPoint;
		placeBlock: SIYAnd at: 0@(-2) + aPoint;
		placeVerticalRule: anotherBlockClass is: aPropertyClass at: aPoint
	
	
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:11'
}
SIYLevelFactory >> placeVerticalRule: aBlockClass is: aPropertyClass and: anotherPropertyClass at: aPoint [
	
	self placeVerticalRule: aBlockClass is: aPropertyClass at: aPoint;
		placeBlock: SIYAnd at: 0@2 + aPoint;
		placeBlock: anotherPropertyClass at: 0@3 + aPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 2/4/2024 20:11'
}
SIYLevelFactory >> placeVerticalRule: aBlockClass is: aPropertyClass at: aPoint [
	
	self placeNounFor: aBlockClass at: 0@(-1) + aPoint;
		placeBlock: SIYIs at: aPoint;
		placeBlock: aPropertyClass at: 0@1 + aPoint
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
	#'squeak_changestamp' : 'LK 2/4/2024 20:11'
}
SIYLevelFactory >> removeBlockAt: aPoint [

	| anotherPoint |
	
	anotherPoint := self arena clampPointToArenaDimension: aPoint.

	(self gameBoard getBlocksOnTile: anotherPoint)
		do: [:each | each delete]
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/5/2024 16:23'
}
SIYLevelFactory >> removeMultipleBlocksAt: aCollection [
	
	aCollection do: [:aPoint | self removeBlockAt: aPoint]
]
