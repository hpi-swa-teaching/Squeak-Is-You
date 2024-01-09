"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYAudioManager,
	#superclass : #SIYAssetManager,
	#category : #'SIY-Game',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #configuration,
	#'squeak_changestamp' : 'KD 1/9/2024 13:41'
}
SIYAudioManager >> basePath [

	^  'audio'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 1/9/2024 13:42'
}
SIYAudioManager >> getSound: aFilename [
	"you need to upload .wav files with 20050 Hz and 16 Bitresolution"

	^ self assetLoader loadSound: aFilename
]
