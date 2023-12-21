Class {
	#name : #SIYLevel02,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/5/2023 11:28'
}
SIYLevel02 >> arenaDimensions [

	^ 20@12
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/21/2023 16:55'
}
SIYLevel02 >> buildLevel [
	
	self placeBlocksHollow: SIYWall from: 1@1 to: self arenaDimensions.
	self placeBlocks: SIYWall from: 11@2 to: 11@4.
	self placeBlocks: SIYWall from: 11@7 to: 11@11.
	
	self placeBlock: SIYRock at: 6@9.
	self placeBlock: SIYRock at: 9@8.
	self placeBlock: SIYRock at: 13@9.
	self placeBlock: SIYRock at: 8@10.
	
	self placeBlock: SIYLava at: 15@3.
	self placeBlock: SIYLava at: 15@4.
	self placeBlock: SIYLava at: 16@3.
	self placeBlock: SIYLava at: 16@4.
	
	self placeBlock: SIYFlag at: 15@9.
	
	self placeBlock: SIYSqueak at: 5@5.

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/21/2023 16:55'
}
SIYLevel02 >> nextLevel [

	^ SIYLevel01
]
