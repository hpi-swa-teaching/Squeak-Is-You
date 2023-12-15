Class {
	#name : #SIYText,
	#superclass : #SIYBlock,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #blocktype,
	#'squeak_changestamp' : 'jt 12/15/2023 12:22'
}
SIYText >> isTextBlock [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/6/2023 17:02'
}
SIYText >> textureFile [

	^ SubclassResponsibility
]
