Class {
	#name : #SIYMediator,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'arenaEnd'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #initialisation,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 19:32'
}
SIYMediator >> createMediator: arena [
	
	arenaEnd := arena.
	gameBoard := Matrix rows: arena x columns: arena y.

	
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 18:20'
}
SIYMediator >> initialize [

	super initialize.
	
	^ self
]

{
	#category : #public,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 17:48'
}
SIYMediator >> notify: sender with: coordinates [
	"function that causes init/move/delete of an object from the Board"

	| currentTile |
	currentTile := gameBoard detect: [ : each | each contains: sender].
	coordinates = [0@0] 
 		ifTrue: [ self priveteRemove: sender from: currentTile. ] 
		ifFalse: [ currentTile isNil
			ifTrue: [ self priveteAdd: sender to: coordinates ] 
			ifFalse: [ self privateMove: sender from: currentTile to: coordinates].].

	
	
]

{
	#category : #private,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 19:17'
}
SIYMediator >> privateMove: target from: pointA  to: pointB [

	
	self priveteRemove: target from: pointA.
	self priveteAdd: target to: pointB.
]

{
	#category : #private,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 19:12'
}
SIYMediator >> priveteAdd: object to: coordinates [
	
	| tile |
	tile := gameBoard at: coordinates x at: coordinates y.
	tile isNil ifTrue: [ tile := Set new. gameBoard at: coordinates x at: coordinates y put: tile ].
	tile add: object.

]

{
	#category : #private,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 17:37'
}
SIYMediator >> priveteRemove: object from: coordinates [
	
	| tile |
	tile := gameBoard at: coordinates x at: coordinates y.
	tile remove: object.

]

{
	#category : #public,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 19:31'
}
SIYMediator >> request: point [
	"function that calls for the objects on a coordinate, returns nil if point is not on field."

	| itemsOnField |
	(point < [0@0] or: point > arenaEnd) ifTrue: [^nil].
	itemsOnField := gameBoard at: point x at: point y.
	
	^itemsOnField
		
]
