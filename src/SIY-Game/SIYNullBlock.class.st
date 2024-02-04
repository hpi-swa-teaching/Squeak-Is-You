"
A SIYBlock is one block visible in the arena.

Instance Variables
	arena:	<SIYArena>

"
Class {
	#name : #SIYNullBlock,
	#superclass : #SIYBlock,
	#category : #'SIY-Game',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:42'
}
SIYNullBlock class >> isAndOperator [

	^ self basicNew isAndOperator
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:42'
}
SIYNullBlock class >> isIsOperator [

	^ self basicNew isIsOperator
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:43'
}
SIYNullBlock class >> isNoun [

	^ self basicNew isNoun
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:42'
}
SIYNullBlock class >> isOperator [

	^ self basicNew isOperator
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:43'
}
SIYNullBlock class >> isProperty [

	^ self basicNew isProperty
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/3/2024 20:43'
}
SIYNullBlock class >> isText [

	^ self basicNew isText
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 12/4/2023 17:02'
}
SIYNullBlock class >> newInArena: anArena [
	"create new block in SIY arena"

	^ self newInArena: anArena at: 0@0
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 1/3/2024 23:48'
}
SIYNullBlock class >> newInArena: anArena at: aPoint [
	"create new block in SIY arena at given coordinates"

	^ self basicNew initializeInArena: anArena at: aPoint
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 2/4/2024 15:08'
}
SIYNullBlock class >> symbol [

	^ self basicNew symbol
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/3/2024 21:03'
}
SIYNullBlock >> basicMove: aDirection [
	
	^ true

]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/3/2024 21:03'
}
SIYNullBlock >> cantMoveIn: aDirection [
	
	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 2/3/2024 21:22'
}
SIYNullBlock >> initialize [

	"do nothing"
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isDefeat [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isFloat [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isHot [

	^ false
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isMelt [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isOpen [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isPush [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isShut [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isSink [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isStop [

	^ false
	
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isWeak [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isWin [

	^ false
]

{
	#category : #'rule detection',
	#'squeak_changestamp' : 'LK 2/3/2024 21:01'
}
SIYNullBlock >> isYou [

	^ false
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/3/2024 21:03'
}
SIYNullBlock >> move: aDirection [
	
	^ false
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LK 2/3/2024 21:03'
}
SIYNullBlock >> move: aDirection pushedBy: aBlock [
	
	^ false

]
