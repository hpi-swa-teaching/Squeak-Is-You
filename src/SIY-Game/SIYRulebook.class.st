"
The SIYRulebook is an updates, checks and invokes currently applying game rules.

Instance Variables
	currentRules: <Dictionary>


"
Class {
	#name : #SIYRulebook,
	#superclass : #Object,
	#instVars : [
		'currentRules'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 2/4/2024 20:14'
}

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:37'
}
SIYRulebook >> addHorizontalReplacementRulesFor: anIsBlock to: aDictionary [

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
	#'squeak_changestamp' : 'LK 2/4/2024 20:15'
}
SIYRulebook >> addHorizontalRulesFor: anIsBlock to: aDictionary [

	| nounBlocks propertyBlocks aSet |
	
	nounBlocks := self collectNounsLeftOf: anIsBlock.
	propertyBlocks := self collectPropertiesRightOf: anIsBlock.
	
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks do: [:aProperty | 
			aSet := aDictionary at: aProperty class ifAbsent: Set new.
			aSet addAll: (nounBlocks collect: [:aNoun | aNoun representsBlock]).
			aDictionary at: aProperty class put: aSet]].
	
	^ aDictionary

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/11/2024 22:36'
}
SIYRulebook >> addVerticalReplacementRulesFor: anIsBlock to: aDictionary [

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
	#'squeak_changestamp' : 'LK 2/4/2024 20:15'
}
SIYRulebook >> addVerticalRulesFor: anIsBlock to: aDictionary [

	| nounBlocks propertyBlocks aSet |
	
	nounBlocks := self collectNounsAbove: anIsBlock.
	propertyBlocks := self collectPropertiesBelow: anIsBlock.
	
	(nounBlocks notEmpty and: propertyBlocks notEmpty)
		ifTrue: [propertyBlocks do: [:aProperty |
			aSet := aDictionary at: aProperty class ifAbsent: Set new.
			aSet addAll: (nounBlocks collect: [:aNoun | aNoun representsBlock]).
			aDictionary at: aProperty class put: aSet]].
	
	^ aDictionary
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/9/2024 10:18'
}
SIYRulebook >> checkDefeat: aBlock onTile: aTile [
	
	((aTile anySatisfy: [:each | each isYou]) 
		and: (aTile anySatisfy: [:each | each isDefeat]))
			ifTrue: [self invokeDefeat: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 2/4/2024 20:12'
}
SIYRulebook >> checkMelt: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isMelt]) 
		and: (aTile anySatisfy: [:each | each isHot]))
			ifTrue: [self invokeMelt: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 2/4/2024 19:01'
}
SIYRulebook >> checkMovementRulesFor: aBlock pushedBy: anotherBlock havingNeighbours: aSet inDirection: aDirection [
	"This method returns true/false, depending on whether anotherBlock, who pushed
	aBlock, should be able to move onto aBlock's tile according to rules. 
	If the rule checks implemented here can't decide whether this should be the case, 
	we return nil."
	
	(aBlock isShut and: anotherBlock isOpen) ifTrue: [^ true].
	(aBlock isOpen and: anotherBlock isShut) ifTrue: [^ true].
	
	(aBlock isPush or: aBlock isYou) ifFalse: [^ true].
	aBlock isStop ifTrue: [^ false].
	
	aSet ifNil: [^ aBlock cantMoveIn: aDirection].
	aSet ifEmpty: [^ aBlock basicMove: aDirection].
	
	(aSet anySatisfy: [:each | each isStop and: (each isShut and: aBlock isOpen) not])
		ifTrue: [^ aBlock cantMoveIn: aDirection].
		
	^ nil
	
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/6/2024 21:15'
}
SIYRulebook >> checkOpen: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isOpen])
		and: (aTile anySatisfy: [:each | each isShut]))
			ifTrue: [self invokeOpen: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 2/4/2024 20:12'
}
SIYRulebook >> checkRulesFor: aBlock [

	| groundTile floatingTile |

	aBlock arena isGameLocked ifTrue: [^ nil].
	
	groundTile := [aBlock neighborsHere select: [:each | each isFloat not]].
	floatingTile := [aBlock neighborsHere select: [:each | each isFloat]].
	
	{groundTile . floatingTile} 
		do: [:aTile | aTile value
			ifNotEmpty: [self checkWeak: aBlock onTile: aTile value copy;
					checkDefeat: aBlock onTile: aTile value copy;
					checkSink: aBlock onTile: aTile value copy;
					checkOpen: aBlock onTile: aTile value copy;
					checkMelt: aBlock onTile: aTile value copy;
					checkWin: aBlock onTile: aTile value copy]]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 2/4/2024 20:12'
}
SIYRulebook >> checkSink: aBlock onTile: aTile [
	
	((aTile anySatisfy: [:each | each isSink]) 
		and: aTile size > 1)
			ifTrue: [self invokeSink: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 2/4/2024 20:12'
}
SIYRulebook >> checkWeak: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isWeak]) 
		and: (aTile size > 1))
			ifTrue: [self invokeWeak: aTile]
]

