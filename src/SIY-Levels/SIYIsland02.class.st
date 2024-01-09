Class {
	#name : #SIYIsland02,
	#superclass : #SIYWorld3,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:04'
}
SIYIsland02 >> arenaExtent [

	^ 23@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 16:17'
}
SIYIsland02 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 8@6 to: 16@6.
	self placeMultipleBlocks: SIYTile from: 8@7 to: 16@9.
	self placeMultipleBlocks: SIYWall from: 8@10 to: 16@10.
	
	self placeMultipleBlocks: SIYRock from: 12@7 to: 12@9.
	
	self placeBlock: SIYFlag at: 15@8.
	
	self placeBlock: SIYSqueak at: 9@8.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 9@5.
	self placeHorizontalRule: SIYWall is: SIYStop at: 9@11.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 15@5.
	self placeHorizontalRule: SIYRock is: SIYPush at: 15@11.
	self placeHorizontalRule: SIYSqueak is: SIYFloat at: 2@1
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:55'
}
SIYIsland02 >> description [

	^ 'Level 3.2: Float'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:54'
}
SIYIsland02 >> nextLevel [

	^ SIYIsland03
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:58'
}
SIYIsland02 >> previousLevel [

	^ SIYIsland01
]
