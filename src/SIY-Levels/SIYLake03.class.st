Class {
	#name : #SIYLake03,
	#superclass : #SIYWorld2,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/6/2024 19:07'
}
SIYLake03 >> arenaExtent [

	^ 24@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:26'
}
SIYLake03 >> buildLevel [
	
	self placeMultipleBlocksHollow: SIYWall from: 5@6 to: 9@10.
	self placeMultipleBlocksHollow: SIYTile from: 6@7 to: 8@9.
	self placeBlock: SIYSqueak at: 7@8.
	self placeBlock: SIYPillar at: 9@8.
	
	self placeMultipleBlocksHollow: SIYBrick from: 4@5 to: 10@11.
	self placeMultipleBlocks: SIYBrick from: 10@8 to: 16@8.
	self placeBlock: SIYBrick at: 16@7.
	self removeMultipleBlocksAt: { 7@5 . 9@5 . 6@11 . 7@11}.
	
	self placeMultipleBlocksHollow: SIYStar from: 17@6 to: 21@10.
	self placeMultipleBlocksHollow: SIYBrick from: 18@7 to: 20@9.
	self placeBlock: SIYFlag at: 19@8.
	
	self placeHorizontalRule: SIYFlag is: SIYWin at: 2@1.
	self placeHorizontalRule: SIYPillar is: SIYPush at: 7@3.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 7@13.
	self placeVerticalRule: SIYWall is: SIYStop at: 1@8.
	self placeHorizontalRule: SIYStar is: SIYDefeat at: 23@14.
	
	self placeMultipleBlocks: SIYPillar at: {11@3 . 13@4 . 20@2 . 19@13 . 13@12}.
	self placeMultipleBlocks: SIYAlgae at: {11@9 . 2@12 . 17@13 . 16@14 . 21@13 . 22@10 . 23@3 . 21@4 . 18@3 . 17@2 . 2@2}
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:37'
}
SIYLake03 >> description [

	^ 'Level 2.3: Pillar Yard'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:38'
}
SIYLake03 >> nextLevel [

	^ SIYLake04
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:37'
}
SIYLake03 >> previousLevel [

	^ SIYLake02
]
