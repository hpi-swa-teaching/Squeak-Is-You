Class {
	#name : #SIYLevel01,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/5/2023 11:28'
}
SIYLevel01 >> arenaDimensions [

	^ 20@12
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/7/2023 18:58'
}
SIYLevel01 >> buildLevel [
	
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
	
	self placeBlock: SIYSqueak at: 3@10.
	
	self placeBlock: SIYSqueakT at: 3@3.
	self placeBlock: SIYIsT at: 3@4.
	self placeBlock: SIYYouT at: 3@5.
	
	self placeBlock: SIYWallT at: 4@3.
	self placeBlock: SIYIsT at: 4@4.
	self placeBlock: SIYStopT at: 4@5.
	
	self placeBlock: SIYFlagT at: 5@3.
	self placeBlock: SIYIsT at: 5@4.
	self placeBlock: SIYWinT at: 5@5.
	
	self placeBlock: SIYRockT at: 6@3.
	self placeBlock: SIYIsT at: 6@4.
	self placeBlock: SIYPushT at: 6@5.
	
	self placeBlock: SIYLavaT at: 3@7.
	self placeBlock: SIYIsT at: 4@7.
	self placeBlock: SIYDefeatT at: 5@7.
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 12/21/2023 16:34'
}
SIYLevel01 >> nextLevel [

	^ SIYLevel02
]
