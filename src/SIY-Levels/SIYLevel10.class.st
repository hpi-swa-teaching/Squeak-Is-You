Class {
	#name : #SIYLevel10,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:09'
}
SIYLevel10 >> arenaExtent [

	^ 25@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/7/2024 19:39'
}
SIYLevel10 >> backgroundColor [

	^ (Color fromString: '#0C1020') slightlyDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/7/2024 19:43'
}
SIYLevel10 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 17@5 to: 21@10.
	self placeBlock: SIYFlag at: 19@7.
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@16.
	
	self placeMultipleBlocks: SIYWall from: 10@5 to: 10@8.
	self placeBlock: SIYWall at: 6@5.
	self placeMultipleBlocks: SIYWall from: 5@5 to: 5@7.
	self placeMultipleBlocks: SIYWall from: 6@7 to: 6@8.
	
	self placeHorizontalRule: SIYCrab is: SIYPush at: 8@5.
	self placeHorizontalRule: SIYJelly is: SIYPush at: 8@6.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 8@7.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 8@8.
	
	self placeMultipleBlocks: SIYJelly at: {1@14 . 7@16 . 12@16 . 10@10 . 24@11 . 24@4 . 3@2 . 22@10 . 16@8}.
	self placeMultipleBlocks: SIYCrab at: {15@13 . 14@8 . 12@15 . 19@3 . 21@15 . 23@7 . 4@1 . 20@12 . 5@12 . 4@8 . 8@3 . 13@4}.
	self placeMultipleBlocks: SIYBubble at: {2@3 . 4@7 . 14@2 . 20@8 . 21@14}.
																							
	self placeBlock: SIYSqueak at: 14@5.
	
	
	
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:14'
}
SIYLevel10 >> description [

	^ 'Level 10: What To Push?'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:07'
}
SIYLevel10 >> nextLevel [

	^ SIYLevel11
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/6/2024 14:59'
}
SIYLevel10 >> previousLevel [

	^ SIYLevel09
]