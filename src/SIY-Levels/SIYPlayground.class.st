Class {
	#name : #SIYPlayground,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 22:42'
}
SIYPlayground >> arenaExtent [

	^ 22@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 16:48'
}
SIYPlayground >> backgroundColor [

	^ Color fromString: '#0d0d0d'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/16/2024 18:11'
}
SIYPlayground >> buildLevel [
	
	self placeNounFor: SIYSqueak at: 1@1.
	self placeBlock: SIYSqueak at: 1@2.
	
	self placeNounFor: SIYWall at: 2@1.
	self placeBlock: SIYWall at: 2@2.
	
	self placeNounFor: SIYRock at: 3@1.
	self placeBlock: SIYRock at: 3@2.
	
	self placeNounFor: SIYFlag at: 4@1.
	self placeBlock: SIYFlag at: 4@2.
	
	self placeNounFor: SIYWater at: 5@1.
	self placeBlock: SIYWater at: 5@2.
	
	self placeNounFor: SIYSkull at: 6@1.
	self placeBlock: SIYSkull at: 6@2.
	
	self placeNounFor: SIYLava at: 7@1.
	self placeBlock: SIYLava at: 7@2.
	
	self placeNounFor: SIYIce at: 8@1.
	self placeBlock: SIYIce at: 8@2.
	
	self placeNounFor: SIYDoor at: 9@1.
	self placeBlock: SIYDoor at: 9@2.
	
	self placeNounFor: SIYKey at: 10@1.
	self placeBlock: SIYKey at: 10@2.
	
	self placeNounFor: SIYBubble at: 11@1.
	self placeBlock: SIYBubble at: 11@2.
	
	self placeNounFor: SIYGrass at: 12@1.
	self placeBlock: SIYGrass at: 12@2.
	
	self placeNounFor: SIYHedge at: 13@1.
	self placeBlock: SIYHedge at: 13@2.
	
	self placeNounFor: SIYFlower at: 14@1.
	self placeBlock: SIYFlower at: 14@2.
	
	self placeNounFor: SIYAlgae at: 15@1.
	self placeBlock: SIYAlgae at: 15@2.
	
	self placeNounFor: SIYStar at: 16@1.
	self placeBlock: SIYStar at: 16@2.
		
	self placeNounFor: SIYJelly at: 17@1.
	self placeBlock: SIYJelly at: 17@2.
	
	self placeNounFor: SIYCrab at: 18@1.
	self placeBlock: SIYCrab at: 18@2.
	
	self placeNounFor: SIYPillar at: 19@1.
	self placeBlock: SIYPillar at: 19@2.
	
	self placeNounFor: SIYCog at: 20@1.
	self placeBlock: SIYCog at: 20@2.
	
	self placeNounFor: SIYBrick at: 21@1.
	self placeBlock: SIYBrick at: 21@2.
	
	self placeNounFor: SIYTile at: 22@1.
	self placeBlock: SIYTile at: 22@2.
	
	self placeMultipleBlocks: SIYWall from: 1@3 to: (self arenaExtent x)@3.
	
	self placeNounFor: SIYText at: (self arenaExtent x)@4.
	self placeBlock: SIYIs at: (self arenaExtent x - 1)@4.
	self placeBlock: SIYAnd at: (self arenaExtent x - 2)@4.

	self placeBlock: SIYYou at: 1@4.
	self placeBlock: SIYStop at: 2@4.
	self placeBlock: SIYPush at: 3@4.
	self placeBlock: SIYWin at: 4@4.
	self placeBlock: SIYSink at: 5@4.
	self placeBlock: SIYDefeat at: 6@4.
	self placeBlock: SIYHot at: 7@4.
	self placeBlock: SIYMelt at: 8@4.
	self placeBlock: SIYShut at: 9@4.
	self placeBlock: SIYOpen at: 10@4.
	self placeBlock: SIYFloat at: 11@4.
	self placeBlock: SIYWeak at: 12@4.
	
	self placeMultipleBlocks: SIYWall from: 1@5 to: (self arenaExtent x)@5.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 4@8.
	self placeBlock: SIYSqueak at: 7@8.
	
	self placeHorizontalRule: SIYRock is: SIYPush at: 4@11.
	self placeBlock: SIYRock at: 7@11.
	
	self placeHorizontalRule: SIYWall is: SIYStop at: 4@14.
	self placeBlock: SIYWall at: 7@14.
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:34'
}
SIYPlayground >> description [

	^ 'Playground'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:33'
}
SIYPlayground >> nextLevel [

	^ SIYIntro01
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/16/2024 18:43'
}
SIYPlayground >> previousLevel [

	^ SIYRuins01
]
