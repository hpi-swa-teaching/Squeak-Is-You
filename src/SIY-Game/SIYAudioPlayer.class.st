Class {
	#name : #SIYAudioPlayer,
	#superclass : #Object,
	#instVars : [
		'isMuted',
		'backgroundMusic'
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
	#'squeak_changestamp' : 'LK 1/31/2024 14:42'
}
SIYAudioPlayer >> backgroundMusic [

	^ backgroundMusic
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:42'
}
SIYAudioPlayer >> backgroundMusic: aSound [

	backgroundMusic := aSound
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:08'
}
SIYAudioPlayer >> getMusic [

	^ SIYAudioLoader new getSound: self mainTheme
]

{
	#category : #'sound effects',
	#'squeak_changestamp' : 'LK 1/31/2024 14:33'
}
SIYAudioPlayer >> getWinSound [

	^ SIYAudioLoader new getSound: self winSound
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/31/2024 14:12'
}
SIYAudioPlayer >> isMutedOnStart [

	^ false
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
	#'squeak_changestamp' : 'LK 1/31/2024 14:55'
}
SIYAudioPlayer >> pauseMusic [

	SoundPlayer pauseSound: self backgroundMusic
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:50'
}
SIYAudioPlayer >> playMusic [
	
	self backgroundMusic 
		ifNil: [self startMusic]
		ifNotNil: [self resumeMusic].
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
	#category : #'sound effects',
	#'squeak_changestamp' : 'LK 1/31/2024 14:37'
}
SIYAudioPlayer >> playWinSound [
	
	[self getWinSound reset; play] fork
	
]

{
	#category : #'sound effects',
	#'squeak_changestamp' : 'LK 1/31/2024 14:37'
}
SIYAudioPlayer >> playWinSoundIfNotMuted [
	
	self audioMuted
		ifFalse: [self playWinSound]
	
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:45'
}
SIYAudioPlayer >> resumeMusic [

	SoundPlayer resumePlaying: self backgroundMusic
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 14:44'
}
SIYAudioPlayer >> startMusic [

	self backgroundMusic: (RepeatingSound repeatForever: self getMusic) play;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LK 1/31/2024 14:04'
}
SIYAudioPlayer >> toggleMute [

	
]

{
	#category : #'sound effects',
	#'squeak_changestamp' : 'LK 1/31/2024 14:32'
}
SIYAudioPlayer >> winSound [

	^ 'SIYwinSound.wav'
]
