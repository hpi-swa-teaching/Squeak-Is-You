"
Creating an instance of this class will start the game in fullscreen, which includes displaying the current level name aswell as a key hint. 

Instance Variables
	levelDescription: <TextMorph>


"
Class {
	#name : #SIYFullscreenGame,
	#superclass : #SIYGame,
	#instVars : [
		'levelDescription'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 19:57'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:06'
}
SIYFullscreenGame class >> start [

	self basicNew initialize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 22:51'
}
SIYFullscreenGame class >> startAtLevel: aLevelClass [

	self basicNew initializeAtLevel: aLevelClass
]

{
	#category : #keyhint,
	#'squeak_changestamp' : 'LK 1/31/2024 16:37'
}
SIYFullscreenGame >> addKeyHintMorph [

	| aMorph |

	aMorph := self createKeyHintMorph.
	self addMorphCentered: aMorph.
	aMorph bottom: self bottom
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 1/31/2024 21:42'
}
SIYFullscreenGame >> arenaPosition [

	^ World clearArea center + self keyHintOffset
]

{
	#category : #keyhint,
	#'squeak_changestamp' : 'LK 1/10/2024 23:48'
}
SIYFullscreenGame >> createKeyHintMorph [

	| aMorph aForm |
	
	aForm := SIYTextureLoader new getTexture: self keyHintTexture.
	aMorph := (aForm scaledToHeight: self keyHintHeight) asMorph openInWorld.
	
	^ aMorph
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 2/3/2024 21:17'
}
SIYFullscreenGame >> exitGame [

	^ self abandon
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/31/2024 21:31'
}
SIYFullscreenGame >> fullscreenEnabled [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 18:05'
}
SIYFullscreenGame >> initializeBackground [

	self openInWorld;
		color: self backgroundColor;
		updateExtent;
		addKeyHintMorph;
		beSticky;
		setProperty: #indicateKeyboardFocus toValue: #never
]

{
	#category : #keyhint,
	#'squeak_changestamp' : 'LK 1/5/2024 21:57'
}
SIYFullscreenGame >> keyHintHeight [

	^ 50 px
]

{
	#category : #keyhint,
	#'squeak_changestamp' : 'LK 1/5/2024 20:22'
}
SIYFullscreenGame >> keyHintOffset [

	^ 0@(self keyHintHeight / 2 negated)
]

{
	#category : #keyhint,
	#'squeak_changestamp' : 'LK 1/5/2024 19:59'
}
SIYFullscreenGame >> keyHintTexture [

	^ '/KeyHints.png'
]

{
	#category : #'level description',
	#'squeak_changestamp' : 'LK 1/5/2024 22:24'
}
SIYFullscreenGame >> levelDescription [

	^ levelDescription ifNil: [levelDescription := TextMorph new]
]

{
	#category : #'level description',
	#'squeak_changestamp' : 'LK 1/31/2024 21:47'
}
SIYFullscreenGame >> levelDescriptionColor [

	^ Color white
]

{
	#category : #'level description',
	#'squeak_changestamp' : 'LK 2/4/2024 19:57'
}
SIYFullscreenGame >> levelDescriptionOffset [

	^ (15 px)@(-15 px)
]

{
	#category : #'level description',
	#'squeak_changestamp' : 'LK 1/31/2024 21:46'
}
SIYFullscreenGame >> levelDescriptionPosition [

	^ self bottomLeft + self levelDescriptionOffset
]

{
	#category : #scaling,
	#'squeak_changestamp' : 'LK 1/31/2024 22:02'
}
SIYFullscreenGame >> scaleFactor [

	^ nil
]

{
	#category : #'level control',
	#'squeak_changestamp' : 'LK 2/4/2024 19:58'
}
SIYFullscreenGame >> startLevel: aLevel [

	super startLevel: aLevel.
	self updateLevelDescription
	
]

{
	#category : #background,
	#'squeak_changestamp' : 'LK 1/31/2024 22:11'
}
SIYFullscreenGame >> updateExtent [
	
	self extent: World clearArea extent
]

{
	#category : #'level description',
	#'squeak_changestamp' : 'LK 1/31/2024 21:48'
}
SIYFullscreenGame >> updateLevelDescription [

	self levelDescription
		contents: self level description;
		color: self levelDescriptionColor;
		lock.
		
	self addMorph: self levelDescription.
	self levelDescription bottomLeft: self levelDescriptionPosition
]
