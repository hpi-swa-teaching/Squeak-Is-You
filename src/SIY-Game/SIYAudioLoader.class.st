"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYAudioLoader,
	#superclass : #SIYAssetLoader,
	#category : #'SIY-Game',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #configuration,
	#'squeak_changestamp' : 'KD 1/20/2024 14:59'
}
SIYAudioLoader >> basePath [

	^  'audio'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 1/20/2024 15:00'
}
SIYAudioLoader >> getSound: aFilename [

	^ self assetLoader loadSound: aFilename
]
