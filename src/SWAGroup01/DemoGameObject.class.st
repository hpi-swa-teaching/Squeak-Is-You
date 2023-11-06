"
I am a moving object in the demo game. Delete me and replace me with your own classes.
"
Class {
	#name : #DemoGameObject,
	#superclass : #Morph,
	#instVars : [
		'velocity',
		'game'
	],
	#category : 'SWAGroup01-Core',
	#'squeak_changestamp' : 'ek 10/22/2021 12:51'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ek 10/22/2021 12:47'
}
DemoGameObject >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ek 10/22/2021 12:47'
}
DemoGameObject >> game: aDemoGame [

	game := aDemoGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ek 10/22/2021 12:50'
}
DemoGameObject >> initialize [

	super initialize.
	self velocity: 1@1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jb 11/3/2021 14:13'
}
DemoGameObject >> makeSound [
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'ek 10/22/2021 12:50'
}
DemoGameObject >> step [

	| newPosition |
	newPosition := self position + self velocity.
	(self game bounds containsPoint: newPosition)
		ifTrue: [self position: newPosition]
		ifFalse: [self velocity: self velocity negated].
	
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'ek 10/22/2021 12:52'
}
DemoGameObject >> stepTime [

	^ 100
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ek 10/22/2021 12:45'
}
DemoGameObject >> velocity [

	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ek 10/22/2021 12:45'
}
DemoGameObject >> velocity: aPoint [

	velocity := aPoint.
]
