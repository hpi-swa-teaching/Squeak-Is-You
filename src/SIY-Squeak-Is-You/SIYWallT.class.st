Class {
	#name : #SIYWallT,
	#superclass : #SIYNoun,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/2/2024 12:54'
}
SIYWallT >> blockTexture [

	^ '/SIYWallT.png'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 12/31/2023 16:14'
}
SIYWallT >> representsBlock [

	^ SIYWall
]
