Class {
	#name : #SIYIsland11,
	#superclass : #SIYWorld3,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:47'
}
SIYIsland11 >> arenaExtent [

	^ 15@8
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:52'
}
SIYIsland11 >> buildLevel [

	self placeHorizontalRule: SIYSqueak is: SIYYou at: 2@1.
	self placeNounFor: SIYFlag at: 2@2.
	self placeMultipleBlocks: SIYSkull from: 3@2 to: 5@2.
	
	self placeBlock: SIYIs at: 1@3.
	self placeBlock: SIYWin at: 1@4.
	self placeBlock: SIYWall at: 1@5.
	
	self placeBlock: SIYSqueak at: 5@5.
	
	self placeVerticalRule: SIYWater is: SIYSink at: 3@5.
	self placeHorizontalRule: SIYWall is: SIYStop at: 2@8.
	
	self placeMultipleBlocks: SIYWater from: 8@1 to: 8@8.
	
	self placeBlock: SIYWall at: 10@1.
	self placeHorizontalRule: SIYCog is: SIYPush and: SIYMelt at: 12@1.
	self placeVerticalRule: SIYSkull is: SIYDefeat at: 15@3.
	
	self placeBlock: SIYCog at: 11@3.
	self placeBlock: SIYFlag at: 11@6.
	
	self placeHorizontalRule: SIYWater is: SIYHot at: 14@8
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:47'
}
SIYIsland11 >> description [

	^ 'Level 3.11: Evaporating River'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:13'
}
SIYIsland11 >> nextLevel [

	^ SIYPlayground
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:46'
}
SIYIsland11 >> previousLevel [

	^ SIYIsland10
]
