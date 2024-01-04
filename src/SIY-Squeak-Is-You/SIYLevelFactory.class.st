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
	#'squeak_changestamp' : 'LK 12/5/2023 13:29'
}
SIYLevelFactory >> arenaDimensions [

	^ SubclassResponsibility
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/5/2023 13:29'
}
SIYLevelFactory >> buildLevel [

	^ SubclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:19'
}
SIYLevelFactory >> createLevelScaled: aFloat [
	
	arena := SIYArena newWithExtent: self arenaDimensions scaled: aFloat * self scaleLevel.
	
	self buildLevel.
	arena openInWorld.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:06'
}
SIYLevelFactory >> initialize [

	self initializeWithScale: 1
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/4/2024 22:06'
}
SIYLevelFactory >> initializeWithScale: aFloat [

	super initialize.
	self createLevelScaled: aFloat
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
	#'squeak_changestamp' : 'LK 1/2/2024 13:15'
}
SIYLevelFactory >> placeNounFor: aBlockClass at: aPoint [
	
	(SIYNoun newInArena: self arena at: aPoint)
		representsBlock: aBlockClass
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:21'
}
SIYLevelFactory >> previousLevel [

	^ SubclassResponsibility
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 21:57'
}
SIYLevelFactory >> scaleLevel [

	^ 1
]
