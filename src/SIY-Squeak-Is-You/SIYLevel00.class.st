Class {
	#name : #SIYLevel00,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevel00 >> arenaExtent [

	^ 20@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 14:24'
}
SIYLevel00 >> buildLevel [
	
	self placeBlocksHollow: SIYWall from: 1@1 to: self arenaExtent.
	
	self placeBlocks: SIYWall from: 11@2 to: 11@5.
	self placeBlock: SIYDoor at: 11@6.
	self placeBlocks: SIYWall from: 11@7 to: 11@14.
	
	self placeBlocks: SIYRock at: {9@8 . 13@9 . 8@10}.
	
	self placeBlock: SIYSqueak at: 3@14.
	
	self placeBlocks: SIYSkull from: 9@13 to: 10@14.
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 3@4.
	self placeVerticalRule: SIYWall is: SIYStop at: 4@4.
	self placeVerticalRule: SIYFlag is: SIYWin at: 5@4.
	self placeVerticalRule: SIYRock is: SIYPush at: 6@4.
	self placeVerticalRule: SIYSkull is: SIYDefeat at: 7@4.
	
	self placeHorizontalRule: SIYKey is: SIYPush at: 4@7.
	self placeHorizontalRule: SIYKey is: SIYOpen at: 4@8.
	self placeHorizontalRule: SIYDoor is: SIYShut at: 4@9.
	self placeHorizontalRule: SIYDoor is: SIYStop at: 4@10.
	
	self placeVerticalRule: SIYWater is: SIYSink at: 18@8.
	self placeVerticalRule: SIYLava is: SIYHot at: 17@4.
	self placeVerticalRule: SIYSqueak is: SIYMelt at: 18@4.

	self placeBlock: SIYKey at: 4@13. 
	
	self placeBlocks: SIYLava from: 14@3 to: 15@4.
	
	self placeBlocks: SIYWater from: 12@11 to: 19@11.
	
	self placeBlock: SIYFlag at: 18@13.
	
	self placeBlocks: SIYGrass at: {3@12 . 7@13 . 8@7 . 9@4 . 13@5 . 15@8}.
	self placeNounFor: SIYGrass at: 13@7
	
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:26'
}
SIYLevel00 >> nextLevel [

	^ SIYLevel01
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:47'
}
SIYLevel00 >> previousLevel [

	^ SIYLevel05
]
