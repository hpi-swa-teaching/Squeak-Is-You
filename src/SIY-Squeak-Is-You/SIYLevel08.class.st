Class {
	#name : #SIYLevel08,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 16:39'
}
SIYLevel08 >> arenaExtent [

	^ 24@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 16:46'
}
SIYLevel08 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 6@3 to: 19@12.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 9@5.
	self placeVerticalRule: SIYGrass is: SIYStop at: 24@8.
	
	self placeHorizontalRule: SIYFlag is: SIYWin at: 16@9.
	self removeBlockAt: 16@9.
	
	self placeBlock: SIYFlag at: 17@5.
	
	self placeMultipleBlocks: SIYGrass at: {7@6 . 11@4 . 7@9 . 8@10 . 11@11 . 14@11 . 16@10 . 16@8 . 17@7 . 18@8 . 15@7 . 14@6}.
	self placeMultipleBlocks: SIYGrass from: 13@10 to: 13@8.
	
	self placeBlock: SIYSqueak at: 11@8.
	
	
	
	
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:03'
}
SIYLevel08 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 16:37'
}
SIYLevel08 >> previousLevel [

	^ SIYLevel07
]
