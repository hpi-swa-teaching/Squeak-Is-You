"
A SIYTextureLoader is a subclass of the SIYAssetLoader used only to load textures.

"
Class {
	#name : #SIYTextureLoader,
	#superclass : #SIYAssetLoader,
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 19:43'
}

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureLoader >> basePath [

	^  'textures'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureLoader >> getTexture: aFilename [

	^ self assetLoader loadForm: aFilename
]
