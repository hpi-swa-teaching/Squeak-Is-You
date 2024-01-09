Class {
	#name : #SIYPlayground,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYPlayground >> arenaExtent [

	^ 20@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:03'
}
SIYPlayground >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 1@1 to: self arenaExtent.
	
	self placeMultipleBlocks: SIYWall from: 11@2 to: 11@5.
	self placeBlock: SIYDoor at: 11@6.
	self placeMultipleBlocks: SIYWall from: 11@7 to: 11@14.
	
	self placeMultipleBlocks: SIYTile from: 12@12 to: 19@14.
	self placeNounFor: SIYTile at: 13@13.
	
	self placeMultipleBlocks: SIYRock at: {9@8 . 13@9 . 8@10}.
	
	self placeBlock: SIYSqueak at: 3@14.
	
	self placeMultipleBlocks: SIYSkull from: 9@13 to: 10@14.
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 3@4.
	self placeVerticalRule: SIYWall is: SIYStop at: 4@4.
	self placeVerticalRule: SIYFlag is: SIYWin at: 5@4.
	self placeVerticalRule: SIYRock is: SIYPush at: 6@4.
	self placeVerticalRule: SIYSkull is: SIYDefeat at: 7@4.
	
	self placeHorizontalRule: SIYKey is: SIYPush and: SIYOpen at: 4@7.
	self placeHorizontalRule: SIYDoor is: SIYShut and: SIYStop at: 4@8.
	
	self placeVerticalRule: SIYWater is: SIYSink at: 18@8.
	self placeVerticalRule: SIYLava is: SIYHot at: 17@4.
	self placeVerticalRule: SIYText is: SIYMelt at: 18@4.

	self placeBlock: SIYKey at: 4@13. 
	
	self placeMultipleBlocks: SIYLava from: 14@3 to: 15@4.
	
	self placeMultipleBlocks: SIYWater from: 12@11 to: 19@11.
	
	self placeBlock: SIYFlag at: 18@13.
	
	self placeMultipleBlocks: SIYGrass at: {7@13 . 9@4 . 13@5}.
	self placeNounFor: SIYGrass at: 13@7.
	
	self placeMultipleBlocks: SIYFlower at: {3@12 . 6@10 .  15@8}.
	self placeNounFor: SIYFlower at: 15@6.
	
	self placeBlock: SIYFloat at: 2@2
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:34'
}
SIYPlayground >> description [

	^ 'Playground'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYPlayground >> nextLevel [

	^ SIYIntro01
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:55'
}
SIYPlayground >> previousLevel [

	^ SIYIsland06
]
