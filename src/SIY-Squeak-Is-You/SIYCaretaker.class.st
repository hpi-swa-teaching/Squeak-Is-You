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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 19:20'
}
SIYCaretaker >> createSnapshot: snapshot [

	snapshot dict isEmpty
		ifFalse: [history push: snapshot].
	
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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 19:23'
}
SIYCaretaker >> history: aHistory [

	history := aHistory.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 19:23'
}
SIYCaretaker >> initialize [

	history := Stack new.
	super initialize.
	^ self
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 19:26'
}
SIYCaretaker >> restoreSnapshot [
	
	| snapshot |
	history isEmpty 
		ifFalse: [snapshot := history pop.
				 snapshot dict keysAndValuesDo: [:key :value | 
					key owner ifNil: key respawn.
					key updateTextureForDirection: key coords - value.
					key coords: value]].

]
