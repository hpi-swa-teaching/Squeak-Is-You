Class {
	#name : #SIYAudioPlayer,
	#superclass : #Object,
	#instVars : [
		'isMuted'
	],
	#category : #'SIY-Game'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/31/2024 14:05'
}
SIYAudioPlayer >> audioMuted [

	^ isMuted ifNil: [isMuted := self isMutedOnStart]
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:08'
}
SIYAudioPlayer >> getMusic [

	^ SIYAudioLoader new getSound: self mainTheme
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/31/2024 14:12'
}
SIYAudioPlayer >> isMutedOnStart [

	^ false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/31/2024 14:13'
}
SIYAudioPlayer >> killSound [

	SoundPlayer stopPlayingAll
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:08'
}
SIYAudioPlayer >> mainTheme [

	^ 'SIYthemeSound.wav'
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:08'
}
SIYAudioPlayer >> playMusic [

	(RepeatingSound repeatForever: self getMusic) play
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:11'
}
SIYAudioPlayer >> playMusicIfNotMuted [

	self audioMuted 
		ifFalse: [self playMusic]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/31/2024 14:04'
}
SIYAudioPlayer >> toggleMute [

	
]
