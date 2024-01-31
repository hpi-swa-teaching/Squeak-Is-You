Class {
	#name : #SIYRuins01,
	#superclass : #SIYWorld4,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/16/2024 18:45'
}
SIYRuins01 >> arenaExtent [

	^ 24@18
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/30/2024 22:26'
}
SIYRuins01 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 9@1 to: 9@4.
	self placeMultipleBlocks: SIYWall from: 9@4 to: 21@4.
	self placeMultipleBlocks: SIYWall from: 21@4 to: 21@17.
	self placeMultipleBlocks: SIYWall from: 21@17 to: 13@17.
	self placeMultipleBlocks: SIYWall from: 13@18 to: 13@11.
	self placeMultipleBlocks: SIYWall from: 11@11 to: 17@11.
	self placeMultipleBlocks: SIYWall from: 11@10 to: 1@10.
	self placeMultipleBlocks: SIYWall at: {17@10 . 11@15}.
	
	self placeMultipleBlocks: SIYRock at: {13@15 . 19@8}.
	self placeMultipleBlocks: SIYSkull from: 18@10 to: 20@11.
	
	self placeBlock: SIYSqueak at: 7@8.
	self placeMultipleBlocks: SIYGrass from: 10@6 to: 10@9.
	
	self placeHorizontalRule: SIYWall is: SIYStop at: 11@3.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 14@7.
	self placeVerticalRule: SIYSqueak is: SIYWeak at: 13@8.
	self placeHorizontalRule: SIYSkull is: SIYDefeat at: 19@5.
	self placeHorizontalRule: SIYRock	 is: SIYPush at: 15@12.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 8@14.
	
	self placeBlock: SIYFlag at: 8@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/16/2024 18:57'
}
SIYRuins01 >> description [

	^ 'Level 4.1: Fragility'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:13'
}
SIYRuins01 >> nextLevel [

	^ SIYPlayground
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/16/2024 18:43'
}
SIYRuins01 >> previousLevel [

	^ SIYIsland11
]
