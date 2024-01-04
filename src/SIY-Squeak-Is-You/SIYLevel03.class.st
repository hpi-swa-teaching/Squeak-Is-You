Class {
	#name : #SIYLevel03,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 22:52'
}
SIYLevel03 >> arenaDimensions [

	^ 12@15
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/2/2024 22:55'
}
SIYLevel03 >> buildLevel [
	
	self placeBlocks: SIYFlag from: 5@1 to: 12@1.
	self placeBlocks: SIYFlag from: 1@5 to: 5@5.
	self placeBlocks: SIYFlag from: 1@9 to: 11@9.
	self placeBlocks: SIYFlag from: 5@15 to: 12@15. 
	self placeBlocks: SIYFlag from: 12@2 to: 12@14.
	self placeBlocks: SIYFlag from: 5@2 to: 5@4. 
	self placeBlocks: SIYFlag from: 1@6 to: 1@8.
	self placeBlocks: SIYFlag from: 5@10 to: 5@14. 
	
	
	self placeBlock: SIYSqueak at: 7@7.
	
	self placeBlock: SIYWall at: 10@12.
	
	self placeNounFor: SIYWall at: 2@11.
	self placeBlock: SIYIs at: 2@12.
	self placeBlock: SIYYou at: 2@13.
	
	self placeNounFor: SIYFlag at: 7@11.
	self placeBlock: SIYIs at: 7@12.
	self placeBlock: SIYStop at: 7@13.
	
	self placeNounFor: SIYSqueak at: 3@7.
	self placeBlock: SIYIs at: 7@3.
	self placeBlock: SIYWin at: 10@5.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/4/2024 22:24'
}
SIYLevel03 >> nextLevel [

	^ SIYLevel04
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/4/2024 22:25'
}
SIYLevel03 >> previousLevel [

	^ SIYLevel02
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/4/2024 22:33'
}
SIYLevel03 >> scaleLevel [

	^ 1
]
