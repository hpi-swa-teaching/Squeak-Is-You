Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'invoke rules',
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 11:57'
}
SIYRuleManager >> invokeDeath: anObject [
	"TODO"
	
	anObject delete.
	Transcript show: 'You have died'.
	Transcript cr.
	
	

]

{
	#category : #'invoke rules',
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 11:57'
}
SIYRuleManager >> invokeWin: anObject [
	"TODO"
	
	Transcript show: 'You have won'.
	Transcript cr.
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 11:43'
}
SIYRuleManager >> isDeath: anObject [
	"work in progress, only returns true if object is SIYLava right now"

	^ (anObject class = SIYLava)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 12:04'
}
SIYRuleManager >> isPush: anObject [
	"work in progress, only returns true if object is SIYRock right now"

	^ (anObject class = SIYSqueak)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/15/2023 20:14'
}
SIYRuleManager >> isStop: anObject [
	"work in progress, only returns true if object is SIYWall right now"

	^ (anObject class == SIYWall)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 11:42'
}
SIYRuleManager >> isWin: anObject [
	"work in progress, only returns true if object is SIYFlag right now"

	^ (anObject class = SIYFlag)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'Karl Duda 12/21/2023 12:04'
}
SIYRuleManager >> isYou: anObject [
	"work in progress, only returns true if object is SIYSqueak right now"

	^ (anObject class == SIYRock)
]
