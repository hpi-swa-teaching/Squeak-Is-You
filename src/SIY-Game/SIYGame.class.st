"
A SIYGame is the main class of the game. It can start a new game and creates the arena for the corresponding level. 

Creating a new instance of this class is overwritten and will default to SIYFullscreenGame or SIYScaledGame.

If you want to start a new game, run `SIYGame start`. To prevent the game from running in fullscreen, specify a scale factor when starting the game: `SIYGame startWithScale: 1.0`.

Instance Variables
	level: <SIYLevel>
	audioPlayer: <SIYAudioPlayer>
	keyboardHandler: <SIYKeyboardHandler>

"
Class {
	#name : #SIYGame,
	#superclass : #Morph,
	#instVars : [
		'level',
		'audioPlayer',
		'keyboardHandler'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 20:00'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:07'
}
SIYGame class >> new [
	
	^ self start
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:06'
}
SIYGame class >> start [

	^ SIYFullscreenGame start
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:43'
}
SIYGame class >> startAtLevel: aLevel [

	^ SIYFullscreenGame startAtLevel: aLevel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:03'
}
SIYGame class >> startWithScale: aScaleFactor [

	^ SIYScaledGame startWithScale: aScaleFactor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:51'
}
SIYGame class >> startWithScale: aScaleFactor atLevel: aLevelClass [

	^ SIYScaledGame startWithScale: aScaleFactor atLevel: aLevelClass
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> abortLevel [
	
	self arena delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:46'
}
SIYGame >> arena [

	^ self level arena
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 21:42'
}
SIYGame >> arenaPosition [

	^ SubclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 14:11'
}
SIYGame >> audioPlayer [

	^ audioPlayer ifNil: [audioPlayer := SIYAudioPlayer new]

	
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 13:36'
}
SIYGame >> backgroundColor [

	^ Color veryVeryDarkGray
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/31/2024 14:10'
}
SIYGame >> defaultLevel [

	^ SIYIntro01
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 2/3/2024 21:17'
}
SIYGame >> exitGame [
	
	^ SubclassResponsibility
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/31/2024 21:31'
}
SIYGame >> fullscreenEnabled [

	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 19:54'
}
SIYGame >> initialize [

	super initialize.
	self initializeBackground.
	self initializeKeyboardHandler.
	
	self audioPlayer playMusicIfNotMuted.

	self startLevel: self level atPosition: self arenaPosition
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 2/1/2024 13:43'
}
SIYGame >> initializeAtLevel: aLevelClass [

	self level: aLevelClass;
		initialize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 21:53'
}
SIYGame >> initializeBackground [

	^ SubclassResponsibility

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 18:02'
}
SIYGame >> initializeKeyboardHandler [

	self keyboardHandler: (SIYKeyboardHandler newFor: self).
	self gmRegisterToKeyHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 18:02'
}
SIYGame >> keyboardHandler [

	^ keyboardHandler

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 18:50'
}
SIYGame >> keyboardHandler: anObject [

	keyboardHandler := anObject

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ivenschlegelmilch 1/31/2024 14:09'
}
SIYGame >> level [ 

	^ level ifNil: [level := self defaultLevel]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:49'
}
SIYGame >> level: aLevel [

	level := aLevel
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 22:31'
}
SIYGame >> nextLevel [

	self level nextLevel ifNotNil: [self replaceLevelWith: self level nextLevel]
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/31/2024 20:55'
}
SIYGame >> outOfWorld: aWorld [

	self audioPlayer stopMusic.
	
	^ super outOfWorld: aWorld
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 22:32'
}
SIYGame >> previousLevel [

	self level previousLevel ifNotNil: [self replaceLevelWith: self level previousLevel]
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 17:38'
}
SIYGame >> replaceLevelWith: aLevelClass [
	"stops current level and starts specified level at the same position on screen,
	as the current one"
	
	| aPoint |
	
	aPoint := self arena center.
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
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/31/2024 22:02'
}
SIYGame >> scaleFactor [

	^ SubclassResponsibility
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/31/2024 22:01'
}
SIYGame >> startLevel: aLevel [

	self level: (aLevel newWithScale: self scaleFactor).
	self arena game: self.
	
	self updateExtent.
	
	self arena center: self arenaPosition.
	self addMorph: self arena.

	
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/4/2024 17:38'
}
SIYGame >> startLevel: aLevel atPosition: aPoint [

	self startLevel: aLevel.
	self arena center: aPoint
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 2/4/2024 18:43'
}
SIYGame >> updateExtent [

	^ SubclassResponsibility
]
