Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'invoke rules',
	#'squeak_changestamp' : 'LK 12/21/2023 16:24'
}
SIYRuleManager >> invokeDeath: anObject [

	anObject delete.

	
	

]

{
	#category : #'invoke rules',
	#'squeak_changestamp' : 'LK 12/21/2023 16:44'
}
SIYRuleManager >> invokeWin: anObject [
	
	anObject arena game nextLevel
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/21/2023 16:22'
}
SIYRuleManager >> isDefeat: anObject [
	"work in progress, only returns true if object is SIYLava right now"

	^ (anObject class = SIYLava)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/21/2023 16:23'
}
SIYRuleManager >> isPush: anObject [
	"work in progress, only returns true if object is SIYRock right now"

	^ (anObject class = SIYRock)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/21/2023 16:22'
}
SIYRuleManager >> isStop: anObject [
	"work in progress, only returns true if object is SIYWall right now"

	^ (anObject class = SIYWall)
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
	#'squeak_changestamp' : 'LK 12/21/2023 16:23'
}
SIYRuleManager >> isYou: anObject [
	"work in progress, only returns true if object is SIYSqueak right now"

	^ (anObject class = SIYSqueak)
]
