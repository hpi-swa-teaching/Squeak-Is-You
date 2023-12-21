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
	#'squeak_changestamp' : 'LK 12/21/2023 17:38'
}
SIYCaretaker >> createSnapshot: snapshot [

	"todo: wenn größe = historyLength, dann muss erstes Element entfernt werden"
	"self halt."
	Transcript show: 'push onto stack'.
	history push: snapshot.


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
	#'squeak_changestamp' : 'LK 12/21/2023 18:12'
}
SIYCaretaker >> restoreSnapshot [
	
	| snapshot |
	history isEmpty 
		ifFalse: [snapshot := history pop.
				(snapshot dict) keysAndValuesDo: [:key :value | 
					key coords: value]]

]
