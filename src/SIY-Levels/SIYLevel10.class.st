Class {
	#name : #SIYLevel10,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:49'
}
SIYLevel10 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/6/2024 15:04'
}
SIYLevel10 >> backgroundColor [

	^ (Color fromString: '#2a1919') slightlyDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/6/2024 15:37'
}
SIYLevel10 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 17@5 to: 21@5.
	self placeMultipleBlocks: SIYWall from: 17@10 to: 21@10.
	self placeMultipleBlocks: SIYWall from: 17@6 to: 17@9.
	self placeMultipleBlocks: SIYWall from: 21@6 to: 21@9.
	self placeBlock: SIYFlag at: 19@7.
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@16.
	
	self placeMultipleBlocks: SIYWall from: 10@5 to: 10@8.
	self placeBlock: SIYWall at: 6@5.
	self placeMultipleBlocks: SIYWall from: 5@5 to: 5@7.
	self placeMultipleBlocks: SIYWall from: 6@7 to: 6@8.
	
	self placeHorizontalRule: SIYFlower is: SIYPush at: 8@5.
	self placeHorizontalRule: SIYJelly is: SIYPush at: 8@6.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 8@7.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 8@8.
	
	self placeMultipleBlocks: SIYJelly at: {1@14 . 7@16 . 12@16 . 10@10 . 24@11 . 24@4 . 3@2 . 22@10 . 16@8}.
	self placeMultipleBlocks: SIYFlower at: {15@13 . 14@8 . 12@15 . 19@3 . 21@15 . 23@7 . 4@1 . 20@12 . 11@15 . 											 											    4@8 . 8@3 . 13@4}.
																							
	self placeBlock: SIYSqueak at: 14@5.
	
	
	
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/6/2024 15:10'
}
SIYLevel10 >> description [

	^ 'Level 10: What to push?'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:03'
}
SIYLevel10 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/6/2024 14:59'
}
SIYLevel10 >> previousLevel [

	^ SIYLevel09
]
