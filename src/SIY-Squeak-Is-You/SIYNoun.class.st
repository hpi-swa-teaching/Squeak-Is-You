Class {
	#name : #SIYNoun,
	#superclass : #SIYText,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #blocktype,
	#'squeak_changestamp' : 'jt 12/30/2023 13:09'
}
SIYNoun >> correspondingBlock [

	^ SubclassResponsibility
]

{
	#category : #blocktype,
	#'squeak_changestamp' : 'jt 12/15/2023 12:22'
}
SIYNoun >> isNounBlock [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/6/2023 17:02'
}
SIYNoun >> textureFile [

	^ SubclassResponsibility
]
