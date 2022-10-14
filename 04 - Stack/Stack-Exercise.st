!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'bs 10/14/2022 10:51:12'!
test11CanNotCreateALimitedStackWithNonIntegerSize
	
	
	
	self 
		should: [OOStack newWithCapacity: 'messi']
		raise: Error
		withExceptionDo: [ :anError |
			self assert: 	OOStack stackSizeCapacityErrorDescription equals: anError messageText ]
	
	! !

!OOStackTest methodsFor: 'test' stamp: 'bs 10/14/2022 10:57:30'!
test12CanNotCreateALimitedStackWithNegativeNumberSize
	
	
	
	self 
		should: [OOStack newWithCapacity: -10]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: 	OOStack stackSizeCapacityErrorDescription equals: anError messageText ]
	
	! !

!OOStackTest methodsFor: 'test' stamp: 'bs 10/14/2022 11:18:35'!
test13StackHasTheLimitedSizeWhenCreated

	| limitedStack capacity |
	capacity := 5.
	limitedStack := OOStack newWithCapacity: capacity.
	
	self assert: limitedStack maximumSize equals: capacity.
	
	
	
	
	! !

!OOStackTest methodsFor: 'test' stamp: 'bs 10/14/2022 11:10:01'!
test14CanNotPushElementsWhenStackIsFull

	| limitedStack exceededPushedElement firstPushedElement secondPushedElement |
	limitedStack := OOStack newWithCapacity: 2.
	
	firstPushedElement := 'messi'.
	secondPushedElement := 'dibu'.
	exceededPushedElement := 'angelito di maría'.
	
	limitedStack push: firstPushedElement.
	limitedStack push: secondPushedElement.
	
	self 
		should: [limitedStack push: exceededPushedElement]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: 	OOStack stackPushIntoAFullStackErrorDescription equals: anError messageText ]
	
	
	
	
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/13/2022 23:55:01'!
test01aPrefixCannotBeFoundInAnEmptyStack 
	| stack sentenceFinder |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	

	
	self assert: (sentenceFinder find: 'Wint' in: stack) isEmpty.
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/13/2022 23:23:32'!
test02aPrefixCannotBeFoundBecauseIsNotInTheStack 
	| stack sentenceFinder |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	stack push: 'Messi sos el mejor'.
	stack push: 'Aguante la scaloneta'.
	stack push: 'Anulo mufa para el mundial'.
	
		self assert: (sentenceFinder find: 'Wint' in: stack) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/14/2022 01:20:38'!
