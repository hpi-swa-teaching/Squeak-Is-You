Class {
	#name : #SIYGame,
	#superclass : #Morph,
	#instVars : [
		'arena',
		'block',
		'rules',
		'level'
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
	#'squeak_changestamp' : 'LK 12/5/2023 11:51'
}
SIYGame >> initialize [

	super initialize.
	
	level := SIYLevel01 new.
	arena := level arena.
	rules := SIYRuleManager new.
]
