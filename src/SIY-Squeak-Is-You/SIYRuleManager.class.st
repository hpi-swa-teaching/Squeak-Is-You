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
	#'squeak_changestamp' : 'LK 12/21/2023 18:23'
}
SIYRuleManager >> invokeDeath: aBlock [

	aBlock delete.

	
	

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
	#'squeak_changestamp' : 'jt 12/30/2023 20:27'
}
SIYRuleManager >> isDefeat: anObject [
		
	| ruleSet |
	
	(currentRules includesKey: SIYDefeatT)
	ifTrue: [ruleSet := currentRules at: SIYDefeatT. ^ (ruleSet includes: anObject class)]
	ifFalse: [^ false].
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'jt 12/30/2023 20:30'
}
SIYRuleManager >> isPush: anObject [
	
	| ruleSet |
	
	(anObject isKindOf: SIYText) 
	ifTrue: [^ true].
	
	(currentRules includesKey: SIYPushT)
	ifTrue: [ruleSet := currentRules at: SIYPushT. ^ (ruleSet includes: anObject class)]
	ifFalse: [^ false].

]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'jt 12/30/2023 20:27'
}
SIYRuleManager >> isStop: anObject [
	
	| ruleSet |
	
	(currentRules includesKey: SIYStopT)
	ifTrue: [ruleSet := currentRules at: SIYStopT. ^ (ruleSet includes: anObject class)]
	ifFalse: [^ false].
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'jt 12/30/2023 20:27'
}
SIYRuleManager >> isWin: anObject [
	
	| ruleSet |
	
	(currentRules includesKey: SIYWinT)
	ifTrue: [ruleSet := currentRules at: SIYWinT. ^ (ruleSet includes: anObject class)]
	ifFalse: [^ false].
]

{
	#category : #'check rules',
	#'squeak_changestamp' : 'jt 12/30/2023 20:27'
}
SIYRuleManager >> isYou: anObject [

	| ruleSet |
	
	(currentRules includesKey: SIYYouT)
	ifTrue: [ruleSet := currentRules at: SIYYouT. ^ (ruleSet includes: anObject class)]
	ifFalse: [^ false].
	
	
	
	
	
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
