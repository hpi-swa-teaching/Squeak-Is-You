Class {
	#name : #SIYArena,
	#superclass : #Morph,
	#instVars : [
		'arenaWidth',
		'arenaHeight',
		'pixelPerBlock'
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
	#'squeak_changestamp' : 'LK 11/20/2023 14:41'
}
SIYArena >> initialize [
	"Create new SIY game arena"

	super initialize.
	self color: Color black.
	
	"Arena dimensions"
	self pixelPerBlock: 50.
	self arenaHeight: 10.
	self arenaWidth: 18.
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 13:33'
}
SIYArena >> pixelPerBlock [

	^ pixelPerBlock
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 14:18'
}
SIYArena >> pixelPerBlock: val [

	pixelPerBlock := val.
	self updateDimensions
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 11/20/2023 14:09'
}
SIYArena >> updateDimensions [
	"Update arena dimensions according to width/height/pixelPerBlock"
	
	(pixelPerBlock)
		ifNotNil: [
			(arenaWidth) ifNotNil: [self width: pixelPerBlock * arenaWidth].
			(arenaHeight) ifNotNil: [self height: pixelPerBlock * arenaHeight]
		]
]
