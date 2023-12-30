Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#instVars : [
		'currentRules'
	],
	#category : #'SIY-Squeak-Is-You'
}

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
	#'squeak_changestamp' : 'jt 12/30/2023 20:26'
}
SIYRuleManager >> updateRules: anArena [

	"Rules only work for 'is' Operator right now + code is really ugly"
	
	| noun property ruleSet |
	
	currentRules := Dictionary new.
	
	1 to: (anArena arenaWidth) do: [:x |
		1 to: (anArena arenaHeight) do: [:y |
			((anArena mediator requestPos: x@y) anySatisfy: [:each | each isOperatorBlock])
				ifTrue: [
					noun := (anArena mediator requestPos: (x-1)@y) detect: [:each | each isNounBlock] ifNone: [nil].
					property := (anArena mediator requestPos: (x+1)@y) detect: [:each | each isPropertyBlock] ifNone: [nil].
		
					((noun isNil not) and: (property isNil not)) ifTrue: [(currentRules includesKey: property class) 
						ifTrue: [ruleSet := currentRules at: property class. 
							ruleSet add: noun correspondingBlock. 
							currentRules at: property class put: ruleSet]
						ifFalse: [ruleSet := Set new. 
							ruleSet add: noun correspondingBlock. 
							currentRules at: property class put: ruleSet]
					].
				
					noun := (anArena mediator requestPos: x@(y-1)) detect: [:each | each isNounBlock] ifNone: [nil].
					property := (anArena mediator requestPos: x@(y+1)) detect: [:each | each isPropertyBlock] ifNone: [nil].
		
					((noun  isNil not) and: (property  isNil not)) ifTrue: [(currentRules includesKey: property class) 
						ifTrue: [ruleSet := currentRules at: property class. 
							ruleSet add: noun correspondingBlock. 
							currentRules at: property class put: ruleSet]
						ifFalse: [ruleSet := Set new. 
							ruleSet add: noun correspondingBlock. 
							currentRules at: property class put: ruleSet]
					].
					
			]	
		]
	 ].

]
