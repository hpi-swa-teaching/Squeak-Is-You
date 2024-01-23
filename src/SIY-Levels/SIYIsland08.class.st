Class {
	#name : #SIYIsland08,
	#superclass : #SIYWorld3,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:02'
}
SIYIsland08 >> arenaExtent [

	^ 24@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:18'
}
SIYIsland08 >> buildLevel [
	
	self placeMultipleBlocks: SIYGrass from: 1@1 to: 4@2.
	self placeMultipleBlocks: SIYGrass at: {5@1 . 6@1 . 1@3 . 1@4}.
	
	self placeMultipleBlocks: SIYGrass from: 18@1 to: 24@1.
	self placeMultipleBlocks: SIYGrass from: 24@1 to: 24@4.
	self placeBlock: SIYGrass at: 23@2.
	self removeBlockAt: 20@1.
	
	self placeMultipleBlocks: SIYGrass from: 22@10 to: 24@12.
	self placeMultipleBlocks: SIYGrass at: {24@8 . 24@9}.
	self removeBlockAt: 22@10.
	
	self placeMultipleBlocks: SIYWater from: 19@13 to: 24@14.
	self placeHorizontalRule: SIYWater is: SIYStop and: SIYShut at: 21@14.
	
	self placeMultipleBlocks: SIYTile from: 9@4 to: 10@10.
	self placeMultipleBlocks: SIYTile from: 11@7 to: 13@8.
	self placeMultipleBlocks: SIYTile from: 13@7 to: 15@5.
	self placeMultipleBlocks: SIYTile at: {15@4 . 16@5 . 16@6 . 9@11 . 8@9}.

	self placeVerticalRule: SIYSqueak is: SIYYou and: SIYOpen at: 9@6.
	self placeMultipleBlocksHollow: SIYWater from: 10@6 to: 14@9.
	self placeBlock: SIYWater at: 11@7.
	self removeBlockAt: 11@9.
	
	self placeBlock: SIYWin at: 12@8.
	
	self placeNounFor: SIYFlag at: 3@10.
	self placeBlock: SIYFlag at: 3@11.
	self placeNounFor: SIYKey at: 5@10.
	self placeBlock: SIYKey at: 5@11.
	
	self placeBlock: SIYSqueak at: 12@4.
	
	self placeMultipleBlocks: SIYCog at: {14@2 . 3@7 . 2@8 . 11@13 . 16@12 . 17@11 . 23@6}
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:01'
}
SIYIsland08 >> description [

	^ 'Level 3.8: Tiny Pond'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:26'
}
SIYIsland08 >> nextLevel [

	^ SIYIsland09
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:01'
}
SIYIsland08 >> previousLevel [

	^ SIYIsland07
]
