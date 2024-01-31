"
A SIYGame is the main class of the game. It can start a new game and creates the arena for the corresponding level.

If you want to start a new game, run `SIYGame start`. To prevent the game from running in fullscreen, specify a scale factor when starting the game: `SIYGame startWithScale: 1.0`.

Instance Variables
	arena: <SIYArena>
	level: <SIYLevel>
	backgroundMorph: <Morph>
	customScaleFactor: <Float>
	levelDescription: <TextMorph>

"
Class {
	#name : #SIYGame,
	#superclass : #Morph,
	#instVars : [
		'arena',
		'level',
		'backgroundMorph',
		'customScaleFactor',
		'levelDescription',
		'audioPlayer'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/9/2024 09:47'
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
	#'squeak_changestamp' : 'LK 1/5/2024 12:48'
}
SIYGame class >> startWithScale: aScaleFactor [

	^ self basicNew initializeWithScale: aScaleFactor
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> abortLevel [
	
	self arena delete
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/31/2024 16:37'
}
SIYGame >> addKeyHintMorph [

	| aMorph |

	aMorph := self createKeyHintMorph.
	self addMorphCentered: aMorph.
	aMorph bottom: self bottom
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:46'
}
SIYGame >> arena [

	^ self level arena
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
	#category : #background,
	#'squeak_changestamp' : 'LK 1/31/2024 16:29'
}
SIYGame >> backgroundMorph [

	^ self
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/10/2024 23:48'
}
SIYGame >> createKeyHintMorph [

	| aMorph aForm |
	
	aForm := SIYTextureLoader new getTexture: self keyHintTexture.
	aMorph := (aForm scaledToHeight: self keyHintHeight) asMorph openInWorld.
	
	^ aMorph
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/4/2024 23:43'
}
SIYGame >> customScaleFactor [

	^ customScaleFactor
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/4/2024 23:43'
}
SIYGame >> customScaleFactor: aFloat [
	
	customScaleFactor := aFloat
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 16:48'
}
SIYGame >> defaultPosition [

	^ World clearArea center + self keyHintOffset
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/31/2024 20:55'
}
SIYGame >> exitGame [
	
	self abandon
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/31/2024 16:31'
}
SIYGame >> fullscreenEnabled [

	^ self customScaleFactor isNil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/9/2024 19:41'
}
SIYGame >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 20:51'
}
SIYGame >> initialize [

	super initialize.
	self initializeBackground.
	
	self audioPlayer playMusicIfNotMuted.
	self startLevel: SIYIntro01 atPosition: self center
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 16:56'
}
SIYGame >> initializeBackground [

	self color: self backgroundColor;
		openInWorld;
		center: self defaultPosition.
		
	self fullscreenEnabled
		ifTrue: [self updateExtent;
			addKeyHintMorph].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/5/2024 12:48'
}
SIYGame >> initializeWithScale: aFloat [
	
	self customScaleFactor: aFloat.
	self initialize
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 21:57'
}
SIYGame >> keyHintHeight [

	^ 50 px
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 20:22'
}
SIYGame >> keyHintOffset [

	^ 0@(self keyHintHeight / 2 negated)
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 19:59'
}
SIYGame >> keyHintTexture [

	^ '/KeyHints.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:42'
}
SIYGame >> level [ 

	^ level
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:49'
}
SIYGame >> level: aLevel [

	level := aLevel
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 22:24'
}
SIYGame >> levelDescription [

	^ levelDescription ifNil: [levelDescription := TextMorph new]
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 22:32'
}
SIYGame >> levelDescriptionOffset [

	^ ((15 px)@(-15 px))
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
	#category : #'level control',
	#'squeak_changestamp' : 'LK 1/31/2024 20:51'
}
SIYGame >> startLevel: aLevel [

	self level: (aLevel newWithScale: self customScaleFactor).
	self arena game: self.
	
	self updateExtent.
	self backgroundMorph addMorphCentered: self arena.
	
	self fullscreenEnabled
		ifTrue: [self arena setProperty: #indicateKeyboardFocus toValue: #never.
				self updateLevelDescription]
	
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
	#'squeak_changestamp' : 'LK 1/31/2024 16:57'
}
SIYGame >> updateExtent [
	
	| aPoint |

	aPoint := self center.
	
	self fullscreenEnabled
		ifTrue: [self extent: World clearArea extent;
			center: World clearArea center]
		ifFalse: [self extent: self arena extent;
			center: aPoint]
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 22:30'
}
SIYGame >> updateLevelDescription [

	self levelDescription
		contents: self level description;
		lock;
		color: Color white.

	self backgroundMorph addMorph: self levelDescription.
	self levelDescription
		bottomLeft: self backgroundMorph bottomLeft + self levelDescriptionOffset
]
