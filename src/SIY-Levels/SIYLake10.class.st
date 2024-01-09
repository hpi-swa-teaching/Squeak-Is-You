Class {
	#name : #SIYLake10,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/10/2024 00:11'
}
SIYLake10 >> arenaExtent [

	^ 15@9
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/10/2024 00:16'
}
SIYLake10 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 9@1 to: 15@9.
	self placeMultipleBlocksHollow: SIYWall from: 12@1 to: 15@5.
	self placeMultipleBlocksHollow: SIYWall from: 5@5 to: 9@9.
	self placeBlock: SIYWall at: 4@9.
	
	self placeBlock: SIYSqueak at: 4@2.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 4@3.
	
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@9.
	self placeMultipleBlocks: SIYCrab at: {5@7 . 6@7}.
	self placeBlock: SIYFlag at: 7@7.
	
	self placeBlock: SIYRock at: 9@2.
	self placeNounFor: SIYCrab at: 12@2.
	self placeVerticalRule: SIYFlag is: SIYDefeat at: 13@3.
	self placeBlock: SIYIs at: 14@3.
	self placeBlock: SIYWin at: 14@4.
	
	self placeHorizontalRule: SIYRock is: SIYPush at: 12@7
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/10/2024 00:16'
}
SIYLake10 >> description [

	^ 'Level 2.10: Submerged Ruins'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:52'
}
SIYLake10 >> nextLevel [

	^ SIYIsland01
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/10/2024 00:08'
}
SIYLake10 >> previousLevel [

	^ SIYLake09
]
