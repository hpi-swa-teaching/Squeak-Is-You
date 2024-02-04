"
The SIYAudioPlayer plays sound effects and background music.

Instance Variables
	backgroundMusic:	<RepeatingSound>
	isMuted: <Boolean>

"
Class {
	#name : #SIYAudioPlayer,
	#superclass : #Object,
	#instVars : [
		'isMuted',
		'backgroundMusic'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 19:44'
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
	#'squeak_changestamp' : 'LK 1/31/2024 23:32'
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
	#'squeak_changestamp' : 'LK 2/4/2024 19:03'
}
SIYAudioPlayer >> playMusic [

	self backgroundMusic: ((RepeatingSound repeatForever: self getMusic)
		initialVolume: self volume;
		play;
		yourself)
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
	#'squeak_changestamp' : 'LK 2/4/2024 19:45'
}
SIYAudioPlayer >> playWinSound [
	
	[self getWinSound 
		initialVolume: self volume; 
		reset; 
		play] fork
	
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
	#'squeak_changestamp' : 'KD 2/1/2024 13:35'
}
SIYAudioPlayer >> stopMusic [

	SoundPlayer pauseSound: self backgroundMusic
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
	#category : #configuration,
	#'squeak_changestamp' : 'LK 2/4/2024 18:48'
}
SIYAudioPlayer >> volume [

	^ 0.5
]

{
	#category : #'sound effects',
	#'squeak_changestamp' : 'LK 1/31/2024 14:32'
}
SIYAudioPlayer >> winSound [

	^ 'SIYwinSound.wav'
]
