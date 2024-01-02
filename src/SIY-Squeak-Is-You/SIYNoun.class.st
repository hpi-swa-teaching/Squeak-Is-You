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
	#'squeak_changestamp' : 'LK 1/2/2024 16:50'
}
SIYNoun >> blockTexture [

	^ 'SIYUnknown.png'
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
	#'squeak_changestamp' : 'LK 1/2/2024 13:15'
}
SIYNoun >> representsBlock: aBlock [

	representsBlock := aBlock.
	self image: (SIYTextureManager new getTexture: aBlock basicNew nounTexture).
]
