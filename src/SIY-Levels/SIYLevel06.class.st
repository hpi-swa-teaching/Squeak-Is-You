Class {
	#name : #SIYLevel06,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 14:32'
}
SIYLevel06 >> arenaExtent [

	^ 26@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 16:24'
}
SIYLevel06 >> buildLevel [
	
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@1.
	self placeMultipleBlocks: SIYLava from: 1@2 to: 4@2.
	self placeMultipleBlocks: SIYLava at: {1@3 . 1@4 . 2@3 . 4@1. 5@1}.
	
	self placeMultipleBlocks: SIYWall from: 6@1 to: 6@8.
	self placeMultipleBlocks: SIYWall from: 7@7 to: 12@7.
	self placeMultipleBlocks: SIYWall from: 16@1 to: 16@4.
	self placeMultipleBlocks: SIYWall from: 12@4 to: 15@4.
	self placeMultipleBlocks: SIYWall at: {12@3 . 12@1 . 12@5 . 11@5 . 7@5 . 8@8}.
	
	self placeBlock: SIYSqueak at: 14@2.
	self placeBlock: SIYRock at: 12@6.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 9@4.
	self placeVerticalRule: SIYRock is: SIYPush at: 7@9.
	
	self placeMultipleBlocksHollow: SIYWall from: 7@13 to: 11@15.
	self placeMultipleBlocks: SIYWall at: {7@12 . 11@12}.
	self placeHorizontalRule: SIYSqueak is: SIYMelt at: 9@12.
	self placeHorizontalRule: SIYLava is: SIYHot at: 9@14.
	
	self placeNounFor: SIYLava at: 12@10.
	
	self placeMultipleBlocks: SIYLava at: {23@1 . 23@2 . 23@3 . 24@1}.
	self placeMultipleBlocks: SIYLava from: 19@1 to: 22@5.
	self placeMultipleBlocks: SIYLava at: {18@3 . 18@4 . 18@5 . 21@6 . 21@7}.
	self placeMultipleBlocks: SIYLava from: 17@6 to: 20@10.
	self placeMultipleBlocks: SIYLava at: {16@10 . 16@9 . 19@11 . 19@12 . 19@13 . 19@14}.
	self placeMultipleBlocks: SIYLava from: 15@11 to: 18@16.
	self placeMultipleBlocks: SIYLava at: {14@15. 14@16 . 13@16}.
	
	self placeBlock: SIYFlag at: 23@12.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 23@14
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:35'
}
SIYLevel06 >> description [

	^ 'Level 6: Volcano'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 15:54'
}
SIYLevel06 >> nextLevel [

	^ SIYLevel07
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 14:50'
}
SIYLevel06 >> previousLevel [

	^ SIYLevel05
]
