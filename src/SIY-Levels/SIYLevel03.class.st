Class {
	#name : #SIYLevel03,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevel03 >> arenaExtent [

	^ 12@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 16:23'
}
SIYLevel03 >> buildLevel [
	
	self placeMultipleBlocks: SIYFlag from: 5@1 to: 12@1.
	self placeMultipleBlocks: SIYFlag from: 1@5 to: 5@5.
	self placeMultipleBlocks: SIYFlag from: 1@9 to: 11@9.
	self placeMultipleBlocks: SIYFlag from: 5@15 to: 12@15. 
	self placeMultipleBlocks: SIYFlag from: 12@2 to: 12@14.
	self placeMultipleBlocks: SIYFlag from: 5@2 to: 5@4. 
	self placeMultipleBlocks: SIYFlag from: 1@6 to: 1@8.
	self placeMultipleBlocks: SIYFlag from: 5@10 to: 5@14. 
	
	
	self placeBlock: SIYSqueak at: 7@7.
	
	self placeBlock: SIYWall at: 10@12.
	
	self placeVerticalRule: SIYWall is: SIYYou at: 2@12.
	self placeVerticalRule: SIYFlag is: SIYStop at: 7@12.
	
	self placeNounFor: SIYSqueak at: 3@7.
	self placeBlock: SIYIs at: 7@3.
	self placeBlock: SIYWin at: 10@5.
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:24'
}
SIYLevel03 >> nextLevel [

	^ SIYLevel04
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:25'
}
SIYLevel03 >> previousLevel [

	^ SIYLevel02
]
