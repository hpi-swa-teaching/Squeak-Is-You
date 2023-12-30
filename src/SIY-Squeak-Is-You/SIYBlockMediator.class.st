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
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 19:59'
}
SIYBlockMediator >> arena: anArena [

	arena := anArena
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 12/15/2023 19:40'
}
SIYBlockMediator >> generateQueueForDirection: aPoint [

	(1@0 = aPoint) ifTrue: [^ self generateQueueFromRight].
	((-1)@0 = aPoint) ifTrue: [^ self generateQueueFromLeft].
	(0@(-1)= aPoint) ifTrue: [^ self generateQueueFromTop].
	(0@1 = aPoint) ifTrue: [^ self generateQueueFromBottom].
	
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 12/15/2023 19:43'
}
SIYBlockMediator >> generateQueueFromBottom [
	"movement queue for moving up returns array of blocks, 
	ordered by y coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (arena arenaWidth) do: [:x |
		(arena arenaHeight) to: 1 by: -1 do: [:y |
			aSet := gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 12/15/2023 19:43'
}
SIYBlockMediator >> generateQueueFromLeft [
	"movement queue for moving left returns array of blocks, 
	ordered by x coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (arena arenaHeight) do: [:y |
		1 to: (arena arenaWidth) do: [:x |
			aSet := gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 12/15/2023 19:43'
}
SIYBlockMediator >> generateQueueFromRight [
	"movement queue for moving right: returns array of blocks, 
	reverse ordered by x coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (arena arenaHeight) do: [:y |
		(arena arenaWidth) to: 1 by: -1 do: [:x |
			aSet := gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #'movement queue',
	#'squeak_changestamp' : 'LK 12/15/2023 19:43'
}
SIYBlockMediator >> generateQueueFromTop [
	"movement queue for moving up returns array of blocks, 
	ordered by y coordinate"
	
	| aSet queue |
	
	queue := OrderedCollection new.
	
	1 to: (arena arenaWidth) do: [:x |
		1 to: (arena arenaHeight) do: [:y |
			aSet := gameBoard at: x at: y.
			aSet do: [:aBlock | queue add: aBlock]
	]].

	^ queue
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 20:59'
}
SIYBlockMediator >> initialize [

	super initialize.
	
	self initializeGameBoard.
	
	^ self
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 21:06'
}
SIYBlockMediator >> initializeGameBoard [

	gameBoard := Matrix rows: (arena arenaWidth) columns: (arena arenaHeight).
	
	"initialize with empty sets"
	1 to: (arena arenaWidth ) do: [:x |
		1 to: (arena arenaHeight ) do: [:y |
			gameBoard at: x at: y put: Set new
		]
	]
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/6/2023 19:53'
}
SIYBlockMediator >> privateAdd: object to: coordinates [
	
	| tile |
	tile := gameBoard at: coordinates x at: coordinates y.
	tile isNil ifTrue: [ tile := Set new. gameBoard at: coordinates x at: coordinates y put: tile ].
	tile add: object.

]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/6/2023 21:52'
}
SIYBlockMediator >> privateMove: target fromTile: aTile to: pointB [

	
	self privateRemove: target fromTile: aTile.
	self privateAdd: target to: pointB.
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/19/2023 00:04'
}
SIYBlockMediator >> privateRemove: object fromTile: aTile [
	
	aTile ifNotNil: [aTile remove: object]
	

]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 12/15/2023 13:44'
}
SIYBlockMediator >> rememberBlock: sender withPos: coordinates [
	"function that causes init/move/delete of an object from the Board"

	| currentTile |
	currentTile := gameBoard detect: [ :each | each includes: sender] ifNone: [nil].
	coordinates isNil
 		ifTrue: [ self privateRemove: sender fromTile: currentTile. ] 
		ifFalse: [ currentTile isNil
			ifTrue: [ self privateAdd: sender to: coordinates ] 
			ifFalse: [ self privateMove: sender fromTile: currentTile to: coordinates].].

	
	
]

{
	#category : #'position storing',
	#'squeak_changestamp' : 'LK 12/15/2023 13:45'
}
SIYBlockMediator >> requestPos: point [
	"function that calls for the objects on a coordinate, returns nil if point is not on field."

	| itemsOnField |
	((point x < 1) or: (point y < 1) or: (point x > arena arenaWidth) or: (point y > arena arenaHeight))
		ifTrue: [^ nil].
	itemsOnField := gameBoard at: point x at: point y.

	^itemsOnField
		
]
