Class {
	#name : #SIYIntro02,
	#superclass : #SIYWorld1,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYIntro02 >> arenaExtent [

	^ 12@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:26'
}
SIYIntro02 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 5@1 to: 12@1.
	self placeMultipleBlocks: SIYWall from: 1@5 to: 5@5.
	self placeMultipleBlocks: SIYWall from: 1@9 to: 11@9.
	self placeMultipleBlocks: SIYWall from: 5@15 to: 12@15. 
	self placeMultipleBlocks: SIYWall from: 12@2 to: 12@14.
	self placeMultipleBlocks: SIYWall from: 5@2 to: 5@4. 
	self placeMultipleBlocks: SIYWall from: 1@6 to: 1@8.
	self placeMultipleBlocks: SIYWall from: 5@10 to: 5@14. 
	
	self placeMultipleBlocks: SIYTile from: 2@6 to: 5@8.
	self placeMultipleBlocks: SIYGrass at: {2@2 . 4@3 . 1@4 . 3@15 . 4@12}.
	
	
	self placeBlock: SIYFlag at: 7@7.
	
	self placeBlock: SIYSqueak at: 10@12.
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 2@12.
	self placeVerticalRule: SIYWall is: SIYStop at: 7@12.
	
	self placeNounFor: SIYFlag at: 3@7.
	self placeBlock: SIYIs at: 7@3.
	self placeBlock: SIYWin at: 10@5
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:18'
}
SIYIntro02 >> description [

	^ 'Level 1.2: Where Do I Go?'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYIntro02 >> nextLevel [

	^ SIYIntro03
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYIntro02 >> previousLevel [

	^ SIYIntro01
]
