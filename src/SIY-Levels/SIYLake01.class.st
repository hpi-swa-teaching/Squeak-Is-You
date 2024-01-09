Class {
	#name : #SIYLake01,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:49'
}
SIYLake01 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 01:24'
}
SIYLake01 >> buildLevel [
	
	self placeMultipleBlocks: SIYIce from: 1@1 to: 6@1.
	self placeMultipleBlocks: SIYIce from: 1@2 to: 4@2.
	self placeMultipleBlocks: SIYIce from: 1@3 to: 2@1.
	self placeBlock: SIYIce at: 1@4.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 2@1.
	
	self placeMultipleBlocksHollow: SIYWall from: 6@4 to: 10@8.
	self removeBlockAt: 8@8.
	self placeBlock: SIYSqueak at: 8@6.
	
	self placeMultipleBlocks: SIYIce from: 1@16 to: 5@16.
	self placeMultipleBlocks: SIYIce from: 1@15 to: 2@15.
	self placeMultipleBlocks: SIYIce at: {1@14 . 7@16 . 12@16}.
	
	self placeMultipleBlocks: SIYWall from: 6@13 to: 12@13.
	self placeMultipleBlocks: SIYWall from: 9@11 to: 12@11.
	self placeMultipleBlocks: SIYWall at: {6@12 . 14@12}.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 10@12.
	self placeBlock: SIYAnd at: 12@12.
	self placeBlock: SIYSink at: 13@12.
	
	self placeHorizontalRule: SIYJelly is: SIYSink at: 27@1.
	self placeHorizontalRule: SIYWall is: SIYStop at: 27@16.
	
	self placeMultipleBlocksHollow: SIYJelly from: 23@3 to: 25@7.
	self placeMultipleBlocksHollow: SIYJelly from: 22@4 to: 26@6.
	self removeMultipleBlocksAt: {24@4 . 24@6 . 23@5 . 25@5}.
	self placeBlock: SIYFlag at: 24@5.
	
	self placeMultipleBlocks: SIYIce from: 25@16 to: 22@14.
	self placeMultipleBlocks: SIYIce at: {21@14 . 20@14 . 21@15 . 26@15 . 27@15}.
	
	self placeMultipleBlocks: SIYIce from: 23@13 to: 19@11.
	self removeMultipleBlocksAt: {23@11 . 24@14}.
	self placeMultipleBlocks: SIYIce at: {24@12 . 18@12 . 17@12 . 26@13}.
	
	self placeMultipleBlocksHollow: SIYIce from: 15@5 to: 21@11.
	self removeMultipleBlocksAt: {15@11 . 21@5 }.
	self placeMultipleBlocks: SIYIce at: {16@10 . 20@10 . 16@6 . 20@6}.
	
	self placeMultipleBlocks: SIYIce from: 14@1 to: 17@4.
	self placeMultipleBlocks: SIYIce at: {12@1 . 13@1 . 13@2 . 18@4 . 18@1 . 19@2 . 19@4}.
	self removeMultipleBlocksAt: {15@1 . 16@1}.
	
	self placeNounFor: SIYWall at: 18@8
	
	
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:21'
}
SIYLake01 >> description [

	^ 'Level 2.1: Icy Waters'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:47'
}
SIYLake01 >> nextLevel [

	^ SIYLake02
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYLake01 >> previousLevel [

	^ SIYIntro08
]
