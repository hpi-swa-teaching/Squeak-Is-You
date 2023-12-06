Class {
	#name : #SIYLevel01,
	#superclass : #SIYLevel,
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
	#'squeak_changestamp' : 'LK 12/6/2023 21:42'
}
SIYLevel01 >> buildLevel [
	
	self placeBlocksHollow: SIYWall from: 1@1 to: self arenaDimensions.
	
	self placeBlock: SIYRock at: 6@8.
	self placeBlock: SIYRock at: 9@7.
	self placeBlock: SIYRock at: 13@8.
	self placeBlock: SIYRock at: 8@9.
	
	self placeBlock: SIYLava at: 15@3.
	self placeBlock: SIYLava at: 15@4.
	self placeBlock: SIYLava at: 16@3.
	self placeBlock: SIYLava at: 16@4.
	
	self placeBlock: SIYFlag at: 15@6.
	
	self placeBlock: SIYSqueak at: 4@7.
	
	self placeBlock: SIYSqueakT at: 2@2.
	self placeBlock: SIYIsT at: 2@3.
	self placeBlock: SIYYouT at: 2@4.
	
	self placeBlock: SIYWallT at: 3@2.
	self placeBlock: SIYIsT at: 3@3.
	self placeBlock: SIYStopT at: 3@4.
	
	self placeBlock: SIYFlagT at: 4@2.
	self placeBlock: SIYIsT at: 4@3.
	self placeBlock: SIYWinT at: 4@4.
	
	self placeBlock: SIYRockT at: 5@2.
	self placeBlock: SIYIsT at: 5@3.
	self placeBlock: SIYPushT at: 5@4.
	
	self placeBlock: SIYLavaT at: 2@6.
	self placeBlock: SIYIsT at: 3@6.
	self placeBlock: SIYDefeatT at: 4@6.
]
