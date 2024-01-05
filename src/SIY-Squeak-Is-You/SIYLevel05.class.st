Class {
	#name : #SIYLevel05,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:48'
}
SIYLevel05 >> arenaExtent [

	^ 24@14
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:57'
}
SIYLevel05 >> buildLevel [
	
	self placeHorizontalRule: SIYFlag is: SIYWin at: 2@1.
	self placeHorizontalRule: SIYSqueak is: SIYYou at: 2@2.
	self placeHorizontalRule: SIYRock is: SIYPush at: 4@6.
	
	self placeBlocks: SIYSkull from: 4@10 to: 4@14.
	self placeBlocks: SIYSkull from: 10@10 to: 10@14.
	self placeBlocks: SIYSkull from: 6@8 to: 6@10.
	self placeBlocks: SIYSkull from: 8@8 to: 8@10.
	self placeBlock: SIYSkull at: 5@10.
	self placeBlock: SIYSkull at: 9@10.
	
	self placeBlocks: SIYRock from: 7@9 to: 7@11.
	self placeBlock: SIYSqueak at: 7@13.
	
	self placeBlocksHollow: SIYSkull from: 14@4 to: 22@12.
	self placeVerticalRule: SIYSkull is: SIYDefeat at: 16@7.
	self placeBlock: SIYFlag at: 19@10
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:03'
}
SIYLevel05 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:47'
}
SIYLevel05 >> previousLevel [

	^ SIYLevel04
]
