Class {
	#name : #SIYSnapshot,
	#superclass : #Object,
	#instVars : [
		'blockPositionDict'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 14:18'
}
SIYSnapshot class >> newWithDict: dict [
	
	^ (self basicNew dict: dict) initialize;
		yourself.
	
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/17/2023 12:49'
}
SIYSnapshot >> dict [

	^blockPositionDict.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 13:50'
}
SIYSnapshot >> dict: dictionary [
	
	blockPositionDict := dictionary
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/15/2023 13:54'
}
SIYSnapshot >> initialize [
	
	super initialize.
	
	^self
]
