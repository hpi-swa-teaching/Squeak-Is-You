Class {
	#name : #SIYLevel09,
	#superclass : #SIYLevelFactory,
	#category : #'SIY-Levels'
}

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:49'
}
SIYLevel09 >> arenaExtent [

	^ 28@16
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:58'
}
SIYLevel09 >> backgroundColor [

	^ Color fromString: '#0C1020'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 23:02'
}
SIYLevel09 >> buildLevel [
	
	
	
	
	
	
	

]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:50'
}
SIYLevel09 >> description [

	^ 'Level 9: Icy Waters'
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 00:03'
}
SIYLevel09 >> nextLevel [

	^ SIYLevel00
]

{
	#category : #'level design',
	#'squeak_changestamp' : 'LK 1/5/2024 22:50'
}
SIYLevel09 >> previousLevel [

	^ SIYLevel08
]
