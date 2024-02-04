"
A SIYOperator is e.g. the  'IS'-Block

Instance Variables

"
Class {
	#name : #SIYOperator,
	#superclass : #SIYText,
	#category : #'SIY-Blocks',
	#'squeak_changestamp' : 'KD 2/1/2024 14:09'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYOperator >> blockTexture [

	^ SubclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 2/3/2024 20:02'
}
SIYOperator >> isOperator [

	^ true
]
