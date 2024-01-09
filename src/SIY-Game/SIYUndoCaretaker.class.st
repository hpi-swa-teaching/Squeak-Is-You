"
A SIYUndoCaretaker is an interface for creating and restoring snapshots of the arena. It's used for  the undo functionality.

Instance Variables
	history: <Stack>


"
Class {
	#name : #SIYUndoCaretaker,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:52'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/8/2024 23:29'
}
SIYUndoCaretaker >> createSnapshotOf: anArena [

	self pushSnapshot: (SIYSnapshot 
		newWithDictionary: (anArena positionDictionary copy)
		andSet: (anArena replacementSet copy))
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:18'
}
SIYUndoCaretaker >> history [

	^ history ifNil: [history := Stack new]
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
	#'squeak_changestamp' : 'LK 1/8/2024 23:37'
}
SIYUndoCaretaker >> undo [
	"restore arena state to snapshot on top of stack"
	
	self history isEmpty ifFalse: [self history pop restore]

]
