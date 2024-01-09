"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYTextureManager,
	#superclass : #SIYAssetManager,
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:51'
}

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureManager >> basePath [

	^  'textures'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureManager >> getTexture: aFilename [

	^ self assetLoader loadForm: aFilename
]
