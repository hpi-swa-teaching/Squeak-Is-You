Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#instVars : [
		'currentRules'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #'update rules',
	#'squeak_changestamp' : 'LK 1/2/2024 23:25'
}
SIYRuleManager >> addHorizontalRulesFor: anOperatorBlock to: aDictionary [

	| aNounBlock aPropertyBlock aSet |
	anOperatorBlock neighborsLeft isEmptyOrNil
		ifFalse: [aNounBlock := anOperatorBlock neighborsLeft
			detect: [:each | each isKindOf: SIYNoun]
			ifNone: [nil]].
			
	anOperatorBlock neighborsRight isEmptyOrNil 
		ifFalse: [aPropertyBlock := anOperatorBlock neighborsRight
			detect: [:each | each isKindOf: SIYProperty]
			ifNone: [nil]].
	
	(aNounBlock notNil and: aPropertyBlock notNil)
		ifTrue: [aSet := aDictionary at: aPropertyBlock class ifAbsent: Set new.
			aSet add: aNounBlock representsBlock.
			aDictionary at: aPropertyBlock class put: aSet].
	
	^ aDictionary

]

{
	#category : #'update rules',
	#'squeak_changestamp' : 'LK 1/2/2024 23:25'
}
SIYRuleManager >> addVerticalRulesFor: anOperatorBlock to: aDictionary [

	| aNounBlock aPropertyBlock aSet |
	anOperatorBlock neighborsAbove isEmptyOrNil
		ifFalse: [aNounBlock := anOperatorBlock neighborsAbove
			detect: [:each | each isKindOf: SIYNoun]
			ifNone: [nil]].

	anOperatorBlock neighborsBelow isEmptyOrNil		
		ifFalse: [aPropertyBlock := anOperatorBlock neighborsBelow
			detect: [:each | each isKindOf: SIYProperty]
			ifNone: [nil]].
	
	(aNounBlock notNil and: aPropertyBlock notNil)
		ifTrue: [aSet := aDictionary at: aPropertyBlock class ifAbsent: Set new.
			aSet add: aNounBlock representsBlock.
			aDictionary at: aPropertyBlock class put: aSet].
	
	^ aDictionary

]

{
	#category : #'invoke rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:29'
}
SIYRuleManager >> invokeDeath: aBlock [

	aBlock delete

	
	

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
	#'squeak_changestamp' : 'LK 1/2/2024 15:45'
}
SIYRuleManager >> isDefeat: anObject [
	
	^ (currentRules at: SIYDefeat ifAbsent: [^ false]) includes: anObject class
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 1/2/2024 15:45'
}
SIYRuleManager >> isPush: anObject [
	
	(anObject isKindOf: SIYText) ifTrue: [^ true].
	
	^ (currentRules at: SIYPush ifAbsent: [^ false]) includes: anObject class

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 1/2/2024 15:45'
}
SIYRuleManager >> isStop: anObject [
	
	^ (currentRules at: SIYStop ifAbsent: [^ false]) includes: anObject class

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 1/2/2024 15:45'
}
SIYRuleManager >> isWin: anObject [
	
	^ (currentRules at: SIYWin ifAbsent: [^ false]) includes: anObject class

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 1/2/2024 15:46'
}
SIYRuleManager >> isYou: anObject [

	^ (currentRules at: SIYYou ifAbsent: [^ false]) includes: anObject class

	
	
	
	
	
]

{
	#category : #'update rules',
	#'squeak_changestamp' : 'LK 1/2/2024 23:25'
}
SIYRuleManager >> updateRulesInArena: anArena [

	| aDictionary |
	
	aDictionary := Dictionary new.
	
	(anArena mediator getOperatorBlocks) do: [:aBlock |
			aDictionary := self addHorizontalRulesFor: aBlock to: aDictionary.
			aDictionary := self addVerticalRulesFor: aBlock to: aDictionary.
		].
	
	currentRules := aDictionary.
]
