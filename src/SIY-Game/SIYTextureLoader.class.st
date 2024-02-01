"
A SIYTextureLoader is a subclass of the SIYAssetLoader for only textures.

Instance Variables

"
Class {
	#name : #SIYTextureLoader,
	#superclass : #SIYAssetLoader,
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'KD 2/1/2024 13:54'
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
