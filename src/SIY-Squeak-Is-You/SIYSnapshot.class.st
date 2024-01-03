Class {
	#name : #SIYSnapshot,
	#superclass : #Object,
	#instVars : [
		'positionDictionary'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshot class >> newWithDictionary: aDictionary [
	
	^ self basicNew initializeWithDictionary: aDictionary
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshot >> initializeWithDictionary: aDictionary [

	super initialize.
	self dictionary: aDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshot >> positionDictionary [

	^ positionDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshot >> positionDictionary: aDictionary [
	
	positionDictionary := aDictionary
]
