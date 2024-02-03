"
The SIYGameBoard is an interface for accessing other blocks in the same arena.

Instance Variables
	arena: <SIYArena>
	gameBoard: <Matrix>

"
Class {
	#name : #SIYGameBoard,
	#superclass : #Object,
	#instVars : [
		'arena',
		'boardMatrix'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'KD 2/1/2024 14:03'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 12/6/2023 20:03'
}
SIYGameBoard class >> newForArena: anArena [

	^ (self basicNew) arena: anArena; initialize; yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:38'
}
SIYGameBoard >> arena [

	^ arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/6/2023 19:59'
}
SIYGameBoard >> arena: anArena [

	arena := anArena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 2/1/2024 15:02'
}
SIYGameBoard >> createBoardMatrix [
	"returns a matrix with the size of the arena, initialized with an empty sets"

	| aMatrix |

	aMatrix := Matrix rows: self arena arenaWidth columns: self arena arenaHeight.
	
	1 to: self arena arenaWidth
		do: [:x | 1 to: self arena arenaHeight
			do: [:y | aMatrix at: x at: y put: Set new]].
	
	^ aMatrix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 22:56'
}
SIYGameBoard >> gameBoard [

	^ boardMatrix ifNil: [boardMatrix := self createBoardMatrix]
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 2/3/2024 20:15'
}
SIYGameBoard >> getBlocksFromBottom [
	"Returns array of blocks in arena, reverse ordered by y coordinate"
	
	^ self getBlocksFromTop reversed
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 2/3/2024 20:15'
}
SIYGameBoard >> getBlocksFromDirection: aPoint [
	
	aPoint caseOf: {
		[1@0] -> [^ self getBlocksFromRight].
		[-1@0] -> [^ self getBlocksFromLeft].
		[0@1] -> [^ self getBlocksFromBottom].
		[0@ -1] -> [^ self getBlocksFromTop]
	}
	
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 2/3/2024 20:15'
}
SIYGameBoard >> getBlocksFromLeft [
	"Returns array of blocks in arena, ordered by x coordinate"
	
	| aCollection |
	
	aCollection := OrderedCollection new.
	
	1 to: self arena arenaHeight
		do: [:y | (1 to: self arena arenaWidth)
			do: [:x | (self gameBoard at: x at: y)
				do: [:aBlock | aCollection add: aBlock]]].

	^ aCollection
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 2/3/2024 20:15'
}
SIYGameBoard >> getBlocksFromRight [
	"Returns array of blocks in arena, reverse ordered by x coordinate"

	^ self getBlocksFromLeft reversed
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 2/3/2024 20:14'
}
SIYGameBoard >> getBlocksFromTop [
	"Returns array of blocks in arena, reverse ordered by y coordinate"
	
	| aCollection |
	
	aCollection := OrderedCollection new.
	
	1 to: self arena arenaWidth
		do: [:x | (1 to: self arena arenaHeight)
			do: [:y | (self gameBoard at: x at: y)
				do: [:aBlock | aCollection add: aBlock]]].

	^ aCollection
]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 1/11/2024 23:33'
}
SIYGameBoard >> getBlocksOfType: aBlockClass [
	"returns set of all blocks of specified block type in the arena"

	| aSet |

	aSet := Set new.
	
	1 to: self arena arenaHeight
		do: [:y | (1 to: self arena arenaWidth)
			do: [:x | (self getBlocksOnTile: x@y)
				do: [:aBlock | (aBlock isKindOf: aBlockClass)
					ifTrue: [aSet add: aBlock]]]].

	^ aSet
]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 1/31/2024 22:56'
}
SIYGameBoard >> getBlocksOnTile: aPoint [
	"returns set of blocks at given coordinates, returns nil if aPoint is out of arena"

	((aPoint x between: 1 and: self arena arenaWidth)
		and: (aPoint y between: 1 and: self arena arenaHeight))
			ifTrue: [^ self gameBoard at: aPoint x at: aPoint y]
			ifFalse: [^ nil]	
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/31/2024 22:56'
}
SIYGameBoard >> privateAdd: aBlock to: aPoint [
	
	(self gameBoard at: aPoint x at: aPoint y) add: aBlock

]

{
	#category : #private,
	#'squeak_changestamp' : 'KD 1/31/2024 16:45'
}
SIYGameBoard >> privateMove: aBlock fromTile: aTile to: aPoint [

	self privateRemove: aBlock fromTile: aTile;
		privateAdd: aBlock to: aPoint
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/4/2024 00:32'
}
SIYGameBoard >> privateRemove: aBlock fromTile: aTile [
	
	aTile ifNotNil: [aTile remove: aBlock]
	

]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 1/31/2024 22:56'
}
SIYGameBoard >> saveBlock: aBlock at: aPoint [
	"saves/moves/deletes given block from gameBoard"

	| currentTile |
	
	currentTile := self gameBoard detect: [:each | each includes: aBlock] ifNone: [nil].
	
	aPoint
 		ifNil: [self privateRemove: aBlock fromTile: currentTile] 
		ifNotNil: [currentTile
			ifNil: [self privateAdd: aBlock to: aPoint] 
			ifNotNil: [self privateMove: aBlock fromTile: currentTile to: aPoint]]

	
	
]
