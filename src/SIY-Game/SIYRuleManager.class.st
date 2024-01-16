"
A SIYRuleManager is an interface for checking and accessing current game rules.

Instance Variables
	currentRules: <Dictionary>
	replacementRules: <Dictionary>


"
Class {
	#name : #SIYRuleManager,
	#superclass : #Object,
	#instVars : [
		'currentRules'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/9/2024 11:39'
}

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:37'
}
SIYRuleManager >> addHorizontalReplacementRulesFor: anIsBlock to: aDictionary [

	| nounBlocks replacementNoun |
	
	nounBlocks := self collectNounsLeftOf: anIsBlock.
	replacementNoun := self collectNounRightOf: anIsBlock.

	(nounBlocks notEmpty and: replacementNoun notNil)
		ifTrue: [nounBlocks
			do: [:aNoun | aDictionary at: aNoun representsBlock
				put: replacementNoun representsBlock]].
		
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:39'
}
SIYRuleManager >> addHorizontalRulesFor: anIsBlock to: aDictionary [

	| nounBlocks propertyBlocks aSet |
	
	nounBlocks := self collectNounsLeftOf: anIsBlock.
	propertyBlocks := self collectPropertiesRightOf: anIsBlock.
	
	"add combinations of nouns and properties to dictionary"
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks do: [:aProperty | 
				aSet := aDictionary at: aProperty class ifAbsent: Set new.
				nounBlocks do: [:aNoun | aSet add: aNoun representsBlock].
				aDictionary at: aProperty class put: aSet]].
	
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:36'
}
SIYRuleManager >> addVerticalReplacementRulesFor: anIsBlock to: aDictionary [

	| nounBlocks replacementNoun |
	
	nounBlocks := self collectNounsAbove: anIsBlock.
	replacementNoun := self collectNounBelow: anIsBlock.

	(nounBlocks notEmpty and: replacementNoun notNil)
		ifTrue: [nounBlocks
			do: [:aNoun | aDictionary at: aNoun representsBlock
				put: replacementNoun representsBlock]].
		
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:39'
}
SIYRuleManager >> addVerticalRulesFor: anIsBlock to: aDictionary [

	| nounBlocks propertyBlocks aSet |
	
	nounBlocks := self collectNounsAbove: anIsBlock.
	propertyBlocks := self collectPropertiesBelow: anIsBlock.
	
	"add combinations of nouns and properties to dictionary"
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks do: [:aProperty |
				aSet := aDictionary at: aProperty class ifAbsent: Set new.
				nounBlocks do: [:aNoun | aSet add: aNoun representsBlock].
				aDictionary at: aProperty class put: aSet]].
	
	^ aDictionary
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/9/2024 10:18'
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
	#'squeak_changestamp' : 'LK 1/16/2024 19:11'
}
SIYRuleManager >> checkRulesFor: aBlock [
	"check all rules for a given block"

	| groundTile floatingTile |

	aBlock arena isGameLocked ifTrue: [^ nil].
	
	groundTile := [aBlock neighborsHere select: [:each | each isFloat not]].
	floatingTile := [aBlock neighborsHere select: [:each | each isFloat]].
	
	{groundTile . floatingTile} 
		do: [:aTile | aTile value
			ifNotEmpty: [self checkWeak: aBlock onTile: aTile value copy.
				self checkDefeat: aBlock onTile: aTile value copy.
				self checkSink: aBlock onTile: aTile value copy.
				self checkOpen: aBlock onTile: aTile value copy.
				self checkMelt: aBlock onTile: aTile value copy.
				self checkWin: aBlock onTile: aTile value copy]]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/9/2024 10:19'
}
SIYRuleManager >> checkSink: aBlock onTile: aTile [
	
	((aTile anySatisfy: [:each | each isSink]) and: aTile size > 1)
			ifTrue: [self invokeSink: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/16/2024 18:19'
}
SIYRuleManager >> checkWeak: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isWeak]) and: (aTile size > 1))
		ifTrue: [self invokeWeak: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/9/2024 10:19'
}
SIYRuleManager >> checkWin: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isYou]) 
		and: (aTile anySatisfy: [:each | each isWin]))
			ifTrue: [self invokeWin: aBlock]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:27'
}
SIYRuleManager >> collectNounBelow: aBlock [
	"recursively collect the first noun below this operator block (if conjoined with SIYAnd)"
	
	aBlock neighborsBelow ifNil: [^ nil].

	(aBlock isKindOf: SIYOperator) 
		ifTrue: [aBlock neighborsBelow do: [:each |
			(each isKindOf: SIYNoun) ifTrue: [^ each].
			(each isKindOf: SIYProperty) ifTrue: [^ self collectNounBelow: each]]].
	
	(aBlock isKindOf: SIYProperty)
		ifTrue: [aBlock neighborsBelow do: [:each |
			(each isKindOf: SIYAnd) ifTrue: [^ self collectNounBelow: each]]].
	
	^ nil

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:34'
}
SIYRuleManager >> collectNounRightOf: aBlock [
	"recursively collect the first noun right of this operator block (if conjoined with SIYAnd)"
	
	aBlock neighborsRight ifNil: [^ nil].

	(aBlock isKindOf: SIYOperator) 
		ifTrue: [aBlock neighborsRight do: [:each |
			(each isKindOf: SIYNoun) ifTrue: [^ each].
			(each isKindOf: SIYProperty) ifTrue: [^ self collectNounRightOf: each]]].
	
	(aBlock isKindOf: SIYProperty)
		ifTrue: [aBlock neighborsRight do: [:each |
			(each isKindOf: SIYAnd) ifTrue: [^ self collectNounRightOf: each]]].
	
	^ nil
		

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:50'
}
SIYRuleManager >> collectNounsAbove: aBlock [
	"recursively collect all nouns above this operator block (if conjoined with SIYAnd)"
	
	| aSet |
	
	aSet := Set new.
	aBlock neighborsAbove ifNil: [^ aSet].

	(aBlock isKindOf: SIYOperator) 
		ifTrue: [aBlock neighborsAbove do: [:each |
			(each isKindOf: SIYNoun) 
				ifTrue: [aSet add: each. 
					aSet addAll: (self collectNounsAbove: each)]]].
	
	(aBlock isKindOf: SIYNoun)
		ifTrue: [aBlock neighborsAbove do: [:each |
			(each isKindOf: SIYAnd) 
				ifTrue: [aSet addAll: (self collectNounsAbove: each)]]].
	
	^ aSet

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:52'
}
SIYRuleManager >> collectNounsLeftOf: aBlock [
	"recursively collect all nouns left of this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	aBlock neighborsLeft ifNil: [^ aSet].

	(aBlock isKindOf: SIYOperator) 
		ifTrue: [aBlock neighborsLeft do: [:each |
			(each isKindOf: SIYNoun) 
				ifTrue: [aSet add: each. 
					aSet addAll: (self collectNounsLeftOf: each)]]].
	
	(aBlock isKindOf: SIYNoun)
		ifTrue: [aBlock neighborsLeft do: [:each |
			(each isKindOf: SIYAnd) 
				ifTrue: [aSet addAll: (self collectNounsLeftOf: each)]]].
	
	^ aSet


]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 23:04'
}
SIYRuleManager >> collectPropertiesBelow: aBlock [
	"recursively collect all properties below this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	aBlock neighborsBelow ifNil: [^ aSet].

	(aBlock isKindOf: SIYOperator) 
		ifTrue: [aBlock neighborsBelow do: [:each |
			(each isKindOf: SIYProperty) 
				ifTrue: [aSet add: each].
			((each isKindOf: SIYProperty) or: (each isKindOf: SIYNoun))
				ifTrue: [aSet addAll: (self collectPropertiesBelow: each)]]].
	
	((aBlock isKindOf: SIYProperty) or: (aBlock isKindOf: SIYNoun))
		ifTrue: [aBlock neighborsBelow do: [:each |
			(each isKindOf: SIYAnd) 
				ifTrue: [aSet addAll: (self collectPropertiesBelow: each)]]].
	
	^ aSet
		
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 23:05'
}
SIYRuleManager >> collectPropertiesRightOf: aBlock [
	"recursively collect all properties right of this operator block (if conjoined with SIYAnd)"

	| aSet |
	
	aSet := Set new.
	aBlock neighborsRight ifNil: [^ aSet].

	(aBlock isKindOf: SIYOperator) 
		ifTrue: [aBlock neighborsRight do: [:each |
			(each isKindOf: SIYProperty) 
				ifTrue: [aSet add: each].
			((each isKindOf: SIYProperty) or: (each isKindOf: SIYNoun))
				ifTrue: [aSet addAll: (self collectPropertiesRightOf: each)]]].
	
	((aBlock isKindOf: SIYProperty) or: (aBlock isKindOf: SIYNoun))
		ifTrue: [aBlock neighborsRight do: [:each |
			(each isKindOf: SIYAnd) 
				ifTrue: [aSet addAll: (self collectPropertiesRightOf: each)]]].
	
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
	#'squeak_changestamp' : 'LK 1/9/2024 10:03'
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
	#'squeak_changestamp' : 'LK 1/9/2024 12:56'
}
SIYRuleManager >> invokeReplacementRules: aDictionary in: anArena [

	aDictionary
		keysAndValuesDo: [:aBlockClass :replacementBlock | 
			self replaceBlocks: aBlockClass with: replacementBlock in: anArena]
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:06'
}
SIYRuleManager >> invokeSink: aTile [
	
	aTile do: [:each | (each isFloat not) ifTrue: [each deleteAndRemember]]

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/16/2024 18:10'
}
SIYRuleManager >> invokeWeak: aTile [

	aTile do: [:each | (each isWeak) ifTrue: [each deleteAndRemember]]
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/7/2024 19:01'
}
SIYRuleManager >> invokeWin: aBlock [
	
	"lock game to prevent player movement while win animation plays"
	aBlock arena lockGame.
	
	"don't switch levels here, SIYWinAnimation will do that if it has finished playing"
	SIYWinAnimation playFor: aBlock
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:16'
}
SIYRuleManager >> isDefeat: aBlock [
	
	^ self isRuleInDictionary: SIYDefeat forBlock: aBlock
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:00'
}
SIYRuleManager >> isFloat: aBlock [

	^ self isRuleInDictionary: SIYFloat forBlock: aBlock
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRuleManager >> isHot: aBlock [

	^ self isRuleInDictionary: SIYHot forBlock: aBlock

	
	
	
	
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRuleManager >> isMelt: aBlock [

	^ self isRuleInDictionary: SIYMelt forBlock: aBlock

	
	
	
	
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRuleManager >> isOpen: aBlock [
	
	^ self isRuleInDictionary: SIYOpen forBlock: aBlock
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:01'
}
SIYRuleManager >> isPush: aBlock [
	
	"text blocks are always isPush"
	(aBlock isKindOf: SIYText) ifTrue: [^ true].
	
	^ self isRuleInDictionary: SIYPush forBlock: aBlock

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/10/2024 22:51'
}
SIYRuleManager >> isRuleInDictionary: aPropertyClass forBlock: aBlock [
	
	"if block is of type text, check for SIYText instead of aBlock class"
	((aBlock isKindOf: SIYText) and: (aBlock class = SIYText) not)
		ifTrue: [^ (self currentRules at: aPropertyClass ifAbsent: [^ false])
			includes: SIYText]
		ifFalse: [^ (self currentRules at: aPropertyClass ifAbsent: [^ false])
			includes: aBlock class]
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRuleManager >> isShut: aBlock [
	
	^ self isRuleInDictionary: SIYShut forBlock: aBlock
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRuleManager >> isSink: aBlock [

	^ self isRuleInDictionary: SIYSink forBlock: aBlock
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/16/2024 18:58'
}
SIYRuleManager >> isStop: aBlock [
	
	"isYou, isPush and isWeak can override this rule"
	(aBlock isYou or: aBlock isPush or: aBlock isWeak) ifTrue: [^ false].
	
	^ self isRuleInDictionary: SIYStop forBlock: aBlock

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/16/2024 18:07'
}
SIYRuleManager >> isWeak: aBlock [
	
	^ self isRuleInDictionary: SIYWeak forBlock: aBlock

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/15/2024 17:14'
}
SIYRuleManager >> isWin: aBlock [
	
	^ self isRuleInDictionary: SIYWin forBlock: aBlock

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:01'
}
SIYRuleManager >> isYou: aBlock [

	^ self isRuleInDictionary: SIYYou forBlock: aBlock

	
	
	
	
	
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/16/2024 11:54'
}
SIYRuleManager >> replaceBlocks: aBlockClass with: anotherBlockClass in: anArena [

	"blocks can't be replaced with textblocks"
	(anotherBlockClass = SIYText) ifTrue: [^ nil "do nothing"].
	
	(aBlockClass = anotherBlockClass)
		ifFalse: [(anArena blockMediator getBlocksOfType: aBlockClass)
			do: [:aBlock | aBlock replaceWithAndRemember: anotherBlockClass]]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 21:21'
}
SIYRuleManager >> updateRulesInArena: anArena [
	"check for rule blocks in arena and update rule dictionary accordingly"

	| ruleDictionary replacementDictionary |
	
	ruleDictionary := Dictionary new.
	replacementDictionary := Dictionary new.
	
	(anArena blockMediator getBlocksOfType: SIYIs)
		do: [:anIsBlock | 
			"collect noun-is-property rules"
			ruleDictionary := self addHorizontalRulesFor: anIsBlock 
				to: ruleDictionary.
			ruleDictionary := self addVerticalRulesFor: anIsBlock
				 to: ruleDictionary.
				
			"collect noun-is-noun rules"
			replacementDictionary := self addHorizontalReplacementRulesFor: anIsBlock 
				to: replacementDictionary.
			replacementDictionary := self addVerticalReplacementRulesFor: anIsBlock
				 to: replacementDictionary].
	
	self invokeReplacementRules: replacementDictionary in: anArena.
	self currentRules: ruleDictionary
]
