Class {
	#name : #SIYLevel11,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:49'
}
SIYLevel11 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:54'
}
SIYLevel11 >> backgroundColor [

	^ (Color fromString: '#0C1020') slightlyDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 18:03'
}
SIYLevel11 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 9@3 to: 21@13.
	
	self placeMultipleBlocksHollow: SIYWall from: 5@4 to: 9@10.
	self placeMultipleBlocks: SIYWall from: 6@10 to: 9@13.
	self placeMultipleBlocks: SIYTile from: 6@5 to: 8@6.
	self placeMultipleBlocks: SIYTile from: 6@8 to: 8@9.
	self placeMultipleBlocks: SIYWall from: 10@6 to: 11@8.
	self removeMultipleBlocksAt: {9@7 . 10@7 . 11@7 . 7@6 . 7@8}.
	
	self placeBlock: SIYCrab at: 3@7.
	self placeNounFor: SIYCrab at: 7@7.
	self placeBlock: SIYSkull at: 9@7.
	self placeBlock: SIYStar at: 11@7.
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 7@11.
	self placeHorizontalRule: SIYSkull is: SIYDefeat at: 7@3.
	
	self placeBlock: SIYFlag at: 4@12.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 4@14.
	
	self placeHorizontalRule: SIYStar is: SIYSink at: 15@6.
	self placeHorizontalRule: SIYRock	 is: SIYPush at: 15@8.
	self placeBlock: SIYRock at: 14@10.
	self placeBlock: SIYAnd at: 16@10.
	
	self placeMultipleBlocks: SIYWall from: 22@7 to: 26@11.
	self placeMultipleBlocks: SIYTile from: 23@8 to: 23@10.
	self placeMultipleBlocks: SIYTile from: 25@8 to: 25@10.
	self removeMultipleBlocksAt: {21@8 . 22@8}.
	
	self placeBlock: SIYRock at: 22@8.
	self placeBlock: SIYSqueak at: 24@9.
	
	self placeHorizontalRule: SIYWall is: SIYStop at: 23@6.
	
	self placeMultipleBlocks: SIYJelly at: {24@13 . 20@15 . 25@4}.
	self placeMultipleBlocks: SIYAlgae at: {1@2 . 2@1 . 1@16 . 1@15 . 1@13 . 2@16 . 8@16 . 23@1 . 22@1 . 26@2 . 27@3 . 26@16 . 26@14 . 25@15 . 24@15 . 23@15}
	
	
	
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:37'
}
SIYLevel11 >> description [

	^ 'Level 11: Turns'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:08'
}
SIYLevel11 >> nextLevel [

	^ SIYLevel12
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 17:36'
}
SIYLevel11 >> previousLevel [

	^ SIYLevel10
]
