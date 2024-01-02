Class {
	#name : #SIYCaretaker,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/22/2023 11:26'
}
SIYCaretaker >> createSnapshot: snapshot [

	snapshot dict isEmpty
		ifFalse: [history push: snapshot]
	
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 12/21/2023 18:14'
}
SIYCaretaker >> history [

	^ history
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/17/2023 11:07'
}
SIYCaretaker >> history: hist [

	history := hist.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/17/2023 11:20'
}
SIYCaretaker >> initialize [

	history := Stack new.
	
	super initialize.
	^self
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/2/2024 23:37'
}
SIYCaretaker >> restoreSnapshot [
	
	| snapshot |
	history isEmpty 
		ifFalse: [snapshot := history pop.
				(snapshot dict) keysAndValuesDo: [:key :value | 
					key owner ifNil: [key respawn].
					key updateTextureForDirection: key coords - value.
					key coords: value]]

]
