"
A SIYSnapshot contains changes in the arena. It's used for the undo functionality.

Instance Variables
	positionDictionary: <Dictionary>
	replacementSet: <Set>

"
Class {
	#name : #SIYSnapshot,
	#superclass : #Object,
	#instVars : [
		'positionDictionary',
		'replacementSet'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/8/2024 23:21'
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
	#'squeak_changestamp' : 'LK 1/8/2024 23:22'
}
SIYSnapshot >> initializeWithDictionary: aDictionary andSet: aSet [

	super initialize.
	self positionDictionary: aDictionary.
	self replacementSet: aSet
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/8/2024 23:21'
}
SIYSnapshot >> replacementSet [

	^ replacementSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/8/2024 23:21'
}
SIYSnapshot >> replacementSet: aSet [
	
	replacementSet := aSet
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/8/2024 23:37'
}
SIYSnapshot >> restore [
	"restores arena state to this snapshot"
	
	"restore blocks from position dictionary"
	self positionDictionary 
		keysAndValuesDo: [:key :value | key owner ifNil: key respawn.
			key setTextureForDirection: key coords - value.
			key coords: value].
		
	"delete blocks from replacementSet"
	self replacementSet do: [:aBlock | aBlock delete]

]
