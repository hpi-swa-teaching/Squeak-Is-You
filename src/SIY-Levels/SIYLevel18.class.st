Class {
	#name : #SIYLevel18,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:04'
}
SIYLevel18 >> arenaExtent [

	^ 23@15
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:33'
}
SIYLevel18 >> backgroundColor [

	^ (Color fromString: '#0C1020') slightlyDarker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:06'
}
SIYLevel18 >> buildLevel [
	
	self placeMultipleBlocks: SIYWall from: 8@6 to: 16@6.
	self placeMultipleBlocks: SIYTile from: 8@7 to: 16@9.
	self placeMultipleBlocks: SIYWall from: 8@10 to: 16@10.
	
	self placeMultipleBlocks: SIYRock from: 12@7 to: 12@9.
	
	self placeBlock: SIYFlag at: 15@8.
	
	self placeBlock: SIYSqueak at: 9@8.
	
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 9@5.
	self placeHorizontalRule: SIYWall is: SIYStop at: 9@11.
	self placeHorizontalRule: SIYFlag is: SIYWin at: 15@5.
	self placeHorizontalRule: SIYRock is: SIYPush at: 15@11.
	self placeHorizontalRule: SIYSqueak is: SIYFloat at: 2@1
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:00'
}
SIYLevel18 >> description [

	^ 'Level 18: Float'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:09'
}
SIYLevel18 >> nextLevel [

	^ SIYLevel19
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 22:31'
}
SIYLevel18 >> previousLevel [

	^ SIYLevel17
]
