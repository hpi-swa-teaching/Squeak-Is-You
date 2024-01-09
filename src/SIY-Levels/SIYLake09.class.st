Class {
	#name : #SIYLake09,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:44'
}
SIYLake09 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'KD 1/8/2024 14:57'
}
SIYLake09 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 1@1 to: 4@4.
	self placeMultipleBlocks: SIYWall from: 23@1 to: 25@3.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 2@1.
	self placeHorizontalRule: SIYDoor is: SIYStop at: 2@3.
	self placeHorizontalRule: SIYKey is: SIYDefeat at: 23@2.
	self placeHorizontalRule: SIYStar is: SIYPush at: 11@7.
	self placeHorizontalRule: SIYKey is: SIYOpen at: 12@12.
	self placeHorizontalRule: SIYWall is: SIYStop at: 18@7.
	
	self placeMultipleBlocksHollow: SIYWall from: 9@6 to: 20@15.
	self removeBlockAt: 15@6.
	self placeBlock: SIYDoor at: 15@6.
	self placeBlock: SIYWall at: 18@8.
	self placeBlock: SIYStar at: 17@10.
	self placeBlock: SIYKey at: 12@10.
	self placeBlock: SIYSqueak at: 16@12.
	self placeBlock: SIYIs at: 17@12.
	self placeBlock: SIYIs at: 14@3.
	self placeBlock: SIYWin at: 16@3.
	self placeBlock: SIYShut at: 18@12.
	
	self placeMultipleBlocks: SIYBubble at: {3@14 . 5@15 . 4@10 . 24@12 . 27@14}.
	self placeMultipleBlocks: SIYAlgae at: {1@16 . 2@16 . 1@15 . 8@1 . 20@1 . 21@1 . 27@1 . 28@1 . 27@3 . 28@3 . 22@16}.
	
	self placeMultipleBlocks: SIYWall from: 5@1 to: 7@1.
	self placeMultipleBlocks: SIYWall from: 26@2 to: 28@2.	
	self placeMultipleBlocks: SIYWall from: 25@4 to: 28@4.	
	self placeMultipleBlocks: SIYWall from: 27@5 to: 27@7.
	self placeMultipleBlocks: SIYWall from: 28@7 to: 28@9.
	
	self placeMultipleBlocks: SIYAlgae from: 8@13 to: 8@16.
	self placeMultipleBlocks: SIYAlgae from: 7@16 to: 10@16
				
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 16:00'
}
SIYLake09 >> description [

	^ 'Level 2.9: Burglary'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:52'
}
SIYLake09 >> nextLevel [

	^ SIYIsland01
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:42'
}
SIYLake09 >> previousLevel [

	^ SIYLake08
]