test03aPrefixWithSpacesCannotBeFoundInStack 
	| stack sentenceFinder |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	
	stack push: 'Messi sos el mejor'.
	stack push: 'Aguante la scaloneta'.
	stack push: 'Anulo mufa para el mundial'.
	.
		self 
		should: [ sentenceFinder find: 'Messi sos' in: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix invalidPrefixWithSpacesErrorDescription equals: anError messageText ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/14/2022 01:20:58'!
test04anEmptyPrefixCannotBeFoundInStack 
	| stack sentenceFinder |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	
	stack push: 'Messi sos el mejor'.
	stack push: 'Aguante la scaloneta'.
	stack push: 'Anulo mufa para el mundial'.
	
		self 
		should: [ sentenceFinder find: '' in: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix invalidEmptyPrefixErrorDescription equals: anError messageText ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/14/2022 13:16:50'!
test05sentenceFinderIsCaseSensitive 
	| stack sentenceFinder sentencesWithPrefix |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	sentencesWithPrefix := OrderedCollection new.
	
	stack push: 'messi sos el mejor'.
	stack push: 'Messi sos grande'.
	stack push: 'Aguante la scaloneta'.
	stack push: 'Anulo mufa para el mundial'.
	
	sentencesWithPrefix add: 'Messi sos grande'.
		
	self assert: ((sentenceFinder find: 'Mes' in: stack) includesAllOf: sentencesWithPrefix).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/14/2022 13:17:45'!
test06aPrefixCanBeFoundInTheStack 
	| stack sentenceFinder sentencesWithPrefix |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	sentencesWithPrefix := OrderedCollection new.
	
	stack push: 'Messi sos el mejor'.
	stack push: 'Aguante la scaloneta y Messi'.
	stack push: 'Anulo mufa para el mundial, messi es el mejor'.
	
	sentencesWithPrefix add: 'Messi sos el mejor'.
		self assert: ((sentenceFinder find: 'Mes' in: stack) includesAllOf: sentencesWithPrefix).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/14/2022 13:20:18'!
test07stackRemainsUnchangedAfterSentenceFinderSearchesForAPrefix
	| stack sentenceFinder |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	
	stack push: 'Messi sos el mejor'.
	stack push: 'Aguante la scaloneta'.
	
	sentenceFinder find: 'Agua' in: stack.
	
	self assert: (stack pop = 'Aguante la scaloneta' and: [stack pop = 'Messi sos el mejor']).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bs 10/14/2022 13:22:34'!
test08ifStackHasRepeatedElementesSentenceFinderReturnsThemAll
	| stack sentenceFinder sentencesWithPrefix |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.	
	sentencesWithPrefix := OrderedCollection new.
	
	stack push: 'Messi sos el mejor'.
	stack push: 'La scaloneta'.
	stack push: 'Messi sos el mejor'.
	
	sentencesWithPrefix add: 'Messi sos el mejor'.
	sentencesWithPrefix add: 'Messi sos el mejor'.

	self assert: ((sentenceFinder find: 'M' in: stack) includesAllOf: sentencesWithPrefix).! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements maximumSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'bs 10/14/2022 00:32:35'!
initialize
	elements := OrderedCollection new.
	maximumSize := nil.
	! !

!OOStack methodsFor: 'testing' stamp: 'bs 10/10/2022 20:54:02'!
isEmpty
	
	^elements isEmpty.! !


!OOStack methodsFor: 'operations' stamp: 'bs 10/14/2022 12:35:24'!
pop
	| currentState |
	currentState := self getCurrentState.
	^currentState popFrom: self! !

!OOStack methodsFor: 'operations' stamp: 'bs 10/14/2022 12:35:39'!
push: anElement
	| currentState|
	currentState := self getCurrentState.
	currentState push: anElement in: self.! !

!OOStack methodsFor: 'operations' stamp: 'bs 10/10/2022 20:57:45'!
size
	^elements size.! !

!OOStack methodsFor: 'operations' stamp: 'bs 10/14/2022 12:35:49'!
top
	|currentState|
	currentState := self getCurrentState.
	^currentState topOf: self! !


!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 12:38:57'!
cannotPushWhenFull
	self error: self class stackPushIntoAFullStackErrorDescription ! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 11:28:49'!
checkStackCapacity: aSize
	(aSize isInteger not or: [aSize < 0]) ifTrue: [self error: self class stackSizeCapacityErrorDescription].
	! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 12:55:53'!
emptyError
	self error: self class stackEmptyErrorDescription! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 12:34:57'!
getCurrentState
	| currentState |
	currentState := (OOStackState currentStateOf: self) new.
	^currentState.! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 10:30:25'!
maximumSize
	^maximumSize.! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 12:33:02'!
popWithElements 
	^ elements removeLast.! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 01:27:59'!
pushWhenNotFull: anElement
	^elements add: anElement.! !

!OOStack methodsFor: 'operations - private' stamp: 'bs 10/14/2022 01:16:04'!
setCapacity: aSize
	self checkStackCapacity: aSize.
	maximumSize := aSize.! !

!OOStack methodsFor: 'operations - private' stamp: 'ro 10/12/2022 12:25:58'!
topWithElements
	^ elements last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'instance creation - limited' stamp: 'bs 10/14/2022 10:54:37'!
newWithCapacity: aSize
	^((self new initialize ) setCapacity: aSize).! !


!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'bs 10/14/2022 00:36:11'!
stackPushIntoAFullStackErrorDescription
	^'cannot push into a full stack'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'bs 10/14/2022 01:16:52'!
stackSizeCapacityErrorDescription
	^'Stack capacity must be a positive number'.! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'operations' stamp: 'ro 10/12/2022 12:31:02'!
popFrom: aStack
	self  subclassResponsibility.! !

!OOStackState methodsFor: 'operations' stamp: 'bs 10/14/2022 01:24:18'!
push: anElement in: aStack
	^aStack pushWhenNotFull: anElement.! !

!OOStackState methodsFor: 'operations' stamp: 'bs 10/14/2022 00:46:47'!
topOf: aStack
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'status' stamp: 'ro 10/12/2022 12:17:06'!
canBeAStateOf: aStack
	self subclassResponsibility ! !

!OOStackState class methodsFor: 'status' stamp: 'ro 10/12/2022 12:16:25'!
currentStateOf: aStack
	|currentState|
	currentState:= self subclasses detect: [:aState | aState canBeAStateOf: aStack]. 
	^currentState! !


!classDefinition: #Empty category: 'Stack-Exercise'!
OOStackState subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'operations' stamp: 'bs 10/14/2022 12:55:16'!
popFrom: aStack 
	^aStack emptyError.! !

!Empty methodsFor: 'operations' stamp: 'bs 10/14/2022 12:55:37'!
topOf: aStack
	^aStack emptyError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'checking' stamp: 'ro 10/12/2022 12:18:09'!
canBeAStateOf: aStack 
	^ aStack isEmpty ! !


!classDefinition: #Full category: 'Stack-Exercise'!
OOStackState subclass: #Full
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Full methodsFor: 'operations' stamp: 'bs 10/14/2022 12:38:23'!
push: anElement in: aStack
	^aStack cannotPushWhenFull.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Full class' category: 'Stack-Exercise'!
Full class
	instanceVariableNames: ''!

!Full class methodsFor: 'checking' stamp: 'bs 10/14/2022 10:30:08'!
canBeAStateOf: aStack
	^aStack size = aStack maximumSize.! !


!classDefinition: #WithElements category: 'Stack-Exercise'!
OOStackState subclass: #WithElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!WithElements methodsFor: 'operations' stamp: 'ro 10/12/2022 12:32:29'!
popFrom: aStack
	^aStack popWithElements.! !

!WithElements methodsFor: 'operations' stamp: 'bs 10/14/2022 00:46:47'!
topOf: aStack
	^aStack topWithElements.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithElements class' category: 'Stack-Exercise'!
WithElements class
	instanceVariableNames: ''!

!WithElements class methodsFor: 'checking' stamp: 'ro 10/12/2022 12:18:49'!
canBeAStateOf: aStack
	^aStack isEmpty not! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'bs 10/14/2022 12:27:31'!
find: aPrefix in: aStack
	| auxiliaryStack |
	auxiliaryStack := OOStack new.
	
	self checkIfPrefixIsValid: aPrefix.
	
	self popFrom: aStack andPushTo: auxiliaryStack.
	^self popFrom: auxiliaryStack andPushTo: aStack andFindSentencesWith: aPrefix .
	! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'bs 10/13/2022 23:51:27'!
checkIfPrefixIsValid: aPrefix
	(aPrefix isEmpty) ifTrue: [^self error: self class invalidEmptyPrefixErrorDescription ].
	(aPrefix includesSubString: ' ') ifTrue: [^self error: self class invalidPrefixWithSpacesErrorDescription ].! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'bs 10/14/2022 12:27:31'!
popFrom: aStack andPushTo: anotherStack
	
	self popFrom: aStack andPushTo: anotherStack andFindSentencesWith: ''. ! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'bs 10/14/2022 12:27:30'!
popFrom: aStack andPushTo: anotherStack andFindSentencesWith: aPrefix
	|sentencesWithPrefix|
	sentencesWithPrefix := OrderedCollection new.
	
	(aStack size) timesRepeat: [|sentence|. 
		sentence := aStack pop.
		 anotherStack push: sentence . 
		(sentence beginsWith: aPrefix ) ifTrue: 
			[sentencesWithPrefix add: sentence]].
	^sentencesWithPrefix.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'bs 10/13/2022 22:28:09'!
invalidEmptyPrefixErrorDescription

	^'Prefix cannot be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'bs 10/13/2022 22:27:31'!
invalidPrefixWithSpacesErrorDescription
	^'Prefix cannot have empty spaces' ! !
