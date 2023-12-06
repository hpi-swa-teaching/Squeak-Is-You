Class {
	#name : #SIYMediator,
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
SIYMediator class >> newForArena: anArena [

	^ (self basicNew) arena: anArena; initialize; yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 19:59'
}
SIYMediator >> arena: anArena [

	arena := anArena
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 20:59'
}
SIYMediator >> initialize [

	super initialize.
	
	self initializeGameBoard.
	
	^ self
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 21:06'
}
SIYMediator >> initializeGameBoard [

	gameBoard := Matrix rows: (arena arenaWidth) columns: (arena arenaHeight).
	
	"initialize with empty sets"
	1 to: (arena arenaWidth ) do: [:x |
		1 to: (arena arenaHeight ) do: [:y |
			gameBoard at: x at: y put: Set new
		]
	]
]

{
	#category : #public,
	#'squeak_changestamp' : 'LK 12/6/2023 21:34'
}
SIYMediator >> notify: sender with: coordinates [
	"function that causes init/move/delete of an object from the Board"

	| currentTile |
	currentTile := gameBoard detect: [ :each | each includes: sender] ifNone: [nil].
	coordinates isNil
 		ifTrue: [ self privateRemove: sender from: currentTile. ] 
		ifFalse: [ currentTile isNil
			ifTrue: [ self privateAdd: sender to: coordinates ] 
			ifFalse: [ self privateMove: sender from: currentTile to: coordinates].].

	
	
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/6/2023 19:53'
}
SIYMediator >> privateAdd: object to: coordinates [
	
	| tile |
	tile := gameBoard at: coordinates x at: coordinates y.
	tile isNil ifTrue: [ tile := Set new. gameBoard at: coordinates x at: coordinates y put: tile ].
	tile add: object.

]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/6/2023 19:53'
}
SIYMediator >> privateMove: target from: pointA  to: pointB [

	
	self privateRemove: target from: pointA.
	self privateAdd: target to: pointB.
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/6/2023 19:53'
}
SIYMediator >> privateRemove: object from: coordinates [
	
	| tile |
	tile := gameBoard at: coordinates x at: coordinates y.
	tile remove: object.

]

{
	#category : #public,
	#'squeak_changestamp' : 'LK 12/6/2023 21:21'
}
SIYMediator >> request: point [
	"function that calls for the objects on a coordinate, returns nil if point is not on field."

	| itemsOnField |
	((point x < 1) or: (point y < 1) or: (point x > arena arenaWidth) or: (point y > arena arenaHeight))
		ifTrue: [^ nil].
	itemsOnField := gameBoard at: point x at: point y.

	^itemsOnField
		
]
