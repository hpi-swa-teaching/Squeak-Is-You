"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYTextureLoader,
	#superclass : #SIYAssetLoader,
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:51'
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
