Class {
	#name : #SIYCaretaker,
	#superclass : #Object,
	#instVars : [
		'arena',
		'historyLength',
		'history'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 14:22'
}
SIYCaretaker class >> newWithArena: anArena [
	
	^ (self basicNew arena: anArena; historyLength: 20) initialize;
		yourself.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 14:17'
}
SIYCaretaker >> arena: anArena [
	
	arena := anArena.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 14:22'
}
SIYCaretaker >> historyLength: length [

	historyLength := length.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 14:17'
}
SIYCaretaker >> initialize [

	super initialize.
	^self
]
