Class {
	#name : #SIYGame,
	#superclass : #Morph,
	#instVars : [
		'arena',
		'block'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 11/30/2023 15:20'
}
SIYGame class >> start [

	self new
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 11/30/2023 15:21'
}
SIYGame >> initialize [

	super initialize.
	
	arena := SIYArena	 new.
	block := SIYBlock newInArena: arena.
]
