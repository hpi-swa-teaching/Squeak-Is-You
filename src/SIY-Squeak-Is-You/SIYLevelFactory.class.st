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
	#'squeak_changestamp' : 'LK 12/6/2023 20:54'
}
SIYLevelFactory >> createLevel [

	arena := SIYArena newWithDimension: self arenaDimensions.
	
	arena mediator: (SIYMediator newForArena: arena).
	arena ruleManager: (SIYRuleManager new).
	
	self buildLevel.
	
	arena openInWorld.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/5/2023 11:51'
}
SIYLevelFactory >> initialize [

	super initialize.
	
	self createLevel.
	
	^ self
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
	#'squeak_changestamp' : 'LK 12/7/2023 21:29'
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
		to: secondPoint - (0@1).
]
