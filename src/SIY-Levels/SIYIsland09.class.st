Class {
	#name : #SIYIsland09,
	#superclass : #SIYWorld3,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:26'
}
SIYIsland09 >> arenaExtent [

	^ 33@18
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:41'
}
SIYIsland09 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 11@3 to: 21@14.
	self placeMultipleBlocksHollow: SIYWall from: 21@8 to: 24@14.
	self placeMultipleBlocks: SIYTile from: 12@4 to: 20@13.
	self placeMultipleBlocks: SIYTile from: 21@9 to: 23@13.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 16@6.
	self placeBlock: SIYSqueak at: 15@8.
	self placeBlock: SIYCrab at: 17@8.
	self placeNounFor: SIYCrab at: 15@10.
	self placeBlock: SIYPush at: 17@10.
	
	self placeVerticalRule: SIYWall is: SIYStop at: 23@11.
	self placeBlock: SIYWin at: 23@6.
	
	self placeMultipleBlocks: SIYGrass at: {3@2 . 11@2 . 12@2 . 19@2 . 21@1 . 26@3 . 33@1 . 32@1 . 33@2 . 31@5 . 32@5 . 32@6 . 25@8 . 25@9 . 26@9 . 26@10 . 29@13 . 32@16 . 31@17 . 24@16 . 24@17 . 25@16 . 2@8 . 5@7 . 3@14 . 8@13 . 9@12 . 5@17 . 6@17 . 11@15 . 11@16 . 12@16 . 12@17 . 13@16 . 17@17}.
	self placeMultipleBlocks: SIYFlower at: {3@4 . 6@10 . 5@11 . 2@17 . 28@5 . 31@10 . 29@17}
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:25'
}
SIYIsland09 >> description [

	^ 'Level 3.9: Prison'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:43'
}
SIYIsland09 >> nextLevel [

	^ SIYIsland10
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:25'
}
SIYIsland09 >> previousLevel [

	^ SIYIsland08
]
