Class {
	#name : #SIYArena,
	#superclass : #Morph,
	#instVars : [
		'arenaWidth',
		'arenaHeight',
		'mediator',
		'rules',
		'stepTime',
		'blockPositionDict',
		'caretaker',
		'game'
	],
	#category : 'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 12/5/2023 10:38'
}
SIYArena class >> newWithDimension: aPoint [

	^ (SIYArena new)
		arenaWidth: aPoint x;
		arenaHeight: aPoint y;
		yourself
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 14:15'
}
SIYArena >> arenaHeight [
	"Return arena height in blocks"
	
	^ arenaHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 14:19'
}
SIYArena >> arenaHeight: val [
	"Set arena height in blocks"
	
	arenaHeight := val.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 14:15'
}
SIYArena >> arenaWidth [
	"Return arena width in blocks"
	
	^ arenaWidth
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 14:18'
}
SIYArena >> arenaWidth: val [
	"Set arena width in blocks"
	
	arenaWidth := val.
	self updateDimensions
]

{
	#category : #undo,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/16/2023 21:41'
}
SIYArena >> blockPositionDict [

	^blockPositionDict.
]

{
	#category : #undo,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/16/2023 21:41'
}
SIYArena >> blockPositionDict: dict [

	blockPositionDict := dict.
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 12/21/2023 18:09'
}
SIYArena >> checkKeyboardInputs [
	
	(self gmIsKeyPressed: $z)
		ifTrue: [caretaker restoreSnapshot. self stepTime: self stepInbetweenTime]
		ifFalse: [
	(self gmIsKeyPressed: Character arrowUp)
		ifTrue: [self moveBlocksDirection: 0@(-1). self stepTime: self stepInbetweenTime]
		ifFalse: [
	(self gmIsKeyPressed: Character arrowDown)
		ifTrue: [self moveBlocksDirection: 0@1. self stepTime: self stepInbetweenTime]
		ifFalse: [
	(self gmIsKeyPressed: Character arrowRight)
		ifTrue: [self moveBlocksDirection: 1@0. self stepTime: self stepInbetweenTime]
		ifFalse: [
	(self gmIsKeyPressed: Character arrowLeft)
		ifTrue: [self moveBlocksDirection: (-1)@0. self stepTime: self stepInbetweenTime]
		ifFalse: [self stepTime: self stepRefreshTime]
	]]]].
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/12/2023 11:07'
}
SIYArena >> dropEnabled [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/21/2023 16:37'
}
SIYArena >> game [

	^ game
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/21/2023 16:38'
}
SIYArena >> game: aGame [

	game :=  aGame
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ivenschlegelmilch 12/18/2023 13:30'
}
SIYArena >> initialize [
	"Create new SIY game arena"

	self stepTime: self stepRefreshTime.

	super initialize.
	self color: Color black.
	
	blockPositionDict := Dictionary new.
	caretaker := SIYCaretaker new.
	
	"Register Morph to GMKeyHandler"
	self gmRegisterToKeyHandler.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 19:54'
}
SIYArena >> mediator [

	^mediator
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 19:55'
}
SIYArena >> mediator: aMediator [

	mediator := aMediator.
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 12/21/2023 17:56'
}
SIYArena >> moveBlocksDirection: aPoint [

	| movementQueue |
	
	movementQueue := mediator generateQueueForDirection: aPoint.
	
	blockPositionDict removeAll.
	
	movementQueue do: [:aBlock | 
		(rules isYou: aBlock) ifTrue: [aBlock moveDirection: aPoint]].
	
	caretaker createSnapshot: (SIYSnapshot newWithDict: (blockPositionDict copy)).
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/3/2023 20:56'
}
SIYArena >> pixelPerBlock [

	^ 60
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 20:26'
}
SIYArena >> ruleManager [

	^ rules
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/6/2023 20:25'
}
SIYArena >> ruleManager: aRuleManager [

	rules := aRuleManager
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'jt 12/30/2023 12:34'
}
SIYArena >> step [

	self checkKeyboardInputs.

	rules updateRules: self.
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 12/15/2023 19:15'
}
SIYArena >> stepInbetweenTime [

	^ 185
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'ivenschlegelmilch 12/21/2023 17:32'
}
SIYArena >> stepRefreshTime [

	^ 1
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 12/15/2023 19:16'
}
SIYArena >> stepTime [

	^ stepTime
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 12/15/2023 19:16'
}
SIYArena >> stepTime: aNumber [

	stepTime := aNumber
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/3/2023 20:55'
}
SIYArena >> updateDimensions [
	"Update arena dimensions according to width/height"

	(arenaWidth) ifNotNil: [self width: self pixelPerBlock * arenaWidth].
	(arenaHeight) ifNotNil: [self height: self pixelPerBlock * arenaHeight]

]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/15/2023 20:33'
}
SIYArena >> wantsDroppedMorph: aMorph event: evt [

	^ aMorph isKindOf: SIYBlock
]
