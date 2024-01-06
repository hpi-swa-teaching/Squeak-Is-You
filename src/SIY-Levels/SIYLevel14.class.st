Class {
	#name : #SIYLevel14,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:44'
}
SIYLevel14 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:54'
}
SIYLevel14 >> backgroundColor [

	^ (Color fromString: '#0C1020') slightlyDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 20:03'
}
SIYLevel14 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 6@2 to: 10@5.
	self placeMultipleBlocks: SIYWall from: 6@6 to: 12@10.
	self placeMultipleBlocks: SIYTile from: 7@7 to: 11@9.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 8@3.
	self placeHorizontalRule: SIYWall is: SIYStop at: 8@5.
	
	self placeBlock: SIYKey at: 8@8.
	self placeBlock: SIYSqueak at: 10@8.
	self placeBlock: SIYDoor at: 12@8.
	
	self placeMultipleBlocksHollow: SIYWall from: 17@6 to: 23@10.
	self placeMultipleBlocksHollow: SIYWall from: 17@10 to: 22@15.
	self removeMultipleBlocksAt: {17@15 . 17@14}.
	self placeMultipleBlocks: SIYWall at: {18@13 . 18@14}.
	self placeMultipleBlocks: SIYWall from: 18@2 to: 22@5.
	
	self placeHorizontalRule: SIYDoor is: SIYStop at: 20@3.
	self placeHorizontalRule: SIYDoor is: SIYShut at: 20@5.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 20@14.
	
	self placeMultipleBlocks: SIYDoor at: {17@8 . 20@10}.
	self placeNounFor: SIYRock at: 20@8.
	self placeBlock: SIYFlag at: 20@12.
	
	self placeHorizontalRule: SIYKey is: SIYOpen at: 11@12.
	self placeVerticalRule: SIYKey is: SIYPush at: 10@13.
	
	self placeMultipleBlocks: SIYBrick from: 13@8 to: 16@8.
	self placeMultipleBlocks: SIYBrick from: 15@8 to: 15@14.
	self placeMultipleBlocks: SIYBrick from: 13@14 to: 15@14.
	self placeMultipleBlocks: SIYBrick from: 13@14 to: 13@16.
	self placeMultipleBlocks: SIYBrick from: 1@13 to: 3@14.
	
	self placeBlock: SIYRock at: 14@8.
	self placeBlock: SIYKey at: 15@8.
	
	self placeMultipleBlocks: SIYPillar at: {3@15 . 2@12}.
	self placeMultipleBlocks: SIYAlgae at: {4@16 . 5@15 . 26@1 . 27@2 . 28@4}.
	self placeMultipleBlocks: SIYBubble at: {2@3 . 4@7 . 14@2 . 27@8 . 25@14}
	
	
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:45'
}
SIYLevel14 >> description [

	^ 'Level 14: Lock'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:36'
}
SIYLevel14 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:44'
}
SIYLevel14 >> previousLevel [

	^ SIYLevel13
]
