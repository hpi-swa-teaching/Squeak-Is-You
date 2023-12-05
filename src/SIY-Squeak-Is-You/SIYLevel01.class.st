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
	#'squeak_changestamp' : 'LK 12/5/2023 12:02'
}
SIYLevel01 >> buildLevel [
	
	self placeBlocksHollow: SIYWall from: 0@0 to: self arenaDimensions.
	
	self placeBlock: SIYRock at: 6@3.
	self placeBlock: SIYRock at: 9@7.
	self placeBlock: SIYRock at: 13@8.
	
	self placeBlock: SIYSqueak at: 4@4.
]
