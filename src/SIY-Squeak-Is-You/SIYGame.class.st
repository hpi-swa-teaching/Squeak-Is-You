Class {
	#name : #SIYGame,
	#superclass : #Morph,
	#instVars : [
		'arena',
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
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> abortLevel [
	
	self arena delete
]

{
	#category : #'game accessing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:46'
}
SIYGame >> arena [

	^ self level arena
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/21/2023 16:40'
}
SIYGame >> initialize [

	super initialize.
	
	self startLevel: SIYLevel01
]

{
	#category : #'game accessing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> level [ 

	^ level
]

{
	#category : #'game accessing',
	#'squeak_changestamp' : 'LK 1/3/2024 22:49'
}
SIYGame >> level: aLevel [

	level := aLevel
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:48'
}
SIYGame >> nextLevel [

	self replaceLevelWith: self level nextLevel
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:48'
}
SIYGame >> replaceLevelWith: aLevelClass [
	
	| aPoint |
	
	aPoint := self arena position.
	self level ifNotNil: [self abortLevel].
	aLevelClass ifNotNil: [self startLevel: aLevelClass atPosition: aPoint]
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:49'
}
SIYGame >> restartLevel [

	self replaceLevelWith: self level class
	
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:50'
}
SIYGame >> startLevel: aLevel [

	self level: aLevel new.
	self arena game: self
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:52'
}
SIYGame >> startLevel: aLevel atPosition: aPoint [

	self startLevel: aLevel.
	self arena position: aPoint.
]
