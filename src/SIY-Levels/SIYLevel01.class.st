Class {
	#name : #SIYLevel01,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevel01 >> arenaExtent [

	^ 11@9
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:40'
}
SIYLevel01 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 1@3 to: 11@3.
	self placeMultipleBlocks: SIYTile from: 1@4 to: 11@6.
	self placeMultipleBlocks: SIYWall from: 1@7 to: 11@7.
	
	self placeMultipleBlocks: SIYRock from: 6@4 to: 6@6.
	
	self placeBlock: SIYFlag at: 10@5.
	
	self placeBlock: SIYSqueak at: 2@5.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 2@1.
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@9.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 10@1.
	self placeHorizontalRule: SIYRock is: SIYPush at: 10@9
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:34'
}
SIYLevel01 >> description [

	^ 'Level 1: Squeak Is You'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:24'
}
SIYLevel01 >> nextLevel [

	^ SIYLevel02
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:25'
}
SIYLevel01 >> previousLevel [

	^ SIYLevel00
]
