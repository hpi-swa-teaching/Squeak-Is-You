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
	#'squeak_changestamp' : 'LK 1/2/2024 23:17'
}
SIYNoun >> duplicateMorph: evt [
	
	| dup |
	
	dup := (SIYNoun newInArena: self arena at: self coords)
				representsBlock: self representsBlock.

	^ dup
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
	#'squeak_changestamp' : 'LK 1/4/2024 00:02'
}
SIYNoun >> representsBlock: aBlock [

	representsBlock := aBlock.
	self setTextureForDirection: 1@0.
]
