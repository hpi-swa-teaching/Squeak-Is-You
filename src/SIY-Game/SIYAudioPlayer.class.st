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
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 21:08'
}
SIYAudioPlayer >> isMuted [

	^ isMuted ifNil: [isMuted := self isMutedOnStart]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 21:09'
}
SIYAudioPlayer >> isMuted: aBoolean [

	isMuted := aBoolean
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/31/2024 21:28'
}
SIYAudioPlayer >> isMutedOnStart [

	^ true
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
	#'squeak_changestamp' : 'LK 1/31/2024 21:10'
}
SIYAudioPlayer >> playMusic [

	self backgroundMusic: (RepeatingSound repeatForever: self getMusic) play;
		yourself
]

{
	#category : #music,
	#'squeak_changestamp' : 'LK 1/31/2024 21:08'
}
SIYAudioPlayer >> playMusicIfNotMuted [

	self isMuted 
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
	#'squeak_changestamp' : 'LK 1/31/2024 21:08'
}
SIYAudioPlayer >> playWinSoundIfNotMuted [
	
	self isMuted
		ifFalse: [self playWinSound]
	
]

{
	#category : #music,
	#'squeak_changestamp' : 'KD 1/31/2024 16:07'
}
SIYAudioPlayer >> stopMusic [

	SoundPlayer resumePlaying: self backgroundMusic quickStart: false 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/31/2024 21:09'
}
SIYAudioPlayer >> toggleMute [

	self isMuted: self isMuted not.
	
	self isMuted 
		ifTrue: [self stopMusic]
		ifFalse: [self playMusic].
]

{
	#category : #'sound effects',
	#'squeak_changestamp' : 'LK 1/31/2024 14:32'
}
SIYAudioPlayer >> winSound [

	^ 'SIYwinSound.wav'
]
