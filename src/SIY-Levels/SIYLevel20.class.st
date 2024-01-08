Class {
	#name : #SIYLevel20,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:34'
}
SIYLevel20 >> arenaExtent [

	^ 24@18
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:34'
}
SIYLevel20 >> backgroundColor [

	^ (Color fromString: '#1e2c5c') muchDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:58'
}
SIYLevel20 >> buildLevel [
	
	self placeMultipleBlocks: SIYHedge from: 10@3 to: 19@3.
	self placeMultipleBlocks: SIYHedge from: 9@4 to: 9@7.
	self placeMultipleBlocks: SIYHedge from: 19@4 to: 19@16.
	self placeMultipleBlocks: SIYHedge from: 6@16 to: 18@16.
	self placeMultipleBlocks: SIYHedge from: 5@15 to: 6@15.
	self placeMultipleBlocks: SIYHedge from: 5@14 to: 5@10.
	self placeMultipleBlocks: SIYHedge from: 6@7 to: 8@7.
	self placeMultipleBlocks: SIYHedge from: 6@8 to: 6@13.
	self placeMultipleBlocks: SIYHedge from: 15@12 to: 15@15.
	self placeMultipleBlocks: SIYHedge from: 14@12 to: 14@15.
	self placeMultipleBlocks: SIYHedge from: 16@12 to: 18@12.
	self placeMultipleBlocks: SIYHedge from: 16@13 to: 18@13.
	self placeMultipleBlocks: SIYHedge at: {10@4 . 13@15}.
	
	self placeMultipleBlocks: SIYWater from: 15@4 to: 15@11.
	self placeMultipleBlocks: SIYWater from: 14@4 to: 14@11.
	
	self placeBlock: SIYFlag at: 17@9.
	self placeBlock: SIYSqueak at: 8@9.
	self placeMultipleBlocks: SIYRock at: {10@5 . 10@10}.
	
	self placeHorizontalRule: SIYText is: SIYFloat at: 5@4.
	self placeHorizontalRule: SIYRock is: SIYPush at: 9@12.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 7@14.
	self placeHorizontalRule: SIYWater is: SIYSink at: 17@14.
	self placeHorizontalRule: SIYHedge is: SIYStop at: 17@15.
	self placeVerticalRule: SIYFlag is: SIYWin at: 17@6.
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:00'
}
SIYLevel20 >> description [

	^ 'Level 18: Float'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:58'
}
SIYLevel20 >> nextLevel [

	^ SIYLevel21
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:32'
}
SIYLevel20 >> previousLevel [

	^ SIYLevel19
]
