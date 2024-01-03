Class {
	#name : #SIYSnapshotCaretaker,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshotCaretaker >> createSnapshot: snapshot [

	snapshot positionDictionary isEmpty
		ifFalse: [self history push: snapshot].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:18'
}
SIYSnapshotCaretaker >> history [

	^ history ifNil: [history := Stack new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:35'
}
SIYSnapshotCaretaker >> restoreSnapshot [
	
	| snapshot |
	
	self history isEmpty 
		ifFalse: [snapshot := self history pop.
				 snapshot positionDictionary keysAndValuesDo: [:key :value | 
					key owner ifNil: key respawn.
					key setTextureForDirection: key coords - value.
					key coords: value]]

]
