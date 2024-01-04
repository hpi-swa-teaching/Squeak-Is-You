Class {
	#name : #SIYNoun,
	#superclass : #SIYText,
	#instVars : [
		'representsBlock'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 17:35'
}
SIYNoun >> blockTexture [

	representsBlock isNil
		ifTrue: [^ 'SIYUnknown.png']
		ifFalse: [^ representsBlock basicNew nounTexture]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/4/2024 15:03'
}
SIYNoun >> duplicateMorph: evt [
	"if this Noun gets duplicated, it should represent the same block"
	
	^ (SIYNoun newInArena: self arena at: self coords) representsBlock: self representsBlock

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 12:52'
}
SIYNoun >> representsBlock [

	^ representsBlock
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/4/2024 15:02'
}
SIYNoun >> representsBlock: aBlock [

	representsBlock := aBlock.
	self setDefaultTexture
]
