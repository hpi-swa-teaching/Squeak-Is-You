Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/6/2023 22:24'
}
SIYRuleManager >> isPush: anObject [
	"work in progress, only returns true if object is SIYRock right now"

	^ (anObject class == SIYRock)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/6/2023 22:23'
}
SIYRuleManager >> isStop: anObject [
	"work in progress, only returns true if object is SIYWall right now"

	^ (anObject class == nil)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/6/2023 22:23'
}
SIYRuleManager >> isYou: anObject [
	"work in progress, only returns true if object is SIYSqueak right now"

	^ (anObject class == SIYSqueak)
]
