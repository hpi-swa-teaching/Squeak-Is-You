"
I am a DemoGame that can be opened with 'DemoGame open'. Delete me and replace me with your own classes.
"
Class {
	#name : #DemoGame,
	#superclass : #Morph,
	#category : 'SWAGroup01-Core',
	#'squeak_changestamp' : 'ek 10/22/2021 12:51'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ek 10/22/2021 12:39'
}
DemoGame class >> open [

	self new openInWorld.
]

{
	#category : #'demo methods',
	#'squeak_changestamp' : 'ek 10/22/2021 12:47'
}
DemoGame >> createGameObject [

	^ DemoGameObject new game: self
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'ek 10/31/2021 23:11'
}
DemoGame >> initialize [

	super initialize.
	self
		color: Color banana;
		extent: 200@800;
		addMorph: self createGameObject.
]
