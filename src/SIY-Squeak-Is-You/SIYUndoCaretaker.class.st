Class {
	#name : #SIYUndoCaretaker,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 14:03'
}
SIYUndoCaretaker >> createSnapshotOf: anArena [

	self pushSnapshot: (SIYSnapshot newWithDictionary: (anArena positionDictionary copy))
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
	#'squeak_changestamp' : 'LK 1/4/2024 00:35'
}
SIYUndoCaretaker >> restoreSnapshot [
	
	| snapshot |
	
	self history isEmpty 
		ifFalse: [snapshot := self history pop.
				 snapshot positionDictionary keysAndValuesDo: [:key :value | 
					key owner ifNil: key respawn.
					key setTextureForDirection: key coords - value.
					key coords: value]]

]
