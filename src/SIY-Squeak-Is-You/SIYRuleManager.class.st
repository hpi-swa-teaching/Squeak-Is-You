Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/6/2023 20:14'
}
SIYRuleManager >> isPush: anObject [
	"work in progress, only returns true if object is SIYRock right now"

	^ (anObject class == SIYRock)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/6/2023 20:14'
}
SIYRuleManager >> isStop: anObject [
	"work in progress, only returns true if object is SIYWall right now"

	^ (anObject class == SIYWall)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/4/2023 18:23'
}
SIYRuleManager >> isYou: anObject [
	"work in progress, only returns true if object is SIYSqueak right now"

	^ (anObject class == SIYSqueak)
]
