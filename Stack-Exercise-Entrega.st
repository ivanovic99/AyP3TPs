!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'IE 6/7/2021 12:24:37'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 17:52:06'!
test01SentenceFinderByPrefixCatedraTest

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	prefix := 'Wint'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result top equals: 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 17:55:37'!
test02MultiplesResults

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'Winter is coming'.
	stack push: 'Winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'Wint'.
	
	prefix := 'Wint'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result pop equals: 'Winter is coming'.
	self assert: result pop equals: 'Winter is here'.
	self assert: result pop equals: 'Wint'.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 17:56:37'!
test03NoResults

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'winter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'wint'.
	
	prefix := 'Wint'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 0.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 17:57:32'!
test04NoResultsButPrefixIsInSentences

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'no Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'no Winter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'no Wint'.
	
	prefix := 'Wint'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 0.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 17:58:32'!
test05NoResultsButPrefixIsInFirstWord

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'noWinter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'noWint'.
	
	prefix := 'Wint'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 0.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:01:40'!
test06NoResultsIfStackIsEmpty

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	
	
	prefix := 'Wint'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 0.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:02:18'!
test07NoResultsIfPrefixIsEmpty

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'noWinter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'noWint'.
	
	prefix := ''.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 0.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:17:35'!
test08SuperCaseSensitive
	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinterrrrrrrrrRRrrrrrrr is coming'.
	stack push: 'winninggggggggGGggggg is everything'.
	stack push: 'TheeeeeeeEEEeeeeeeeeee winds of Winter'.
	stack push: 'noooooooooooOOoooooWinter is here'.
	stack push: 'Wiiiiiiiiiiiiiiiiiiin'.
	stack push: 'wWwWwWwW'.
	stack push: 'wWwWwWwW'.

	
	prefix := 'wWwWwWwW'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 2.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:12:11'!
test09CanHandleShortPrefix
	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'noWinter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'wWwWwWwW'.
	stack push: 'Wiiiiin2'.
	stack push: 'wWwWwWwW'.
	stack push: 'noWint'.
	
	prefix := 'W'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 2.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:16:19'!
test10CanHandleLongPrefix

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'noWinter is here'.
	stack push: 'Wiiiiin'.
	stack push: 'wWwWwWwW'.
	stack push: 'Wiiiiin2'.
	stack push: 'wWwWwWwW'.
	stack push: 'noWint'.
	
	prefix := 'wWwWwWwW'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 2.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:21:21'!
test10CanHandleShortSentences

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinter'.
	stack push: 'winning'.
	stack push: 'The winds '.
	stack push: 'noWinter '.
	stack push: 'Wiiiiin'.
	stack push: 'wWwWwWwW'.
	stack push: 'Wiiiiin2'.
	stack push: 'wWwWwWwW'.
	stack push: 'noWint'.
	
	prefix := 'noWinter'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 2.
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'IE 6/10/2021 18:21:31'!
test12CanHandleLongSentences

	| stack prefix sentenceFinderByPrefix result |
	
	stack := OOStack new.
	stack push: 'noWinter is coming noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'winning is everything noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'The winds of Winter noWinter is coming noWinter is coming v noWinter is coming noWinter is coming'.
	stack push: 'noWinter is here noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'Wiiiiin noWinter is coming noWinter is comingnoWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'wWwWwWwW noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'Wiiiiin2 noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'wWwWwWwW noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	stack push: 'noWint noWinter is coming noWinter is coming noWinter is coming noWinter is coming'.
	
	prefix := 'wWwWwWwW'.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	
	result := (sentenceFinderByPrefix find: prefix in: stack).
	
	self assert: result size equals: 2.
	
	
	
	
	
	
	
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:09:19'!
initialize

	top := StackBottom new.
	size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:52:54'!
isEmpty

	^ (top isEmpty).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'IE 6/10/2021 16:10:04'!
pop

	|TopToReturn|
	
	TopToReturn := top. "Esto funciona para stackable element, en bottom directamente salta error"
	
	top := top next.
	
	size := size -1. "Solo se ejecuta si el top no explota con el error de StackBottom".
	
	
	^TopToReturn element .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'IE 6/10/2021 16:27:32'!
push: anElement


	|aStackableElement|
	
	size := self size.
	
	size:= size + 1. "Lo hago de entrada porque nunca puede fallar"
	
	aStackableElement := StackableElement new initializeWith: anElement.
	
	aStackableElement setNext: top.
	
	top := aStackableElement .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 13:02:34'!
size

	size := (size + (size abs) ) / 2. "Esto es para mandar el size a 0 si quedo negativo en operaciones anteriores"
	^ size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:03:17'!
top

	^top element.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'find' stamp: 'IE 6/10/2021 18:06:16'!
find: aPrefix in: stack

	| stackWithSentences auxiliarStack actualElement |

	stackWithSentences := OOStack new.
	auxiliarStack  := OOStack new.
	(self validSize: aPrefix) ifFalse: [^stackWithSentences].
	[stack isEmpty] whileFalse: [
		
		actualElement := stack pop.
		auxiliarStack push: actualElement.
		
		(self element: actualElement contains: aPrefix) ifTrue: [stackWithSentences push: actualElement.].
		
		].
	
	self reconstructStack: stack with: auxiliarStack.
	
	^stackWithSentences. 
		! !


!SentenceFinderByPrefix methodsFor: 'helpers-private' stamp: 'IE 6/10/2021 18:10:01'!
element: element contains: anotherElement

	| contains |
	(element size) < (anotherElement size) ifTrue: [^false].
	contains := true.
	1 to: anotherElement size do: [:index| 
		(element at: index) = (anotherElement at: index) ifFalse: [contains := false].
		
		].
	
	^contains.! !

!SentenceFinderByPrefix methodsFor: 'helpers-private' stamp: 'IE 6/10/2021 17:47:35'!
reconstructStack: stack with: auxiliarStack.

	[auxiliarStack isEmpty] whileFalse: [
		stack push: auxiliarStack pop.
		].! !

!SentenceFinderByPrefix methodsFor: 'helpers-private' stamp: 'IE 6/10/2021 18:04:53'!
validSize: anotherElement

	^anotherElement size > 0.! !


!classDefinition: #StackBottom category: 'Stack-Exercise'!
Object subclass: #StackBottom
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBottom methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:58:38'!
element

	^OOStack error: OOStack stackEmptyErrorDescription.! !

!StackBottom methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:19:25'!
isEmpty
	^true.! !

!StackBottom methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:32:19'!
next
	^self.! !


!classDefinition: #StackableElement category: 'Stack-Exercise'!
Object subclass: #StackableElement
	instanceVariableNames: 'element next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackableElement methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 11:58:35'!
element
	^element.! !

!StackableElement methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:13:59'!
initializeWith: anElement

	element := anElement. ! !

!StackableElement methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:20:35'!
isEmpty
	^false.! !

!StackableElement methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:23:03'!
next

	^next.! !

!StackableElement methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:01:15'!
setNext: nextElement

	next := nextElement .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackableElement class' category: 'Stack-Exercise'!
StackableElement class
	instanceVariableNames: ''!

!StackableElement class methodsFor: 'as yet unclassified' stamp: 'MF 6/10/2021 12:21:59'!
initializeWith: anElement

	! !
