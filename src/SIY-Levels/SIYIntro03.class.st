Class {
	#name : #SIYIntro03,
	#superclass : #SIYWorld1,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYIntro03 >> arenaExtent [

	^ 12@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:26'
}
SIYIntro03 >> buildLevel [
	
	self placeMultipleBlocks: SIYFlag from: 5@1 to: 12@1.
	self placeMultipleBlocks: SIYFlag from: 1@5 to: 5@5.
	self placeMultipleBlocks: SIYFlag from: 1@9 to: 11@9.
	self placeMultipleBlocks: SIYFlag from: 5@15 to: 12@15. 
	self placeMultipleBlocks: SIYFlag from: 12@2 to: 12@14.
	self placeMultipleBlocks: SIYFlag from: 5@2 to: 5@4. 
	self placeMultipleBlocks: SIYFlag from: 1@6 to: 1@8.
	self placeMultipleBlocks: SIYFlag from: 5@10 to: 5@14. 
	
	self placeMultipleBlocks: SIYGrass from: 2@6 to: 5@8.
	self placeMultipleBlocks: SIYTile at: {2@2 . 4@3 . 1@4 . 3@15 . 4@12}.
	
	
	self placeBlock: SIYSqueak at: 7@7.
	
	self placeBlock: SIYWall at: 10@12.
	
	self placeVerticalRule: SIYWall is: SIYYou at: 2@12.
	self placeVerticalRule: SIYFlag is: SIYStop at: 7@12.
	
	self placeNounFor: SIYSqueak at: 3@7.
	self placeBlock: SIYIs at: 7@3.
	self placeBlock: SIYWin at: 10@5
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:18'
}
SIYIntro03 >> description [

	^ 'Level 1.3: Now What Is This?'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:34'
}
SIYIntro03 >> nextLevel [

	^ SIYIntro04
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYIntro03 >> previousLevel [

	^ SIYIntro02
]
