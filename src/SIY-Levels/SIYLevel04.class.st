Class {
	#name : #SIYLevel04,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevel04 >> arenaExtent [

	^ 18@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:26'
}
SIYLevel04 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 1@4 to: 3@4.
	self placeMultipleBlocks: SIYWall from: 3@1 to: 3@3.
	self placeMultipleBlocks: SIYWall from: 8@2 to: 15@2.
	self placeMultipleBlocks: SIYWall from: 5@8 to: 8@8. 
	self placeMultipleBlocks: SIYWall from: 12@8 to: 18@8.
	self placeMultipleBlocks: SIYWall from: 5@15 to: 18@15. 
	self placeMultipleBlocks: SIYWall from: 8@3 to: 8@7.
	self placeMultipleBlocks: SIYWall from: 15@3 to: 15@7. 
	self placeMultipleBlocks: SIYWall from: 5@9 to: 5@14.
	self placeMultipleBlocks: SIYWall from: 18@9 to: 18@14. 
	self placeMultipleBlocks: SIYWall from: 12@9 to: 12@11.
	self placeMultipleBlocks: SIYWall from: 12@13 to: 12@14. 
	
	self placeMultipleBlocks: SIYTile from: 9@3 to: 14@7.
	self placeMultipleBlocks: SIYGrass at: {5@2 . 6@4 . 5@6 . 4@6 . 1@8 . 2@9 . 17@1 . 18@3 . 16@6 . 17@7}.
	self placeMultipleBlocks: SIYGrass from: 2@12 to: 3@13.
	
	self placeMultipleBlocks: SIYWater from: 6@12 to: 8@13. 
	self placeMultipleBlocks: SIYWater from: 7@14 to: 8@14.  
	self placeMultipleBlocks: SIYWater from: 9@8 to: 11@8.
	
	self placeNounFor: SIYWater at: 7@5.
	self placeBlock: SIYIs at: 7@6.
	self placeBlock: SIYSink at: 7@7.
	
	self placeBlock: SIYSqueak at: 10@4.
	
	self placeBlock: SIYRock at: 13@4.
	self placeBlock: SIYRock at: 13@6.
	
	self placeBlock: SIYFlag at: 6@14.
	
	self placeBlock: SIYWall at: 10@12.
	
	self placeHorizontalRule: SIYRock is: SIYPush at: 15@10.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 15@13.
	
	self placeVerticalRule: SIYWall is: SIYStop at: 2@2.
	self placeVerticalRule: SIYSqueak is: SIYYou at: 1@2

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:34'
}
SIYLevel04 >> description [

	^ 'Level 4: Out Of Reach'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:47'
}
SIYLevel04 >> nextLevel [

	^ SIYLevel05
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:25'
}
SIYLevel04 >> previousLevel [

	^ SIYLevel03
]
