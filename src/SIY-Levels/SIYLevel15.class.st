Class {
	#name : #SIYLevel15,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:44'
}
SIYLevel15 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:54'
}
SIYLevel15 >> backgroundColor [

	^ (Color fromString: '#0C1020') slightlyDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 21:49'
}
SIYLevel15 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 7@1 to: 13@14.
	self placeMultipleBlocksHollow: SIYWall from: 7@4 to: 22@12.
	
	self placeMultipleBlocks: SIYTile from: 8@1 to: 12@3.
	self placeMultipleBlocks: SIYTile from: 8@5 to: 12@13.
	self placeMultipleBlocks: SIYTile from: 14@5 to: 21@11.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 10@1.
	self placeHorizontalRule: SIYDoor	 is: SIYStop	 at: 10@2.
	self placeHorizontalRule: SIYWall is: SIYStop at: 10@3.
	
	self placeNounFor: SIYKey at: 9@7.
	self placeNounFor: SIYKey at: 9@9.
	self placeBlock: SIYOpen at: 11@7.
	self placeBlock: SIYPush at: 11@9.
	self placeBlock: SIYKey at: 9@11.
	self placeBlock: SIYIs at: 11@11.
	self placeBlock: SIYSqueak at: 10@13.
	
	self placeMultipleBlocks: SIYDoor at: {13@9 . 18@12}.
	self placeHorizontalRule: SIYDoor is: SIYShut at: 18@8.
	
	self placeBlock: SIYFlag at: 18@14.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 18@16.
	
	self placeMultipleBlocks: SIYAlgae at: {4@2 . 2@5 . 3@11 . 4@10 . 6@16 . 20@2 . 26@5 . 26@10 . 25@14}.
	self placeMultipleBlocks: SIYBubble at: {4@7 . 2@14 . 27@14 . 26@1 . 17@2}.
	self placeBlock: SIYStar at: 25@7.

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 21:34'
}
SIYLevel15 >> description [

	^ 'Level 15: Novice Locksmith'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:36'
}
SIYLevel15 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 21:34'
}
SIYLevel15 >> previousLevel [

	^ SIYLevel14
]
