Class {
	#name : #SIYLake07,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:41'
}
SIYLake07 >> arenaExtent [

	^ 24@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 23:51'
}
SIYLake07 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 9@3 to: 17@12.
	self placeMultipleBlocks: SIYTile from: 10@4 to: 16@11.
	
	self placeBlock: SIYSqueak at: 10@4.
	self placeMultipleBlocks: SIYJelly at: {10@6 . 11@6 . 12@6 . 12@5}.
	
	self placeHorizontalRule: SIYJelly is: SIYStop at: 12@9.
	self placeVerticalRule: SIYWall is: SIYStop at: 15@6.
	
	self placeHorizontalRule: SIYFlag is: SIYWin at: 4@6.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 4@8.
	self placeHorizontalRule: SIYWall is: SIYDefeat at: 2@14.
	
	self placeMultipleBlocks: SIYStar at: {4@3 . 21@10}.
	self placeMultipleBlocks: SIYAlgae at: {6@1 . 2@4 . 7@8 . 5@10 . 3@11 . 19@2 . 23@3 . 21@7 . 22@8 . 19@11 . 22@14}
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:41'
}
SIYLake07 >> description [

	^ 'Level 2.7: Locked In'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:42'
}
SIYLake07 >> nextLevel [

	^ SIYLake08
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:42'
}
SIYLake07 >> previousLevel [

	^ SIYLake06
]
