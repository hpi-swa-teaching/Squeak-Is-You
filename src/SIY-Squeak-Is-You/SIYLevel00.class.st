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
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevel00 >> buildLevel [
	
	self placeBlocksHollow: SIYWall from: 1@1 to: self arenaExtent.
	self placeBlocks: SIYWall from: 11@2 to: 11@4.
	self placeBlocks: SIYWall from: 11@7 to: 11@14.
	
	self placeBlock: SIYRock at: 6@9.
	self placeBlock: SIYRock at: 9@8.
	self placeBlock: SIYRock at: 13@9.
	self placeBlock: SIYRock at: 8@10.
	
	self placeBlock: SIYLava at: 15@3.
	self placeBlock: SIYLava at: 15@4.
	self placeBlock: SIYLava at: 16@3.
	self placeBlock: SIYLava at: 16@4.
	
	self placeBlock: SIYFlag at: 15@9.
	
	self placeBlock: SIYSqueak at: 3@14.
	
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
	
	self placeNounFor: SIYKey at: 3@8.
	self placeBlock: SIYIs at: 4@8.
	self placeBlock: SIYOpen at: 5@8.
	
	self placeNounFor: SIYDoor at: 3@9.
	self placeBlock: SIYIs at: 4@9.
	self placeBlock: SIYShut at: 5@9.
	
	self placeNounFor: SIYDoor at: 3@10.
	self placeBlock: SIYIs at: 4@10.
	self placeBlock: SIYStop at: 5@10.
	
	self placeNounFor: SIYKey at: 3@11.
	self placeBlock: SIYIs at: 4@11.
	self placeBlock: SIYPush at: 5@11.
	
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
	#'squeak_changestamp' : 'LK 1/4/2024 22:26'
}
SIYLevel00 >> previousLevel [

	^ nil
]
