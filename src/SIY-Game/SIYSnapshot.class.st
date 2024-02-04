"
A SIYSnapshot contains transformations and position changes in the arena.

Instance Variables
	positionDictionary: <Dictionary>
	transformationSet: <Set>

"
Class {
	#name : #SIYSnapshot,
	#superclass : #Object,
	#instVars : [
		'positionDictionary',
		'transformationSet'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 20:17'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/8/2024 23:22'
}
SIYSnapshot class >> newWithDictionary: aDictionary andSet: aSet [
	
	^ self basicNew initializeWithDictionary: aDictionary andSet: aSet
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 20:17'
}
SIYSnapshot >> initializeWithDictionary: aDictionary andSet: aSet [

	super initialize.
	
	self positionDictionary: aDictionary.
	self transformationSet: aSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshot >> positionDictionary [

	^ positionDictionary
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 1/3/2024 23:52'
}
SIYSnapshot >> positionDictionary: aDictionary [
	
	positionDictionary := aDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 20:17'
}
SIYSnapshot >> transformationSet [

	^ transformationSet
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 2/4/2024 20:17'
}
SIYSnapshot >> transformationSet: aSet [
	
	transformationSet := aSet
]
