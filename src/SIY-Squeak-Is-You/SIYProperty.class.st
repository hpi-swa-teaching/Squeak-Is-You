Class {
	#name : #SIYProperty,
	#superclass : #SIYText,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #blocktype,
	#'squeak_changestamp' : 'jt 12/15/2023 12:22'
}
SIYProperty >> isPropertyBlock [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/6/2023 17:02'
}
SIYProperty >> textureFile [

	^ SubclassResponsibility
]
