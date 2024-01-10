Class {
	#name : #SIYLake08,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:44'
}
SIYLake08 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:25'
}
SIYLake08 >> buildLevel [
	
	self placeMultipleBlocks: SIYHedge from: 5@4 to: 5@10.
	self placeMultipleBlocks: SIYHedge at: {6@4 . 7@4 . 6@10 . 7@8 . 8@6}.
	self placeVerticalRule: SIYKey is: SIYPush and: SIYOpen at: 6@6.
	
	self placeMultipleBlocksHollow: SIYHedge from: 9@10 to: 13@14.
	self removeBlockAt: 10@10.
	self placeMultipleBlocks: SIYHedge at: {9@9 . 10@12 . 10@13}.
	self placeNounFor: SIYFlag at: 11@11.
	self placeBlock: SIYIs at: 12@12.
	self placeBlock: SIYWin at: 12@13.
	self placeBlock: SIYKey at: 10@9.
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 11@4.
	self placeVerticalRule: SIYDoor is: SIYShut at: 14@4.
	self placeBlock: SIYSqueak at: 12@7.
	
	self placeMultipleBlocksHollow: SIYHedge from: 17@4 to: 23@10.
	self placeMultipleBlocks: SIYTile from: 18@5 to: 22@9.
	self placeVerticalRule: SIYHedge and: SIYDoor is: SIYStop at: 22@8.
	
	self placeBlock: SIYFlag at: 20@7.
	self placeBlock: SIYDoor at: 17@7.
	
	self placeMultipleBlocks: SIYAlgae at: {2@2 . 2@14 . 4@15 . 22@15 . 26@14 . 27@13 . 26@10 . 26@2 . 27@4}.
	self placeBlock: SIYStar at: 19@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:42'
}
SIYLake08 >> description [

	^ 'Level 2.8: Two Doors'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 16:00'
}
SIYLake08 >> nextLevel [

	^ SIYLake09
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:42'
}
SIYLake08 >> previousLevel [

	^ SIYLake07
]
