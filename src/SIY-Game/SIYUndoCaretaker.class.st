"
A SIYUndoCaretaker is an interface for creating and restoring snapshots of the arena.
Instance Variables
	arena: <SIYArena>
	history: <Stack>


"
Class {
	#name : #SIYUndoCaretaker,
	#superclass : #Object,
	#instVars : [
		'history',
		'arena'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 20:18'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYUndoCaretaker class >> newInArena: anArena [
	
	^ self basicNew initializeInArena: anArena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ivenschlegelmilch 1/12/2024 13:19'
}
SIYUndoCaretaker >> arena [

	^ arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ivenschlegelmilch 1/12/2024 13:11'
}
SIYUndoCaretaker >> arena: anArena [
	
	arena := anArena 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 19:36'
}
SIYUndoCaretaker >> createSnapshotOf: anArena [

	self pushSnapshot: (SIYSnapshot 
		newWithDictionary: anArena positionDictionary copy
		andSet: anArena transformationSet copy)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:18'
}
SIYUndoCaretaker >> history [

	^ history ifNil: [history := Stack new]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 19:35'
}
SIYUndoCaretaker >> initializeInArena: anArena [
	
	super initialize.
	self arena: anArena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 14:02'
}
SIYUndoCaretaker >> pushSnapshot: aSnapshot [

	aSnapshot positionDictionary isEmpty
		ifFalse: [self history push: aSnapshot]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/5/2024 00:35'
}
SIYUndoCaretaker >> undo [
	
	self history isEmpty ifFalse: [arena restoreSnapshot: self history pop]

]
