"
A SIYProperty is e.g. the 'You'-Property which lets the player invoke keyboard input on a given block class. For exact details what each property does please visit 'https://babaiswiki.fandom.com/wiki/Category:Properties' 

Instance Variables

"
Class {
	#name : #SIYProperty,
	#superclass : #SIYText,
	#category : #'SIY-Blocks',
	#'squeak_changestamp' : 'KD 2/1/2024 14:12'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYProperty >> blockTexture [

	^ SubclassResponsibility
]
