Class {
	#name : #SIYLevel04,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 22:42'
}
SIYLevel04 >> arenaDimensions [

	^ 12@15
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 22:49'
}
SIYLevel04 >> buildLevel [
	
	self placeBlocks: SIYWall from: 5@1 to: 12@1.
	self placeBlocks: SIYWall from: 1@5 to: 5@5.
	self placeBlocks: SIYWall from: 1@9 to: 11@9.
	self placeBlocks: SIYWall from: 5@15 to: 12@15. 
	self placeBlocks: SIYWall from: 12@2 to: 12@14.
	self placeBlocks: SIYWall from: 5@2 to: 5@4. 
	self placeBlocks: SIYWall from: 1@6 to: 1@8.
	self placeBlocks: SIYWall from: 5@10 to: 5@14. 
	
	
	self placeBlock: SIYFlag at: 7@7.
	
	self placeBlock: SIYSqueak at: 10@12.
	
	self placeNounFor: SIYSqueak at: 2@11.
	self placeBlock: SIYIs at: 2@12.
	self placeBlock: SIYYou at: 2@13.
	
	self placeNounFor: SIYWall at: 7@11.
	self placeBlock: SIYIs at: 7@12.
	self placeBlock: SIYStop at: 7@13.
	
	self placeNounFor: SIYFlag at: 3@7.
	self placeBlock: SIYIs at: 7@3.
	self placeBlock: SIYWin at: 10@5.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 22:56'
}
SIYLevel04 >> nextLevel [

	^ SIYLevel05
]
