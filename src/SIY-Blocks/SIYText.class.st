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
	#category : #texture,
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYText >> blockTexture [

	^ SubclassResponsibility
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:01'
}
SIYText >> isText [

	^ true
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LK 1/7/2024 22:29'
}
SIYText >> nounTexture [

	^ '/SIYTextT.png' 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 2/4/2024 15:08'
}
SIYText >> symbol [

	^ #text
]
