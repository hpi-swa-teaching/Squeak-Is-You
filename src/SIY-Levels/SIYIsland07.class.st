Class {
	#name : #SIYIsland07,
	#superclass : #SIYWorld3,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 22:50'
}
SIYIsland07 >> arenaExtent [

	^ 15@8
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 22:56'
}
SIYIsland07 >> buildLevel [
	
	self placeHorizontalRule: SIYWater is: SIYSink at: 2@1.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 8@1.
	self placeHorizontalRule: SIYCog is: SIYPush at: 14@1.
	
	self placeMultipleBlocks: SIYWater from: 7@4 to: 9@6.
	self addBlock: SIYWin at: 8@5.
	
	self placeHorizontalRule: SIYText is: SIYFloat at: 3@5.
	self placeBlock: SIYSqueak at: 12@5.
	
	self placeMultipleBlocks: SIYCog at: {13@6 . 14@4}
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 22:48'
}
SIYIsland07 >> description [

	^ 'Level 3.7: Victory Spring'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 23:01'
}
SIYIsland07 >> nextLevel [

	^ SIYIsland08
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/15/2024 22:48'
}
SIYIsland07 >> previousLevel [

	^ SIYIsland06
]
