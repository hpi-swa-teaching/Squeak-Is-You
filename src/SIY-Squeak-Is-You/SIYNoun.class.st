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
	#'squeak_changestamp' : 'LK 1/2/2024 12:52'
}
SIYNoun >> representsBlock [

	^ representsBlock
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 17:36'
}
SIYNoun >> representsBlock: aBlock [

	representsBlock := aBlock.
	self updateTextureForDirection: 1@0.
]
