"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYAudioManager,
	#superclass : #SIYAssetManager,
	#instVars : [
		'moveSound'
	],
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
	#'squeak_changestamp' : 'KD 1/15/2024 15:35'
}
SIYAudioManager >> getSound: aFilename [
	"you need to upload .wav files with 20050 Hz and 16 Bitresolutios"

	^ self assetLoader loadSound: aFilename
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'KD 1/9/2024 21:22'
}
SIYAudioManager >> initialize [ 

	super initialize.
	moveSound :=  self getSound: 'SIYmoveSound.wav'.
	(RepeatingSound repeatForever: (RestSound dur: 1)) play.
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'KD 1/9/2024 14:23'
}
SIYAudioManager >> move [ 

	^moveSound
]
