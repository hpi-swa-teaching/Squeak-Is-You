Class {
	#name : #SIYLevel07,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 15:55'
}
SIYLevel07 >> arenaExtent [

	^ 24@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 21:22'
}
SIYLevel07 >> buildLevel [
	
	self placeHorizontalRule: SIYRock is: SIYStop at: 2@1.
	self placeHorizontalRule: SIYSkull is: SIYDefeat at: 2@3.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 2@5.
	
	self placeMultipleBlocks: SIYRock from: 5@1 to: 5@7.
	self placeMultipleBlocks: SIYRock from: 1@7 to: 4@7.
	
	self placeMultipleBlocksHollow: SIYWall from: 7@5 to: 11@9.
	self placeMultipleBlocksHollow: SIYWall from: 11@2 to: 16@12.
	self placeMultipleBlocksHollow: SIYWall from: 16@2 to: 20@6.
	self placeMultipleBlocks: SIYWall at: {14@7 . 15@7}.
	self removeMultipleBlocksAt: {11@7 . 16@4}.
	
	self placeMultipleBlocks: SIYTile from: 8@6 to: 10@8.
	self placeMultipleBlocks: SIYTile from: 17@3 to: 19@5.
	
	self placeMultipleBlocks: SIYSkull from: 13@1 to: 13@8.
	self placeMultipleBlocks: SIYSkull from: 13@8 to: 24@8.
	
	self placeHorizontalRule: SIYWall is: SIYStop at: 14@10.
	self placeVerticalRule: SIYSqueak is: SIYYou at: 9@12.
	
	self placeBlock: SIYSqueak at: 9@7.
	self placeBlock: SIYFlag at: 18@4.
	
	self placeMultipleBlocks: SIYGrass from: 6@1 to: 9@2.
	self removeBlockAt: 6@2.
	self placeMultipleBlocks: SIYGrass from: 2@10 to: 4@12.
	self removeMultipleBlocksAt: {2@10 . 4@10 . 2@12}.
	self placeMultipleBlocks: SIYGrass from: 22@1 to: 24@3.
	self removeMultipleBlocksAt: {22@2 . 22@3 . 23@3}.
	self placeMultipleBlocks: SIYGrass from: 20@14 to: 24@14.
	self placeMultipleBlocks: SIYGrass at: {23@13 . 22@13}.
	
	self placeMultipleBlocks: SIYFlower at: {4@8 . 9@2 . 23@6 . 22@10 . 20@11 . 18@13}
	
	
	
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:35'
}
SIYLevel07 >> description [

	^ 'Level 7: Off Limits'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 16:37'
}
SIYLevel07 >> nextLevel [

	^ SIYLevel08
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 15:54'
}
SIYLevel07 >> previousLevel [

	^ SIYLevel06
]
