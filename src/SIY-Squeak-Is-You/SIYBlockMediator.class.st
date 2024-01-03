Class {
	#name : #SIYBlockMediator,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'arena'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 12/6/2023 20:03'
}
SIYBlockMediator class >> newForArena: anArena [

	^ (self basicNew) arena: anArena; initialize; yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:38'
}
SIYBlockMediator >> arena [

	^ arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/6/2023 19:59'
}
SIYBlockMediator >> arena: anArena [

	arena := anArena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:21'
}
SIYBlockMediator >> createGameBoard [

	| aMatrix |

	aMatrix := Matrix rows: (self arena arenaWidth) columns: (self arena arenaHeight).
	
	"initialize with empty sets"
	1 to: (self arena arenaWidth ) do: [:x |
		1 to: (self arena arenaHeight ) do: [:y |
			aMatrix at: x at: y put: Set new
		]
	].
	
	^ aMatrix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:21'
}
SIYBlockMediator >> gameBoard [

	^ gameBoard ifNil: [gameBoard := self createGameBoard]
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 1/4/2024 00:22'
}
SIYBlockMediator >> generateQueueForDirection: aPoint [

	aPoint caseOf: {
		[1@0] -> [^ self generateQueueFromRight].
		[(-1)@0] -> [^ self generateQueueFromLeft].
		[0@1] -> [^ self generateQueueFromBottom].
		[0@(-1)] -> [^ self generateQueueFromTop]
	}
	
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 1/4/2024 00:22'
}
SIYBlockMediator >> generateQueueFromBottom [
	"movement queue for moving up returns array of blocks, 
	ordered by y coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (self arena arenaWidth) do: [:x |
		(self arena arenaHeight) to: 1 by: -1 do: [:y |
			aSet := self gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 1/4/2024 00:22'
}
SIYBlockMediator >> generateQueueFromLeft [
	"movement queue for moving left returns array of blocks, 
	ordered by x coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (self arena arenaHeight) do: [:y |
		1 to: (self arena arenaWidth) do: [:x |
			aSet := self gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 1/4/2024 00:22'
}
SIYBlockMediator >> generateQueueFromRight [
	"movement queue for moving right: returns array of blocks, 
	reverse ordered by x coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (self arena arenaHeight) do: [:y |
		(self arena arenaWidth) to: 1 by: -1 do: [:x |
			aSet := self gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 1/4/2024 00:23'
}
SIYBlockMediator >> generateQueueFromTop [
	"movement queue for moving up returns array of blocks, 
	ordered by y coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (self arena arenaWidth) do: [:x |
		1 to: (self arena arenaHeight) do: [:y |
			aSet := self gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 22:39'
}
SIYBlockMediator >> getOperatorBlocks [

	| aSet |

	aSet := Set new.
	
	1 to: (self arena arenaHeight) do: [:y |
		1 to: (self arena arenaWidth) do: [:x |
			(self requestPos: x@y) do: 
				[:aBlock | (aBlock isKindOf: SIYOperator)
					ifTrue: [aSet add: aBlock]]]].

	^ aSet
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/4/2024 00:31'
}
SIYBlockMediator >> privateAdd: aBlock to: aPoint [
	
	(self gameBoard at: aPoint x at: aPoint y) add: aBlock

]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/4/2024 00:32'
}
SIYBlockMediator >> privateMove: aBlock fromTile: aTile to: aPoint [

	
	self privateRemove: aBlock fromTile: aTile.
	self privateAdd: aBlock to: aPoint
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/4/2024 00:32'
}
SIYBlockMediator >> privateRemove: aBlock fromTile: aTile [
	
	aTile ifNotNil: [aTile remove: aBlock]
	

]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 1/4/2024 00:24'
}
SIYBlockMediator >> rememberBlock: sender withPos: coordinates [
	"function that causes init/move/delete of an object from the Board"

	| currentTile |
	currentTile := self gameBoard detect: [:each | each includes: sender] ifNone: [nil].
	
	coordinates 
 		ifNil: [self privateRemove: sender fromTile: currentTile] 
		ifNotNil: [currentTile 
			ifNil: [self privateAdd: sender to: coordinates] 
			ifNotNil: [self privateMove: sender fromTile: currentTile to: coordinates]]

	
	
]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 1/4/2024 00:27'
}
SIYBlockMediator >> requestPos: point [
	"function that calls for the objects on a coordinate, returns nil if point is not on field."

	((point x between: 1 and: self arena arenaWidth) and: (point y between: 1 and: self arena arenaHeight))
		ifTrue: [^ self gameBoard at: point x at: point y]
		ifFalse: [^ nil]
]
