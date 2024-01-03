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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 19:28'
}
SIYSnapshot >> dict: aDictionary [
	
	blockPositionDict := aDictionary.
]

{
	#category : #private,
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 19:28'
}
SIYSnapshot >> initialize [
	
	super initialize.
	^ self
]
