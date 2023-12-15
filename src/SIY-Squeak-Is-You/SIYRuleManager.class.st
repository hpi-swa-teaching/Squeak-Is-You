Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/15/2023 19:09'
}
SIYRuleManager >> isPush: anObject [
	"work in progress, only returns true if object is SIYRock right now"

	^ (anObject class = SIYRock)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/7/2023 18:48'
}
SIYRuleManager >> isStop: anObject [
	"work in progress, only returns true if object is SIYWall right now"

	^ (anObject class == SIYWall)
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/8/2023 11:08'
}
SIYRuleManager >> isYou: anObject [
	"work in progress, only returns true if object is SIYSqueak right now"

	^ (anObject class == SIYSqueak)
]
