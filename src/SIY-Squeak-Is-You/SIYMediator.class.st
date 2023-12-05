Class {
	#name : #SIYMediator,
	#superclass : #Object,
	#instVars : [
		'mediator'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Karl Duda 12/5/2023 17:53'
}
SIYMediator >> createMediator [
	"comment stating purpose of message"


	^self
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'Karl Duda 12/5/2023 17:53'
}
SIYMediator >> initialize [

	super initialize.
	
	self createMediator.
	
	^ self
]
