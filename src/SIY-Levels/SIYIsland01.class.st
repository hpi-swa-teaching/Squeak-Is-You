Class {
	#name : #SIYIsland01,
	#superclass : #SIYWorld3,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:09'
}
SIYIsland01 >> arenaExtent [

	^ 25@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 16:05'
}
SIYIsland01 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 17@5 to: 21@10.
	self placeBlock: SIYFlag at: 19@7.
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@16.
	
	self placeMultipleBlocks: SIYWall from: 10@5 to: 10@8.
	self placeBlock: SIYWall at: 6@5.
	self placeMultipleBlocks: SIYWall from: 5@5 to: 5@7.
	self placeMultipleBlocks: SIYWall from: 6@7 to: 6@8.
	
	self placeHorizontalRule: SIYFlower is: SIYPush at: 8@5.
	self placeHorizontalRule: SIYGrass is: SIYPush at: 8@6.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 8@7.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 8@8.
	
	self placeMultipleBlocks: SIYFlower at: {1@14 . 7@16 . 12@16 . 10@10 . 24@11 . 24@4 . 3@2 . 22@10 . 16@8}.
	self placeMultipleBlocks: SIYGrass at: {15@13 . 14@8 . 12@15 . 19@3 . 21@15 . 23@7 . 4@1 . 20@12 . 5@12 . 4@8 . 8@3 . 13@4}.
	self placeMultipleBlocks: SIYBrick at: {2@3 . 4@7 . 14@2 . 20@8 . 21@14}.
																							
	self placeBlock: SIYSqueak at: 14@5
	
	
	
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:52'
}
SIYIsland01 >> description [

	^ 'Level 3.1: What To Push?'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:54'
}
SIYIsland01 >> nextLevel [

	^ SIYIsland02
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/10/2024 00:09'
}
SIYIsland01 >> previousLevel [

	^ SIYLake10
]
