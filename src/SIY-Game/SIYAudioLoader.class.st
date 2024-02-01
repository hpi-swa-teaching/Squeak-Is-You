"
A SIYAudioLoader is a subclass of the SIYAssetLoader for only sounds.

Instance Variables

"
Class {
	#name : #SIYAudioLoader,
	#superclass : #SIYAssetLoader,
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'KD 2/1/2024 13:54'
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
