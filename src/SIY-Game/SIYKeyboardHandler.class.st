Class {
	#name : #SIYKeyboardHandler,
	#superclass : #Morph,
	#instVars : [
		'pressedKey',
		'stepTime',
		'game'
	],
	#category : #'SIY-Game'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 2/4/2024 17:26'
}
SIYKeyboardHandler class >> newFor: aGame [

	^ self basicNew initializeFor: aGame
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 18:49'
}
SIYKeyboardHandler >> addToGame [

	self game addMorph: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 17:25'
}
SIYKeyboardHandler >> arena [

	^ self game arena
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 17:25'
}
SIYKeyboardHandler >> audioPlayer [

	^ self game audioPlayer
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'LK 2/4/2024 17:29'
}
SIYKeyboardHandler >> checkKeyboardInputs [
	
	| aKey |
	
	aKey := self pressedKey.
	aKey ifNil: [self stepFaster] ifNotNil: [self stepSlower].
	
	(self keymap at: self pressedKey ifAbsent: [^ nil "do nothing"])
		value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 18:29'
}
SIYKeyboardHandler >> eventHandler [

	^ self game eventHandler
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 17:23'
}
SIYKeyboardHandler >> fastStepTime [
	"faster step time for polling keyboard inputs, while no button is pressed"

	^ 0.5
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 17:24'
}
SIYKeyboardHandler >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 17:28'
}
SIYKeyboardHandler >> game: aGame [

	^ game := aGame
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/4/2024 18:49'
}
SIYKeyboardHandler >> initializeFor: aGame [
	
	super initialize.
	
	self game: aGame;
		addToGame;
		openInWorld; 
		hide
]

{
	#category : #'key mapping',
	#'squeak_changestamp' : 'LK 2/4/2024 17:17'
}
SIYKeyboardHandler >> keymap [

	| aDictionary |
	
	aDictionary := Dictionary new.
	
	aDictionary at: Character arrowUp put: [self arena moveBlocksUp].
	aDictionary at: Character arrowDown put: [self arena moveBlocksDown].
	aDictionary at: Character arrowLeft put: [self arena moveBlocksLeft].
	aDictionary at: Character arrowRight put: [self arena moveBlocksRight].
	
	aDictionary at: $w put: [self arena moveBlocksUp].
	aDictionary at: $s put: [self arena moveBlocksDown].
	aDictionary at: $a put: [self arena moveBlocksLeft].
	aDictionary at: $d put: [self arena moveBlocksRight].
	
	aDictionary at: $r put: [self game restartLevel].
	aDictionary at: $z put: [self undoCaretaker undo].
	
	aDictionary at: $m put: [self audioPlayer toggleMute].
	
	aDictionary at: $l put: [self game nextLevel].
	aDictionary at: $k put: [self game previousLevel].
	aDictionary at: Character escape put: [self game exitGame].
	
	^ aDictionary
	
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'LK 2/4/2024 17:04'
}
SIYKeyboardHandler >> pressedKey [
	"returns the key currently pressed, while ignoring multiple simultaneous keyboard inputs"

	self pressedKeys size caseOf: {
		[0] -> [pressedKey := nil].
		[1] -> [pressedKey := self pressedKeys first]
	} otherwise: ["do nothing"].
	
	^ pressedKey
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'LK 2/4/2024 18:29'
}
SIYKeyboardHandler >> pressedKeys [

	^ self eventHandler pressedKeys asOrderedCollection
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 17:23'
}
SIYKeyboardHandler >> slowStepTime [
	"slower step time affects the delay between block movements, while a keyboard
	button is held down"

	^ 155
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 18:05'
}
SIYKeyboardHandler >> step [

	self arena isGameLocked 
		ifFalse: [self checkKeyboardInputs]

]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 17:23'
}
SIYKeyboardHandler >> stepFaster [

	self stepTime: self fastStepTime
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 17:23'
}
SIYKeyboardHandler >> stepSlower [

	self stepTime: self slowStepTime
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 17:33'
}
SIYKeyboardHandler >> stepTime [

	^ stepTime ifNil: [stepTime := self fastStepTime]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LK 2/4/2024 17:24'
}
SIYKeyboardHandler >> stepTime: aNumber [

	stepTime := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 17:25'
}
SIYKeyboardHandler >> undoCaretaker [

	^ self arena undoCaretaker
]
