"
A SIYUndoCaretaker is an interface for creating and restoring snapshots of the arena. It's used for  the undo functionality.

Instance Variables
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
	#'squeak_changestamp' : 'LK 1/4/2024 15:52'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/12/2024 13:16'
}
SIYUndoCaretaker class >> newWithArena: anArena [
	
	^ self basicNew initializeWithArena: anArena
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
	#'squeak_changestamp' : 'KD 2/1/2024 14:58'
}
SIYUndoCaretaker >> createSnapshotOf: anArena [

	self pushSnapshot: (SIYSnapshot 
		newWithDictionary: anArena positionDictionary copy
		andSet: anArena replacementSet copy)
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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/12/2024 13:12'
}
SIYUndoCaretaker >> initializeWithArena: anArena [
	
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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/12/2024 13:21'
}
SIYUndoCaretaker >> undo [
	"restore arena state to snapshot on top of stack"
	
	self history isEmpty ifFalse: [arena restoreSnapshot:  self history pop]

]
