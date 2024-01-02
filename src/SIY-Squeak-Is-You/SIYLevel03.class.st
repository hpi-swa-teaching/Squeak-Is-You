Class {
	#name : #SIYLevel03,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 21:14'
}
SIYLevel03 >> arenaDimensions [

	^ 11@9
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 21:15'
}
SIYLevel03 >> buildLevel [
	
	self placeBlocks: SIYWall from: 1@3 to: 11@3.
	self placeBlocks: SIYWall from: 1@7 to: 11@7.
	
	self placeBlocks: SIYRock from: 6@4 to: 6@6.
	
	self placeBlock: SIYFlag at: 10@5.
	
	self placeBlock: SIYSqueak at: 2@5.
	
	self placeNounFor: SIYSqueak at: 1@1.
	self placeBlock: SIYIs at: 2@1.
	self placeBlock: SIYYou at: 3@1.
	
	self placeNounFor: SIYWall at: 1@9.
	self placeBlock: SIYIs at: 2@9.
	self placeBlock: SIYStop at: 3@9.
	
	self placeNounFor: SIYFlag at: 9@1.
	self placeBlock: SIYIs at: 10@1.
	self placeBlock: SIYWin at: 11@1.
	
	self placeNounFor: SIYRock at: 9@9.
	self placeBlock: SIYIs at: 10@9.
	self placeBlock: SIYPush at: 11@9.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 22:37'
}
SIYLevel03 >> nextLevel [

	^ SIYLevel04
]
