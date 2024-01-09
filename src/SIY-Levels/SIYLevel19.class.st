Class {
	#name : #SIYLevel19,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:16'
}
SIYLevel19 >> arenaExtent [

	^ 15@8
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:16'
}
SIYLevel19 >> backgroundColor [

	^ (Color fromString: '#3d0905') darker
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:25'
}
SIYLevel19 >> buildLevel [
	
	self placeMultipleBlocks: SIYWater from: 9@1 to: 9@8.
	self placeMultipleBlocks: SIYSkull from: 12@1 to: 12@3.
	self placeMultipleBlocks: SIYSkull from: 13@4 to: 15@4.
	self placeBlock: SIYFlag at: 14@2.
	
	self placeBlock: SIYSqueak at: 7@5.
	
	self placeHorizontalRule: SIYFlag is: SIYWin at: 14@1.
	self placeVerticalRule: SIYSqueak is: SIYYou and: SIYFloat at: 5@4.
	self placeHorizontalRule: SIYSqueak is: SIYMelt at: 2@8.
	self placeHorizontalRule: SIYWater is: SIYHot at: 2@1.
	self placeHorizontalRule: SIYSkull is: SIYDefeat and: SIYFloat at: 12@8
	
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/9/2024 00:23'
}
SIYLevel19 >> description [

	^ 'Level 19: Warm River'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:32'
}
SIYLevel19 >> nextLevel [

	^ SIYLevel20
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 23:10'
}
SIYLevel19 >> previousLevel [

	^ SIYLevel18
]
