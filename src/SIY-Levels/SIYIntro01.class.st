Class {
	#name : #SIYIntro01,
	#superclass : #SIYWorld1,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYIntro01 >> arenaExtent [

	^ 11@9
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:40'
}
SIYIntro01 >> buildLevel [
	
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
	#'squeak_changestamp' : 'LK 1/9/2024 15:18'
}
SIYIntro01 >> description [

	^ 'Level 1.1: Squeak Is You'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYIntro01 >> nextLevel [

	^ SIYIntro02
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:13'
}
SIYIntro01 >> previousLevel [

	^ SIYPlayground
]
