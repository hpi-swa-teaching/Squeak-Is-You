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
	#'squeak_changestamp' : 'LK 12/31/2023 16:24'
}
SIYRuleManager >> addHorizontalRulesFor: anOperatorBlock toDictionary: aDictionary [

	| aNounBlock aPropertyBlock aSet |

	aNounBlock := anOperatorBlock neighborsLeft
		detect: [:each | each isKindOf: SIYNoun]
		ifNone: [nil].
		
	aPropertyBlock := anOperatorBlock neighborsRight
		detect: [:each | each isKindOf: SIYProperty]
		ifNone: [nil].
	
	(aNounBlock notNil and: aPropertyBlock notNil)
		ifTrue: [aSet := aDictionary at: aPropertyBlock class ifAbsent: Set new.
			aSet add: aNounBlock representsBlock.
			aDictionary at: aPropertyBlock class put: aSet.].
	
	^ aDictionary

]

{
	#category : #'update rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:25'
}
SIYRuleManager >> addVerticalRulesFor: anOperatorBlock toDictionary: aDictionary [

	| aNounBlock aPropertyBlock aSet |

	aNounBlock := anOperatorBlock neighborsAbove
		detect: [:each | each isKindOf: SIYNoun]
		ifNone: [nil].
		
	aPropertyBlock := anOperatorBlock neighborsBelow
		detect: [:each | each isKindOf: SIYProperty]
		ifNone: [nil].
	
	(aNounBlock notNil and: aPropertyBlock notNil)
		ifTrue: [aSet := aDictionary at: aPropertyBlock class ifAbsent: Set new.
			aSet add: aNounBlock representsBlock.
			aDictionary at: aPropertyBlock class put: aSet.].
	
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
	#'squeak_changestamp' : 'LK 12/31/2023 16:31'
}
SIYRuleManager >> isDefeat: anObject [
	
	^ (currentRules at: SIYDefeatT ifAbsent: [^ false]) includes: anObject class
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:32'
}
SIYRuleManager >> isPush: anObject [
	
	(anObject isKindOf: SIYText) ifTrue: [^ true].
	
	^ (currentRules at: SIYPushT ifAbsent: [^ false]) includes: anObject class

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:58'
}
SIYRuleManager >> isStop: anObject [
	
	^ (currentRules at: SIYStopT ifAbsent: [^ false]) includes: anObject class

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:58'
}
SIYRuleManager >> isWin: anObject [
	
	^ (currentRules at: SIYWinT ifAbsent: [^ false]) includes: anObject class

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:59'
}
SIYRuleManager >> isYou: anObject [

	^ (currentRules at: SIYYouT ifAbsent: [^ false]) includes: anObject class

	
	
	
	
	
]

{
	#category : #'update rules',
	#'squeak_changestamp' : 'LK 12/31/2023 16:26'
}
SIYRuleManager >> updateRulesInArena: anArena [

	| ruleDictionary |
	
	ruleDictionary := Dictionary new.
	
	(anArena mediator getOperatorBlocks) do: [:anOperatorBlock |
			ruleDictionary := self addHorizontalRulesFor: anOperatorBlock toDictionary: ruleDictionary.
			ruleDictionary := self addVerticalRulesFor: anOperatorBlock toDictionary: ruleDictionary.
		].
	
	currentRules := ruleDictionary.
]