{
	#category : #'rule checking',
	#'squeak_changestamp' : 'LK 1/9/2024 10:19'
}
SIYRulebook >> checkWin: aBlock onTile: aTile [

	((aTile anySatisfy: [:each | each isYou]) 
		and: (aTile anySatisfy: [:each | each isWin]))
			ifTrue: [self invokeWin: aBlock]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:15'
}
SIYRulebook >> collectNounBelow: aBlock [
	
	aBlock neighborsBelow ifNil: [^ nil].

	aBlock isOperator
		ifTrue: [aBlock neighborsBelow do: [:each |
			each isNoun ifTrue: [^ each].
			each isProperty ifTrue: [^ self collectNounBelow: each]]].
	
	aBlock isProperty
		ifTrue: [aBlock neighborsBelow do: [:each |
			each isAndOperator ifTrue: [^ self collectNounBelow: each]]].
	
	^ nil

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:15'
}
SIYRulebook >> collectNounRightOf: aBlock [
	
	aBlock neighborsRight ifNil: [^ nil].

	aBlock isOperator
		ifTrue: [aBlock neighborsRight do: [:each |
			each isNoun ifTrue: [^ each].
			each isOperator ifTrue: [^ self collectNounRightOf: each]]].
	
	aBlock isProperty
		ifTrue: [aBlock neighborsRight do: [:each |
			each isAndOperator ifTrue: [^ self collectNounRightOf: each]]].
	
	^ nil
		

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:15'
}
SIYRulebook >> collectNounsAbove: aBlock [
	
	| aSet |
	
	aSet := Set new.
	aBlock neighborsAbove ifNil: [^ aSet].

	aBlock isOperator
		ifTrue: [aBlock neighborsAbove do: [:each |
			each isNoun ifTrue: [aSet add: each. 
				aSet addAll: (self collectNounsAbove: each)]]].
	
	aBlock isNoun
		ifTrue: [aBlock neighborsAbove do: [:each |
			each isAndOperator ifTrue: [aSet addAll: (self collectNounsAbove: each)]]].
	
	^ aSet

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:16'
}
SIYRulebook >> collectNounsLeftOf: aBlock [

	| aSet |
	
	aSet := Set new.
	aBlock neighborsLeft ifNil: [^ aSet].

	aBlock isOperator
		ifTrue: [aBlock neighborsLeft do: [:each |
			each isNoun ifTrue: [aSet add: each. 
				aSet addAll: (self collectNounsLeftOf: each)]]].
	
	aBlock isNoun
		ifTrue: [aBlock neighborsLeft do: [:each |
			each isAndOperator ifTrue: [aSet addAll: (self collectNounsLeftOf: each)]]].
	
	^ aSet


]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:16'
}
SIYRulebook >> collectPropertiesBelow: aBlock [

	| aSet |
	
	aSet := Set new.
	aBlock neighborsBelow ifNil: [^ aSet].

	aBlock isOperator
		ifTrue: [aBlock neighborsBelow do: [:each |
			each isProperty ifTrue: [aSet add: each].
			(each isProperty or: each isNoun)
				ifTrue: [aSet addAll: (self collectPropertiesBelow: each)]]].
	
	(aBlock isProperty or: aBlock isNoun)
		ifTrue: [aBlock neighborsBelow do: [:each |
			each isAndOperator ifTrue: [aSet addAll: (self collectPropertiesBelow: each)]]].
	
	^ aSet
		
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:16'
}
SIYRulebook >> collectPropertiesRightOf: aBlock [

	| aSet |
	
	aSet := Set new.
	aBlock neighborsRight ifNil: [^ aSet].

	aBlock isOperator
		ifTrue: [aBlock neighborsRight do: [:each |
			each isProperty ifTrue: [aSet add: each].
			(each isProperty or: each isNoun)
				ifTrue: [aSet addAll: (self collectPropertiesRightOf: each)]]].
	
	(aBlock isProperty or: aBlock isNoun)
		ifTrue: [aBlock neighborsRight do: [:each |
			each isAndOperator ifTrue: [aSet addAll: (self collectPropertiesRightOf: each)]]].
	
	^ aSet
		

]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/3/2024 23:00'
}
SIYRulebook >> currentRules [

	^ currentRules ifNil: [currentRules := Dictionary new]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 1/3/2024 22:59'
}
SIYRulebook >> currentRules: aDictionary [

	currentRules := aDictionary
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'KD 2/1/2024 14:55'
}
SIYRulebook >> invokeDefeat: aTile [

	aTile do: [:each | each isYou ifTrue: [each deleteAndRemember]]
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'KD 2/1/2024 14:55'
}
SIYRulebook >> invokeMelt: aTile [

	aTile do: [:each | each isMelt ifTrue: [each deleteAndRemember]]
	
	

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/5/2024 12:29'
}
SIYRulebook >> invokeOpen: aTile [

	aTile do: [:each | (each isShut or: each isOpen) ifTrue: [each deleteAndRemember]]
	
	

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/9/2024 12:56'
}
SIYRulebook >> invokeReplacementRules: aDictionary in: anArena [

	aDictionary
		keysAndValuesDo: [:aBlockClass :replacementBlock | 
			self replaceBlocks: aBlockClass with: replacementBlock in: anArena]
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'KD 2/1/2024 14:56'
}
SIYRulebook >> invokeSink: aTile [
	
	aTile do: [:each | each isFloat not ifTrue: [each deleteAndRemember]]

]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'KD 2/1/2024 14:56'
}
SIYRulebook >> invokeWeak: aTile [

	aTile do: [:each | each isWeak ifTrue: [each deleteAndRemember]]
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 1/31/2024 14:35'
}
SIYRulebook >> invokeWin: aBlock [
	
	"lock game to prevent player movement while win animation plays"
	aBlock arena lockGame.
	
	"don't switch levels here, SIYWinAnimation will do that if it has finished playing"
	SIYWinAnimation playFor: aBlock
	
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/9/2024 10:16'
}
SIYRulebook >> isDefeat: aBlock [
	
	^ self isRuleInDictionary: SIYDefeat forBlock: aBlock
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:00'
}
SIYRulebook >> isFloat: aBlock [

	^ self isRuleInDictionary: SIYFloat forBlock: aBlock
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRulebook >> isHot: aBlock [

	^ self isRuleInDictionary: SIYHot forBlock: aBlock

	
	
	
	
	
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRulebook >> isMelt: aBlock [

	^ self isRuleInDictionary: SIYMelt forBlock: aBlock

	
	
	
	
	
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRulebook >> isOpen: aBlock [
	
	^ self isRuleInDictionary: SIYOpen forBlock: aBlock
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 2/3/2024 20:10'
}
SIYRulebook >> isPush: aBlock [
	
	"text blocks are always isPush"
	aBlock isText ifTrue: [^ true].
	
	^ self isRuleInDictionary: SIYPush forBlock: aBlock

]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 2/4/2024 20:13'
}
SIYRulebook >> isRuleInDictionary: aPropertyClass forBlock: aBlock [
	
	"if block is textblock, check rules for SIYText instead of aBlock class"
	(aBlock isText and: (aBlock class = SIYText) not)
		ifTrue: [^ (self currentRules at: aPropertyClass ifAbsent: [^ false])
			includes: SIYText]
		ifFalse: [^ (self currentRules at: aPropertyClass ifAbsent: [^ false])
			includes: aBlock class]
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRulebook >> isShut: aBlock [
	
	^ self isRuleInDictionary: SIYShut forBlock: aBlock
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/9/2024 10:17'
}
SIYRulebook >> isSink: aBlock [

	^ self isRuleInDictionary: SIYSink forBlock: aBlock
]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/16/2024 18:58'
}
SIYRulebook >> isStop: aBlock [
	
	"isYou, isPush and isWeak can override this rule"
	(aBlock isYou or: aBlock isPush or: aBlock isWeak) ifTrue: [^ false].
	
	^ self isRuleInDictionary: SIYStop forBlock: aBlock

]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/16/2024 18:07'
}
SIYRulebook >> isWeak: aBlock [
	
	^ self isRuleInDictionary: SIYWeak forBlock: aBlock

]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'LK 1/15/2024 17:14'
}
SIYRulebook >> isWin: aBlock [
	
	^ self isRuleInDictionary: SIYWin forBlock: aBlock

]

