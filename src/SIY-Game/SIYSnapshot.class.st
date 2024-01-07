"
A SIYSnapshot contains changes in the arena. It's used for the undo functionality.

Instance Variables
	positionDictionary: <Dictionary>

"
Class {
	#name : #SIYSnapshot,
	#superclass : #Object,
	#instVars : [
		'positionDictionary'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:53'
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
	#'squeak_changestamp' : 'LK 1/4/2024 00:04'
}
SIYSnapshot >> initializeWithDictionary: aDictionary [

	super initialize.
	self positionDictionary: aDictionary
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
