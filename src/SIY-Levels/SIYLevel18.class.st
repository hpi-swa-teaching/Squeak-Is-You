Class {
	#name : #SIYLevel18,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:24'
}
SIYLevel18 >> arenaExtent [

	^ 28@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:25'
}
SIYLevel18 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 1@6 to: 11@6.
	self placeMultipleBlocks: SIYTile from: 1@7 to: 11@9.
	self placeMultipleBlocks: SIYWall from: 1@10 to: 11@10.
	
	self placeMultipleBlocks: SIYRock from: 6@7 to: 6@9.
	
	self placeBlock: SIYFlag at: 10@8.
	
	self placeBlock: SIYSqueak at: 2@8.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 2@4.
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@12.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 10@4.
	self placeHorizontalRule: SIYRock is: SIYPush at: 10@12.
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:34'
}
SIYLevel18 >> description [

	^ 'Level 1: Squeak Is You'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:22'
}
SIYLevel18 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:22'
}
SIYLevel18 >> previousLevel [

	^ SIYLevel16
]