{
	#category : #'rule testing',
	#'squeak_changestamp' : 'ivenschlegelmilch 1/8/2024 13:01'
}
SIYRulebook >> isYou: aBlock [

	^ self isRuleInDictionary: SIYYou forBlock: aBlock

	
	
	
	
	
]

{
	#category : #'rule invoking',
	#'squeak_changestamp' : 'LK 2/3/2024 20:40'
}
SIYRulebook >> replaceBlocks: aBlockClass with: anotherBlockClass in: anArena [

	"blocks can't be replaced with textblocks"
	anotherBlockClass isText ifTrue: [^ nil "do nothing"].
	
	aBlockClass = anotherBlockClass
		ifFalse: [(anArena gameBoard getBlocksLike: aBlockClass)
			do: [:aBlock | aBlock replaceWithAndRemember: anotherBlockClass]]
]

{
	#category : #'rule updating',
	#'squeak_changestamp' : 'LK 2/4/2024 20:16'
}
SIYRulebook >> updateRulesInArena: anArena [

	| ruleDictionary replacementDictionary |
	
	ruleDictionary := Dictionary new.
	replacementDictionary := Dictionary new.
	
	(anArena gameBoard getBlocksThatSatisfy: [:each | each isIsOperator])
		do: [:anIsBlock | 
			ruleDictionary := self addHorizontalRulesFor: anIsBlock to: ruleDictionary.
			ruleDictionary := self addVerticalRulesFor: anIsBlock to: ruleDictionary.
			replacementDictionary := self addHorizontalReplacementRulesFor: anIsBlock 
				to: replacementDictionary.
			replacementDictionary := self addVerticalReplacementRulesFor: anIsBlock
				 to: replacementDictionary].
	
	self invokeReplacementRules: replacementDictionary in: anArena;
		currentRules: ruleDictionary
]
