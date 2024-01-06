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
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:39'
}

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/6/2024 11:05'
}
SIYRuleManager >> addHorizontalRulesFor: anOperatorBlock to: aDictionary [

	| nounBlocks propertyBlocks aSet |
	
	nounBlocks := self collectNounsLeftOf: anOperatorBlock.
	propertyBlocks := self collectPropertiesRightOf: anOperatorBlock.
	
	"add combinations of nouns and properties to dictionary"
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks
			do: [:aProperty | aSet := aDictionary at: aProperty class ifAbsent: Set new.
				nounBlocks do: [:aNoun | aSet add: aNoun representsBlock].
				aDictionary at: aProperty class put: aSet]].
	
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/6/2024 11:27'
}
SIYRuleManager >> addVerticalRulesFor: anOperatorBlock to: aDictionary [

	| nounBlocks propertyBlocks aSet |
	
	nounBlocks := self collectNounsAbove: anOperatorBlock.
	propertyBlocks := self collectPropertiesBelow: anOperatorBlock.
	
	"add combinations of nouns and properties to dictionary"
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks
			do: [:aProperty | aSet := aDictionary at: aProperty class ifAbsent: Set new.
				nounBlocks do: [:aNoun | aSet add: aNoun representsBlock].
				aDictionary at: aProperty class put: aSet]].
	
	^ aDictionary
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/6/2024 21:24'
}
SIYRuleManager >> checkDefeat: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isYou]) 
		and: (aTile anySatisfy: [:each | each isDefeat]))
			ifTrue: [self invokeDefeat: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/5/2024 14:26'
}
SIYRuleManager >> checkMelt: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isMelt]) and: (aTile anySatisfy: [:each | each isHot]))
		ifTrue: [self invokeMelt: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/6/2024 21:15'
}
SIYRuleManager >> checkOpen: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isOpen])
		and: (aTile anySatisfy: [:each | each isShut]))
			ifTrue: [self invokeOpen: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/5/2024 14:53'
}
SIYRuleManager >> checkRulesFor: aBlock [
	"check all rules for a given block"

	| aTile |
	
	aTile := aBlock neighborsHere.
	
	self checkWin: aBlock onTile: aTile copy.
	self checkDefeat: aBlock onTile: aTile copy.
	self checkSink: aBlock onTile: aTile copy.
	self checkOpen: aBlock onTile: aTile copy.
	self checkMelt: aBlock onTile: aTile copy
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
	#'squeak_changestamp' : 'LK 1/6/2024 18:15'
}
SIYRuleManager >> checkWin: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isYou]) and: (aTile anySatisfy: [:each | each isWin]))
		ifTrue: [self invokeWin: aBlock]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/6/2024 11:48'
}
SIYRuleManager >> collectNounsAbove: anOperatorBlock [
	"recursively collect all nouns above this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	
	anOperatorBlock neighborsAbove ifNotNil: [anOperatorBlock neighborsAbove
		do: [:aNoun | (aNoun isKindOf: SIYNoun) ifTrue: [aSet add: aNoun. 
			aNoun neighborsAbove ifNotNil: [aNoun neighborsAbove 
				do: [:anAnd | (anAnd isKindOf: SIYAnd)
					ifTrue: [aSet addAll: (self collectNounsAbove: anAnd)]]]]]].
	
	^ aSet
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/6/2024 11:48'
}
SIYRuleManager >> collectNounsLeftOf: anOperatorBlock [
	"recursively collect all nouns left of this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	
	anOperatorBlock neighborsLeft ifNotNil: [anOperatorBlock neighborsLeft
		do: [:aNoun | (aNoun isKindOf: SIYNoun) ifTrue: [aSet add: aNoun. 
			aNoun neighborsLeft ifNotNil: [aNoun neighborsLeft
				do: [:anAnd | (anAnd isKindOf: SIYAnd)
					ifTrue: [aSet addAll: (self collectNounsLeftOf: anAnd)]]]]]].
	
	^ aSet


]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/6/2024 11:47'
}
SIYRuleManager >> collectPropertiesBelow: anOperatorBlock [
	"recursively collect all properties below this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	
	anOperatorBlock neighborsBelow ifNotNil: [anOperatorBlock neighborsBelow
		do: [:aProperty | (aProperty isKindOf: SIYProperty) ifTrue: [aSet add: aProperty.
			aProperty neighborsBelow ifNotNil: [aProperty neighborsBelow 
				do: [:anAnd | (anAnd isKindOf: SIYAnd)
					ifTrue: [aSet addAll: (self collectPropertiesBelow: anAnd)]]]]]].
	
	^ aSet
		
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/6/2024 11:48'
}
SIYRuleManager >> collectPropertiesRightOf: anOperatorBlock [
	"recursively collect all properties right of this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	
	anOperatorBlock neighborsRight ifNotNil: [anOperatorBlock neighborsRight
		do: [:aProperty | (aProperty isKindOf: SIYProperty) ifTrue: [aSet add: aProperty. 
			aProperty neighborsRight ifNotNil: [aProperty neighborsRight
				do: [:anAnd | (anAnd isKindOf: SIYAnd)
					ifTrue: [aSet addAll: (self collectPropertiesRightOf: anAnd)]]]]]].
	
	^ aSet
		

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
	#'squeak_changestamp' : 'LK 1/6/2024 21:22'
}
SIYRuleManager >> invokeDefeat: aTile [

	aTile do: [:each | (each isYou) ifTrue: [each deleteAndRemember]]

	
	

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/5/2024 14:20'
}
SIYRuleManager >> invokeMelt: aTile [

	aTile do: [:each | (each isMelt) ifTrue: [each deleteAndRemember]]
	
	

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
	#'squeak_changestamp' : 'LK 1/6/2024 19:27'
}
SIYRuleManager >> invokeWin: aBlock [
	
	aBlock arena game nextLevel.

	"delete block, to prevent it from invoking win multiple times"
	aBlock delete.
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
	#'squeak_changestamp' : 'LK 1/5/2024 14:18'
}
SIYRuleManager >> isHot: aBlock [

	^ (currentRules at: SIYHot ifAbsent: [^ false]) includes: aBlock class

	
	
	
	
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/5/2024 14:18'
}
SIYRuleManager >> isMelt: aBlock [

	^ (currentRules at: SIYMelt ifAbsent: [^ false]) includes: aBlock class

	
	
	
	
	
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
	#'squeak_changestamp' : 'LK 1/6/2024 11:13'
}
SIYRuleManager >> updateRulesInArena: anArena [
	"check for rule blocks in arena and update rule dictionary accordingly"

	| aDictionary |
	
	aDictionary := Dictionary new.
	
	(anArena blockMediator getIsBlocks)
		do: [:anIsBlock | aDictionary := self addHorizontalRulesFor: anIsBlock to: aDictionary.
			aDictionary := self addVerticalRulesFor: anIsBlock to: aDictionary].
	
	self currentRules: aDictionary
]
