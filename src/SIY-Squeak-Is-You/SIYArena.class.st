Class {
	#name : #SIYArena,
	#superclass : #Morph,
	#instVars : [
		'arenaWidth',
		'arenaHeight'
	],
	#category : #'SIY-Squeak-Is-You'
}

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
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/3/2023 20:53'
}
SIYArena >> initialize [
	"Create new SIY game arena"

	super initialize.
	self color: Color black.
	
	"Arena dimensions"
	self arenaHeight: 10.
	self arenaWidth: 18.
	
	"Register Morph to GMKeyHandler"
	self gmRegisterToKeyHandler.
	
	self openInWorld.
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 12/3/2023 20:56'
}
SIYArena >> pixelPerBlock [

	^ 60
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
