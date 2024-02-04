"
A SIYAudioLoader is a subclass of the SIYAssetLoader used only to load sounds.

"
Class {
	#name : #SIYAudioLoader,
	#superclass : #SIYAssetLoader,
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 19:43'
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
