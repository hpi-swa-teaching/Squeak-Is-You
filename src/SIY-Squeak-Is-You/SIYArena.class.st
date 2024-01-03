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
	#'squeak_changestamp' : 'LK 1/3/2024 19:29'
}
SIYArena >> blockPositionDict [

	^ blockPositionDict
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 19:29'
}
SIYArena >> blockPositionDict: dict [

	blockPositionDict := dict
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 19:23'
}
SIYArena >> caretaker [

	^ caretaker
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 19:23'
}
SIYArena >> caretaker: anObject [

	caretaker := anObject
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
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 19:22'
}
SIYArena >> createSnapshot [

	caretaker createSnapshot: (SIYSnapshot newWithDict: (self blockPositionDict copy))
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/12/2023 11:07'
}
SIYArena >> dropEnabled [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/21/2023 16:37'
}
SIYArena >> game [

	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/21/2023 16:38'
}
SIYArena >> game: aGame [

	game :=  aGame
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/31/2023 20:16'
}
SIYArena >> initialize [
	"Create new SIY game arena"

	self stepTime: self stepRefreshTime.

	super initialize.
	self color: Color black.
	"self addFlexShell."
	
	blockPositionDict := Dictionary new.
	caretaker := SIYCaretaker new.
	
	"Register Morph to GMKeyHandler"
	self gmRegisterToKeyHandler.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/6/2023 19:54'
}
SIYArena >> mediator [

	^mediator
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/6/2023 19:55'
}
SIYArena >> mediator: aMediator [

	mediator := aMediator.
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 1/3/2024 19:30'
}
SIYArena >> moveBlocksDirection: aDirection [
	"Move all isYou-blocks in arena, in specified direction."

	| movementQueue |
	
	movementQueue := mediator generateQueueForDirection: aDirection.
	
	self resetPositionDict.
	movementQueue do: [:aBlock | (rules isYou: aBlock) ifTrue: [aBlock move: aDirection]].
	self createSnapshot.
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 1/2/2024 16:28'
}
SIYArena >> pixelPerBlock [

	^ 72
]

{
	#category : #undo,
	#'squeak_changestamp' : 'LK 1/3/2024 19:20'
}
SIYArena >> resetPositionDict [

	^ self blockPositionDict removeAll
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/6/2023 20:26'
}
SIYArena >> ruleManager [

	^ rules
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/6/2023 20:25'
}
SIYArena >> ruleManager: aRuleManager [

	rules := aRuleManager
]

{
	#category : #'block movement',
	#'squeak_changestamp' : 'LK 12/31/2023 15:45'
}
SIYArena >> step [

	self checkKeyboardInputs.

	rules updateRulesInArena: self.
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
