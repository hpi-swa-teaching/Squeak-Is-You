Class {
	#name : #SIYLevelFactory,
	#superclass : #Object,
	#instVars : [
		'arena',
		'mediator'
	],
	#category : #'SIY-Squeak-Is-You'
}

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
	#'squeak_changestamp' : 'LK 1/3/2024 22:21'
}
SIYLevelFactory >> createLevel [
	
	arena := SIYArena newWithDimension: self arenaDimensions.
	
	self buildLevel.
	arena openInWorld.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/3/2024 22:22'
}
SIYLevelFactory >> initialize [

	super initialize.
	self createLevel
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
