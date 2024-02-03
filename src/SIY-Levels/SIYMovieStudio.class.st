Class {
	#name : #SIYMovieStudio,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 2/2/2024 16:11'
}
SIYMovieStudio >> arenaExtent [

	^ 9@6
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 2/2/2024 16:11'
}
SIYMovieStudio >> buildLevel [

	self placeHorizontalRule: SIYSqueak is: SIYYou at: 5@3.
	
	self placeBlock: SIYSqueak at: 5@5.

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 2/2/2024 12:10'
}
SIYMovieStudio >> description [

	^ 'Movie Studio'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 2/2/2024 12:10'
}
SIYMovieStudio >> nextLevel [

	^ SIYIntro01
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/9/2024 15:13'
}
SIYMovieStudio >> previousLevel [

	^ SIYPlayground
]
