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
	#category : #'SIY-Squeak-Is-You',
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
	#'squeak_changestamp' : 'LK 1/4/2024 23:01'
}
SIYLevelFactory >> arenaMargin [
	"arena margin measured in blocks"

	^ 1
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
	#'squeak_changestamp' : 'LK 1/4/2024 23:01'
}
SIYLevelFactory >> calculateScale [

	| aFloat |
	
	aFloat := Display extent x / (self arenaExtent x + self arenaMargin).
	aFloat := aFloat clampHigh: Display extent y / (self arenaExtent y + self arenaMargin).
	
	^ aFloat / 72
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/4/2024 22:44'
}
SIYLevelFactory >> createLevelScaled: aFloat [
	
	arena := SIYArena newWithExtent: self arenaExtent scaled: aFloat.
	
	self buildLevel.
	arena openInWorld.
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
	#'squeak_changestamp' : 'LK 12/5/2023 11:33'
}
SIYLevelFactory >> placeBlock: aBlockClass at: aPoint [

	aBlockClass newInArena: self arena at: aPoint
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 12/5/2023 11:40'
}
SIYLevelFactory >> placeBlocks: aBlockClass from: firstPoint to: secondPoint [

	(firstPoint x) to: (secondPoint x) do: 
		[:coordX | (firstPoint y) to: (secondPoint y) do: 
			[:coordY | self placeBlock: aBlockClass at: coordX@coordY]]
]

{
	#category : #'level building',
	#'squeak_changestamp' : 'LK 1/4/2024 00:33'
}
SIYLevelFactory >> placeBlocksHollow: aBlockClass from: firstPoint to: secondPoint [

	self placeBlocks: aBlockClass
		from: firstPoint
		to: (firstPoint x)@(secondPoint y).
		
	self placeBlocks: aBlockClass
		from: firstPoint + (1@0)
		to: (secondPoint x)@(firstPoint y).
		
	self placeBlocks: aBlockClass
		from: (firstPoint x)@(secondPoint y) + (1@0)
		to: secondPoint.
		
	self placeBlocks: aBlockClass
		from: (secondPoint x)@(firstPoint y) + (0@1)
		to: secondPoint - (0@1)
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
	#'squeak_changestamp' : 'LK 1/2/2024 13:15'
}
SIYLevelFactory >> placeNounFor: aBlockClass at: aPoint [
	
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
