Class {
	#name : #SIYLevel06,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/3/2024 12:47'
}
SIYLevel06 >> arenaDimensions [

	^ 18@15
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/4/2024 16:36'
}
SIYLevel06 >> buildLevel [
	
	self placeBlocks: SIYWall from: 1@4 to: 3@4.
	self placeBlocks: SIYWall from: 3@1 to: 3@3.
	self placeBlocks: SIYWall from: 8@2 to: 15@2.
	self placeBlocks: SIYWall from: 5@8 to: 8@8. 
	self placeBlocks: SIYWall from: 12@8 to: 18@8.
	self placeBlocks: SIYWall from: 5@15 to: 18@15. 
	self placeBlocks: SIYWall from: 8@3 to: 8@7.
	self placeBlocks: SIYWall from: 15@3 to: 15@7. 
	self placeBlocks: SIYWall from: 5@9 to: 5@14.
	self placeBlocks: SIYWall from: 18@9 to: 18@14. 
	self placeBlocks: SIYWall from: 12@9 to: 12@11.
	self placeBlocks: SIYWall from: 12@13 to: 12@14. 
	
	self placeBlocks: SIYWater from: 6@12 to: 8@12. 
	self placeBlocks: SIYWater from: 6@13 to: 8@13.
	self placeBlocks: SIYWater from: 7@14 to: 8@14.  
	self placeBlocks: SIYWater from: 9@8 to: 11@8.
	
	self placeNounFor: SIYWater at: 7@5.
	self placeBlock: SIYIs at: 7@6.
	self placeBlock: SIYSink at: 7@7.
	
	self placeBlock: SIYSqueak at: 10@4.
	
	self placeBlock: SIYRock at: 13@4.
	self placeBlock: SIYRock at: 13@6.
	
	self placeNounFor: SIYRock at: 14@10.
	self placeBlock: SIYIs at: 15@10.
	self placeBlock: SIYPush at: 16@10.
	
	self placeBlock: SIYFlag at: 6@14.
	
	self placeBlock: SIYWall at: 10@12.
	
	self placeNounFor: SIYWall at: 2@1.
	self placeBlock: SIYIs at: 2@2.
	self placeBlock: SIYStop at: 2@3.
	
	self placeNounFor: SIYFlag at: 14@13.
	self placeBlock: SIYIs at: 15@13.
	self placeBlock: SIYWin at: 16@13.
	
	self placeNounFor: SIYSqueak at: 1@1.
	self placeBlock: SIYIs at: 1@2.
	self placeBlock: SIYYou at: 1@3.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/3/2024 12:48'
}
SIYLevel06 >> nextLevel [

	^ SIYLevel02
]
