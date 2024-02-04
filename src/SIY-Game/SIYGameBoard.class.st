"
The SIYGameBoard is an interface for accessing other blocks in the arena.

Instance Variables
	arena: <SIYArena>
	boardMatrix: <Matrix>

"
Class {
	#name : #SIYGameBoard,
	#superclass : #Object,
	#instVars : [
		'arena',
		'boardMatrix'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 20:01'
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
	#'squeak_changestamp' : 'LK 2/3/2024 20:25'
}
SIYGameBoard >> boardMatrix [

	^ boardMatrix ifNil: [boardMatrix := self createBoardMatrix]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 20:03'
}
SIYGameBoard >> createBoardMatrix [

	| aMatrix |

	aMatrix := Matrix rows: self arena arenaWidth columns: self arena arenaHeight.
	
	1 to: self arena arenaWidth
		do: [:x | 1 to: self arena arenaHeight
			do: [:y | aMatrix at: x at: y put: Set new]].
	
	^ aMatrix
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:24'
}
SIYGameBoard >> getAllBlocks [
	
	^ self getBlocksFromLeft
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 20:03'
}
SIYGameBoard >> getBlocksFromBottom [
	
	^ self getBlocksFromTop reversed
]

{
	#category : #'block storing',
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
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 20:03'
}
SIYGameBoard >> getBlocksFromLeft [
	
	| aCollection |
	
	aCollection := OrderedCollection new.
	
	1 to: self arena arenaHeight
		do: [:y | 1 to: self arena arenaWidth
			do: [:x | aCollection addAll: (self boardMatrix at: x at: y)]].

	^ aCollection
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 20:03'
}
SIYGameBoard >> getBlocksFromRight [

	^ self getBlocksFromLeft reversed
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 20:03'
}
SIYGameBoard >> getBlocksFromTop [
	
	| aCollection |
	
	aCollection := OrderedCollection new.
	
	1 to: self arena arenaWidth
		do: [:x | 1 to: self arena arenaHeight
			do: [:y | aCollection addAll: (self boardMatrix at: x at: y)]].

	^ aCollection
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 15:08'
}
SIYGameBoard >> getBlocksLike: aBlock [

	^ self getBlocksWithSymbol: aBlock symbol
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 19:26'
}
SIYGameBoard >> getBlocksOnTile: aPoint [

	(self arena isPointInArenaDimensions: aPoint)
		ifTrue: [^ self boardMatrix at: aPoint x at: aPoint y]
		ifFalse: [^ nil]
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 18:14'
}
SIYGameBoard >> getBlocksThatSatisfy: aBlockClosure [

	| aSet |

	aSet := Set new.
	
	self boardMatrix do: [:aTile | aSet addAll: (aTile select: aBlockClosure)].

	^ aSet
]

{
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 15:08'
}
SIYGameBoard >> getBlocksWithSymbol: aBlockSymbol [

	^ self getBlocksThatSatisfy: [:each | each symbol == aBlockSymbol]
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 2/4/2024 20:04'
}
SIYGameBoard >> privateAdd: aBlock to: aPoint [
	
	(self boardMatrix at: aPoint x at: aPoint y) 
		add: aBlock
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
	#category : #'block storing',
	#'squeak_changestamp' : 'LK 2/4/2024 20:04'
}
SIYGameBoard >> saveBlock: aBlock at: aPoint [

	| currentTile |
	
	currentTile := self boardMatrix detect: [:each | each includes: aBlock] ifNone: [nil].
	
	aPoint
 		ifNil: [self privateRemove: aBlock fromTile: currentTile] 
		ifNotNil: [currentTile
			ifNil: [self privateAdd: aBlock to: aPoint] 
			ifNotNil: [self privateMove: aBlock fromTile: currentTile to: aPoint]]
	
]
