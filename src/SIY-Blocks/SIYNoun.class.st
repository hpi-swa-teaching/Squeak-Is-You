"
A SIYNoun is e.g. the written word 'Squeak' you see ingame.

Instance Variables
	representsBlock:		<Object>

representsBlock
	- xxxxx

"
Class {
	#name : #SIYNoun,
	#superclass : #SIYText,
	#instVars : [
		'representsBlock'
	],
	#category : #'SIY-Blocks',
	#'squeak_changestamp' : 'KD 2/1/2024 14:08'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/11/2024 23:14'
}
SIYNoun >> blockTexture [

	self representsBlock isNil
		ifTrue: [^ 'SIYUnknown.png']
		ifFalse: [^ self representsBlock basicNew nounTexture]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/11/2024 23:32'
}
SIYNoun >> duplicateMorph: evt [
	"if this noun gets duplicated, it should represent the same block"
	
	^ (self class newInArena: self arena at: self coords)
		representsBlock: self representsBlock

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 2/3/2024 20:01'
}
SIYNoun >> isNoun [

	^ true
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
