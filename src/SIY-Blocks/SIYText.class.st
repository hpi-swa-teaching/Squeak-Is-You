"
A SIYText is one Textblock in the Game.

Instance Variables

"
Class {
	#name : #SIYText,
	#superclass : #SIYBlock,
	#category : #'SIY-Blocks',
	#'squeak_changestamp' : 'KD 2/1/2024 14:07'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYText >> blockTexture [

	^ SubclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/7/2024 22:29'
}
SIYText >> nounTexture [

	^ '/SIYTextT.png' 
]
