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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/20/2024 15:01'
}
SIYAudioLoader class >> playTheme [

	(RepeatingSound repeatForever: (self new getSound: 'SIYthemeSound.wav')) play
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 1/20/2024 15:02'
}
SIYAudioLoader class >> stopPlayback [

	SoundPlayer stopPlayingAll
]

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

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 1/20/2024 15:00'
}
SIYAudioLoader >> getTexture: aFilename [

	^ self assetLoader loadSound: aFilename
]
