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
	#'squeak_changestamp' : 'LK 1/3/2024 23:46'
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
	
	self placeNounFor: SIYSqueak at: 3@3.
	self placeBlock: SIYIs at: 3@4.
	self placeBlock: SIYYou at: 3@5.
	
	self placeNounFor: SIYWall at: 4@3.
	self placeBlock: SIYIs at: 4@4.
	self placeBlock: SIYStop at: 4@5.
	
	self placeNounFor: SIYFlag at: 5@3.
	self placeBlock: SIYIs at: 5@4.
	self placeBlock: SIYWin at: 5@5.
	
	self placeNounFor: SIYRock at: 6@3.
	self placeBlock: SIYIs at: 6@4.
	self placeBlock: SIYPush at: 6@5.
	
	self placeNounFor: SIYLava at: 3@7.
	self placeBlock: SIYIs at: 4@7.
	self placeBlock: SIYDefeat at: 5@7.
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'KD 1/2/2024 21:08'
}
SIYLevel01 >> nextLevel [

	^ SIYLevel03
]
