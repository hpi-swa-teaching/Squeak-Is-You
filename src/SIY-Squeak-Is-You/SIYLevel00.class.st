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
	#'squeak_changestamp' : 'LK 1/5/2024 00:32'
}
SIYLevel00 >> buildLevel [
	
	self placeBlocksHollow: SIYWall from: 1@1 to: self arenaExtent.
	self placeBlocks: SIYWall from: 11@2 to: 11@4.
	self placeBlocks: SIYWall from: 11@7 to: 11@14.
	
	self placeBlock: SIYRock at: 6@9.
	self placeBlock: SIYRock at: 9@8.
	self placeBlock: SIYRock at: 13@9.
	self placeBlock: SIYRock at: 8@10.
	
	self placeBlocks: SIYLava from: 15@3 to: 16@4.
	
	self placeBlock: SIYFlag at: 15@9.
	
	self placeBlock: SIYSqueak at: 3@14.
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 3@4.
	self placeVerticalRule: SIYWall is: SIYStop at: 4@4.
	self placeVerticalRule: SIYFlag is: SIYWin at: 5@4.
	self placeVerticalRule: SIYRock is: SIYPush at: 6@4.
	
	self placeHorizontalRule: SIYLava is: SIYDefeat at: 4@7.
	self placeHorizontalRule: SIYKey is: SIYOpen at: 4@8.
	self placeHorizontalRule: SIYDoor is: SIYShut at: 4@9.
	self placeHorizontalRule: SIYDoor is: SIYStop at: 4@10.
	self placeHorizontalRule: SIYKey is: SIYPush at: 4@11.
	
	self placeBlock: SIYKey at: 4@13. 
	self placeBlock: SIYDoor at: 7@13.
	
	

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
