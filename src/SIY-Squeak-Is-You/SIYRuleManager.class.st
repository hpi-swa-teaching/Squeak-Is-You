Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/4/2023 18:23'
}
SIYRuleManager >> isYou: anObject [
	"work in progress, only returns true if object is SIYSqueak right now"

	^ (anObject class == SIYSqueak)
]
