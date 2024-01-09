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
	#'squeak_changestamp' : 'LK 1/9/2024 09:25'
}
SIYRuleManager >> addHorizontalRulesFor: anIsBlock to: aDictionary [

	| nounBlocks propertyBlocks replacementNoun aSet |
	
	nounBlocks := self collectNounsLeftOf: anIsBlock.
	propertyBlocks := self collectPropertiesRightOf: anIsBlock.
	replacementNoun := self collectNounRightOf: anIsBlock.
	
	"add combinations of nouns and properties to dictionary"
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks
			do: [:aProperty | aSet := aDictionary at: aProperty class ifAbsent: Set new.
				nounBlocks do: [:aNoun | aSet add: aNoun representsBlock].
				aDictionary at: aProperty class put: aSet]].
	
	"check for any horizontal replacement rules"
	(nounBlocks notEmpty and: replacementNoun notNil)
		ifTrue: [nounBlocks
			do: [:aNoun | self
				replaceBlocks: aNoun representsBlock
				with: replacementNoun representsBlock
				in: aNoun arena]].
	
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/9/2024 09:25'
}
SIYRuleManager >> addVerticalRulesFor: anIsBlock to: aDictionary [

	| nounBlocks propertyBlocks replacementNoun aSet |
	
	nounBlocks := self collectNounsAbove: anIsBlock.
	propertyBlocks := self collectPropertiesBelow: anIsBlock.
	replacementNoun := self collectNounBelow: anIsBlock.
	
	"add combinations of nouns and properties to dictionary"
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks
			do: [:aProperty | aSet := aDictionary at: aProperty class ifAbsent: Set new.
				nounBlocks do: [:aNoun | aSet add: aNoun representsBlock].
				aDictionary at: aProperty class put: aSet]].
	
	"check for any vertical replacement rules"
	(nounBlocks notEmpty and: replacementNoun notNil)
		ifTrue: [nounBlocks
			do: [:aNoun | self
				replaceBlocks: aNoun representsBlock
				with: replacementNoun representsBlock
				in: aNoun arena]].
	
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
	#'squeak_changestamp' : 'LK 1/9/2024 10:19'
}
SIYRuleManager >> checkRulesFor: aBlock [
	"check all rules for a given block"

	| groundTile floatingTile |
	
	"don't check rules if game is locked"
	aBlock arena isGameLocked ifTrue: [^ nil].
	
	"all rules need to be checked twice: for blocks that are float and 
	for blocks that are not float"
	groundTile := aBlock neighborsHere select: [:each | each isFloat not].
	floatingTile := aBlock neighborsHere select: [:each | each isFloat].
	
	{groundTile . floatingTile} 
		do: [:aTile | aTile 
			ifNotEmpty: [self checkWin: aBlock onTile: aTile copy.
				self checkDefeat: aBlock onTile: aTile copy.
				self checkSink: aBlock onTile: aTile copy.
				self checkOpen: aBlock onTile: aTile copy.
				self checkMelt: aBlock onTile: aTile copy]]
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
	#'squeak_changestamp' : 'LK 1/9/2024 10:19'
}
SIYRuleManager >> checkWin: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isYou]) 
		and: (aTile anySatisfy: [:each | each isWin]))
			ifTrue: [self invokeWin: aBlock]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/8/2024 23:56'
}
SIYRuleManager >> collectNounBelow: anOperatorBlock [
	"recursively collect the first noun below this operator block (if conjoined with SIYAnd)"
	
	anOperatorBlock neighborsBelow ifNotNil: [anOperatorBlock neighborsBelow
		do: [:aTextBlock | (aTextBlock isKindOf: SIYNoun) ifTrue: [^ aTextBlock].
			(aTextBlock isKindOf: SIYProperty) ifTrue: [aTextBlock neighborsBelow
				ifNotNil: [aTextBlock neighborsBelow do: [:anAnd | (anAnd isKindOf: SIYAnd)
					ifTrue: [^ self collectNounBelow: anAnd]]]]]].
	
	"return nil, if no noun was found"
	^ nil
		

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/8/2024 23:56'
}
SIYRuleManager >> collectNounRightOf: anOperatorBlock [
	"recursively collect the first noun right of this operator block (if conjoined with SIYAnd)"
	
	anOperatorBlock neighborsRight ifNotNil: [anOperatorBlock neighborsRight
		do: [:aTextBlock | (aTextBlock isKindOf: SIYNoun) ifTrue: [^ aTextBlock].
			(aTextBlock isKindOf: SIYProperty) ifTrue: [aTextBlock neighborsRight
				ifNotNil: [aTextBlock neighborsRight do: [:anAnd | (anAnd isKindOf: SIYAnd)
					ifTrue: [^ self collectNounRightOf: anAnd]]]]]].
	
	"return nil, if no noun was found"
	^ nil
		

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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:06'
}
SIYRuleManager >> invokeSink: aTile [
	
	aTile do: [:each | (each isFloat not) ifTrue: [each deleteAndRemember]]

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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:00'
}
SIYRuleManager >> isRuleInDictionary: aPropertyClass forBlock: aBlock [
	
	"if block is of type text, check for SIYText instead of aBlock class"
	((aBlock isKindOf: SIYText) and: (aBlock class = SIYText) not)
		ifTrue: [^ (currentRules at: aPropertyClass ifAbsent: [^ false]) includes: SIYText]
		ifFalse: [^ (currentRules at: aPropertyClass ifAbsent: [^ false]) includes: aBlock class]
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
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:01'
}
SIYRuleManager >> isStop: aBlock [
	
	"isYou and isPush can override this rule"
	(aBlock isYou or: aBlock isPush) ifTrue: [^ false].
	
	^ self isRuleInDictionary: SIYStop forBlock: aBlock

]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
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
	#'squeak_changestamp' : 'LK 1/9/2024 11:30'
}
SIYRuleManager >> replaceBlocks: aBlockClass with: anotherBlockClass in: anArena [

	"blocks can't be replaced with textblocks"
	(anotherBlockClass = SIYText) ifTrue: [^ nil "do nothing"].
	
	(anArena replacementSet includes: aBlockClass)
		ifFalse: [(anArena blockMediator getBlocksOfType: aBlockClass)
			do: [:aBlock | aBlock replaceWithAndRemember: anotherBlockClass]]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/8/2024 22:59'
}
SIYRuleManager >> updateRulesInArena: anArena [
	"check for rule blocks in arena and update rule dictionary accordingly"

	| aDictionary |
	
	aDictionary := Dictionary new.
	
	(anArena blockMediator getBlocksOfType: SIYIs)
		do: [:anIsBlock | aDictionary := self addHorizontalRulesFor: anIsBlock to: aDictionary.
			aDictionary := self addVerticalRulesFor: anIsBlock to: aDictionary].
	
	self currentRules: aDictionary
]
