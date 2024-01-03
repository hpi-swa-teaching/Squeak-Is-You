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
	#category : #'level generation',
	#'squeak_changestamp' : 'LK 12/21/2023 16:54'
}
SIYGame >> abortLevel [
	
	arena delete.
	rules := nil.
	level := nil
]

{
	#category : #'level generation',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 17:51'
}
SIYGame >> arena [

	^ arena
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
	#category : #'level generation',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 17:51'
}
SIYGame >> level [ 

	^ level class
]

{
	#category : #'level generation',
	#'squeak_changestamp' : 'LK 12/21/2023 16:53'
}
SIYGame >> nextLevel [

	| aLevel aPoint |

	aLevel := level nextLevel.
	aPoint := arena position.
	
	self abortLevel.
	
	aLevel ifNotNil: [self startLevel: aLevel atPosition: aPoint]
]

{
	#category : #'level generation',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/3/2024 17:51'
}
SIYGame >> restartLevel [

	| aPoint aLevel |
	aLevel := self level.
	aPoint := self arena position.
	self abortLevel.
	aLevel ifNotNil: [self startLevel: aLevel atPosition: aPoint].
	
]

{
	#category : #'level generation',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/23/2023 22:27'
}
SIYGame >> startLevel: aLevel [

	level := aLevel new.
	arena := level arena.
	arena game: self.
	rules := SIYRuleManager new.
]

{
	#category : #'level generation',
	#'squeak_changestamp' : 'LK 12/21/2023 16:53'
}
SIYGame >> startLevel: aLevel atPosition: aPoint [

	self startLevel: aLevel.
	arena position: aPoint.
]
