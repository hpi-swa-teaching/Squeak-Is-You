Class {
	#name : #SIYArena,
	#superclass : #Morph,
	#instVars : [
		'arenaWidth',
		'arenaHeight',
		'mediator',
		'rules'
	],
	#category : #'SIY-Squeak-Is-You'
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
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/12/2023 11:07'
}
SIYArena >> dropEnabled [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Karl Duda 12/6/2023 18:58'
}
SIYArena >> initialize [
	"Create new SIY game arena"

	super initialize.
	self color: Color black.
	
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
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/3/2023 20:55'
}
SIYArena >> updateDimensions [
	"Update arena dimensions according to width/height"

	(arenaWidth) ifNotNil: [self width: self pixelPerBlock * arenaWidth].
	(arenaHeight) ifNotNil: [self height: self pixelPerBlock * arenaHeight]

]
