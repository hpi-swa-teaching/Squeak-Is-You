Class {
	#name : #SIYLevel02,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:43'
}
SIYLevel02 >> arenaExtent [

	^ 12@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:35'
}
SIYLevel02 >> buildLevel [
	
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
	
	self placeVerticalRule: SIYSqueak is: SIYYou at: 2@12.
	self placeVerticalRule: SIYWall is: SIYStop at: 7@12.
	
	self placeNounFor: SIYFlag at: 3@7.
	self placeBlock: SIYIs at: 7@3.
	self placeBlock: SIYWin at: 10@5.
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:24'
}
SIYLevel02 >> nextLevel [

	^ SIYLevel03
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/4/2024 22:25'
}
SIYLevel02 >> previousLevel [

	^ SIYLevel01
]
