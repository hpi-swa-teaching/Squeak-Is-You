"
A SIYRuleManager is an interface for checking and accessing current game rules.

Instance Variables
	currentRules: <Dictionary>


"
Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#instVars : [
		'currentRules'
	],
	#category : #'SIY-Squeak-Is-You',
	#'squeak_changestamp' : 'LK 1/4/2024 15:39'
}

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/4/2024 15:48'
}
SIYRuleManager >> addHorizontalRulesFor: anOperatorBlock to: aDictionary [

	| aNounBlock aPropertyBlock aSet |
	
	"set aNounBlock to the noun left for the given anOperatorBlock"
	anOperatorBlock neighborsLeft isEmptyOrNil
		ifFalse: [aNounBlock := anOperatorBlock neighborsLeft
			detect: [:each | each isKindOf: SIYNoun]
			ifNone: [nil]].
	
	"set aPropertyBlock to the property right for the given anOperatorBlock"
	anOperatorBlock neighborsRight isEmptyOrNil 
		ifFalse: [aPropertyBlock := anOperatorBlock neighborsRight
			detect: [:each | each isKindOf: SIYProperty]
			ifNone: [nil]].
	
	"if there is a valid noun and property block detected, add them to the rule dictionary"
	(aNounBlock notNil and: aPropertyBlock notNil)
		ifTrue: [aSet := aDictionary at: aPropertyBlock class ifAbsent: Set new.
			aSet add: aNounBlock representsBlock.
			aDictionary at: aPropertyBlock class put: aSet].
	
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/4/2024 15:48'
}
SIYRuleManager >> addVerticalRulesFor: anOperatorBlock to: aDictionary [

	| aNounBlock aPropertyBlock aSet |
	
	"set aNounBlock to the noun above for the given anOperatorBlock"
	anOperatorBlock neighborsAbove isEmptyOrNil
		ifFalse: [aNounBlock := anOperatorBlock neighborsAbove
			detect: [:each | each isKindOf: SIYNoun]
			ifNone: [nil]].
	
	"set aPropertyBlock to the property below for the given anOperatorBlock"
	anOperatorBlock neighborsBelow isEmptyOrNil		
		ifFalse: [aPropertyBlock := anOperatorBlock neighborsBelow
			detect: [:each | each isKindOf: SIYProperty]
			ifNone: [nil]].
	
	"if there is a valid noun and property block detected, add them to the rule dictionary"
	(aNounBlock notNil and: aPropertyBlock notNil)
		ifTrue: [aSet := aDictionary at: aPropertyBlock class ifAbsent: Set new.
			aSet add: aNounBlock representsBlock.
			aDictionary at: aPropertyBlock class put: aSet].
	
	^ aDictionary

]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/5/2024 00:59'
}
SIYRuleManager >> checkDefeat: aBlock onTile: aTile [

	(aBlock isYou and: (aTile anySatisfy: [:each | each isDefeat and: each isYou not]))
		ifTrue: [self invokeDeath: aBlock]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/4/2024 19:14'
}
SIYRuleManager >> checkOpen: aBlock onTile: aTile [

	(aBlock isOpen and: (aTile anySatisfy: [:each | each isShut]))
		ifTrue: [self invokeOpen: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/4/2024 19:12'
}
SIYRuleManager >> checkRulesFor: aBlock [
	"check all rules for a given block"

	| aTile |
	
	aTile := aBlock neighborsHere copy.
	
	self checkWin: aBlock onTile: aTile.
	self checkDefeat: aBlock onTile: aTile.
	self checkSink: aBlock onTile: aTile.
	self checkOpen: aBlock onTile: aTile
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/5/2024 01:26'
}
SIYRuleManager >> checkSink: aBlock onTile: aTile [
	
	((aTile anySatisfy: [:each | each isSink]) and: (aTile size > 1))
		ifTrue: [self invokeSink: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/3/2024 20:01'
}
SIYRuleManager >> checkWin: aBlock onTile: aTile [

	(aBlock isYou and: (aTile anySatisfy: [:each | each isWin]))
		ifTrue: [self invokeWin: aBlock]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/3/2024 23:00'
}
SIYRuleManager >> currentRules [

	^ currentRules ifNil: [currentRules := Dictionary new]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/3/2024 22:59'
}
SIYRuleManager >> currentRules: aDictionary [

	currentRules := aDictionary
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 12/31/2023 16:29'
}
SIYRuleManager >> invokeDeath: aBlock [

	aBlock delete

	
	

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/5/2024 12:29'
}
SIYRuleManager >> invokeOpen: aTile [

	aTile do: [:each | (each isShut or: each isOpen) ifTrue: [each deleteAndRemember]]
	
	

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/5/2024 12:29'
}
SIYRuleManager >> invokeSink: aTile [
	
	aTile do: [:each | each deleteAndRemember]

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/3/2024 20:08'
}
SIYRuleManager >> invokeWin: aBlock [
	
	aBlock arena game nextLevel
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 23:04'
}
SIYRuleManager >> isDefeat: aBlock [
	
	^ (currentRules at: SIYDefeat ifAbsent: [^ false]) includes: aBlock class
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'KD 1/4/2024 17:36'
}
SIYRuleManager >> isOpen: aBlock [
	
	^ (currentRules at: SIYOpen ifAbsent: [^ false]) includes: aBlock class
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 23:04'
}
SIYRuleManager >> isPush: aBlock [
	
	(aBlock isKindOf: SIYText) ifTrue: [^ true].
	
	^ (currentRules at: SIYPush ifAbsent: [^ false]) includes: aBlock class

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'KD 1/4/2024 17:03'
}
SIYRuleManager >> isShut: aBlock [
	
	^ (currentRules at: SIYShut ifAbsent: [^ false]) includes: aBlock class
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'KD 1/4/2024 16:30'
}
SIYRuleManager >> isSink: aBlock [
	
	^ (currentRules at: SIYSink ifAbsent: [^ false]) includes: aBlock class
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 23:04'
}
SIYRuleManager >> isStop: aBlock [
	
	^ (currentRules at: SIYStop ifAbsent: [^ false]) includes: aBlock class

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 23:04'
}
SIYRuleManager >> isWin: aBlock [
	
	^ (currentRules at: SIYWin ifAbsent: [^ false]) includes: aBlock class

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/3/2024 23:04'
}
SIYRuleManager >> isYou: aBlock [

	^ (currentRules at: SIYYou ifAbsent: [^ false]) includes: aBlock class

	
	
	
	
	
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/4/2024 15:49'
}
SIYRuleManager >> updateRulesInArena: anArena [
	"check for rule blocks in arena and update rule dictionary accordingly"

	| aDictionary |
	
	aDictionary := Dictionary new.
	
	(anArena blockMediator getOperatorBlocks)
		do: [:aBlock | aDictionary := self addHorizontalRulesFor: aBlock to: aDictionary.
			aDictionary := self addVerticalRulesFor: aBlock to: aDictionary].
	
	self currentRules: aDictionary
]
