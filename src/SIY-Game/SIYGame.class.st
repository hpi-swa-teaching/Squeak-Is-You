"
A SIYGame is the main class of the game. It can start a new game and creates the arena for the corresponding level.

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
		'levelDescription'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/5/2024 22:21'
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
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/3/2024 22:46'
}
SIYGame >> arena [

	^ self level arena
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
	#'squeak_changestamp' : 'LK 1/4/2024 23:28'
}
SIYGame >> backgroundMorph [

	^ backgroundMorph ifNil: [backgroundMorph := self createBackgroundMorph]
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 20:07'
}
SIYGame >> createBackgroundMorph [

	| aMorph anotherMorph |
	
	aMorph := Morph new
		extent: World clearArea extent;
		color: self backgroundColor;
		openInWorld.

	anotherMorph := self createKeyHintMorph.
	aMorph addMorphCentered: anotherMorph.
	anotherMorph bottom: aMorph bottom.
	
	^ aMorph
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/5/2024 20:05'
}
SIYGame >> createKeyHintMorph [

	| aMorph aForm |
	
	aForm := SIYTextureManager new getTexture: self keyHintTexture.
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
	#category : #background,
	#'squeak_changestamp' : 'LK 1/4/2024 23:43'
}
SIYGame >> enableBackground [

	^ self customScaleFactor isNil
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/5/2024 20:23'
}
SIYGame >> initialize [

	super initialize.
	
	self startLevel: SIYLevel00 atPosition: World clearArea center + self keyHintOffset
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
	#'squeak_changestamp' : 'LK 1/5/2024 22:27'
}
SIYGame >> startLevel: aLevel [

	self level: (aLevel newWithScale: self customScaleFactor).
	self arena game: self.
	
	self enableBackground
		ifTrue: [self backgroundMorph addMorph: self arena.
				self arena setProperty: #indicateKeyboardFocus toValue: #never.
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
