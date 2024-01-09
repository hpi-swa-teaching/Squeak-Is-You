Class {
	#name : #SIYLake04,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:30'
}
SIYLake04 >> arenaExtent [

	^ 15@8
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:34'
}
SIYLake04 >> buildLevel [
	
	self placeMultipleBlocks: SIYTile from: 4@2 to: 8@7.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 6@3.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 6@6.
	
	self placeMultipleBlocks: SIYWall from: 10@3 to: 15@7.
	self placeMultipleBlocks: SIYBrick from: 11@4 to: 13@6.
	self placeBlock: SIYFlag at: 12@5.
	self placeVerticalRule: SIYWall is: SIYStop at: 15@5.
	
	self placeBlock: SIYSqueak at: 2@5.
	
	self placeMultipleBlocks: SIYAlgae at: {1@2 . 2@1 . 14@1 . 13@8 . 3@8}
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:38'
}
SIYLake04 >> description [

	^ 'Level 2.4: Brick Wall'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:39'
}
SIYLake04 >> nextLevel [

	^ SIYLake05
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:37'
}
SIYLake04 >> previousLevel [

	^ SIYLake03
]
