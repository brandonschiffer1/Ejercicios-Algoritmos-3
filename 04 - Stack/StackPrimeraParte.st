!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 17:11:15'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 16:33:54'!
test02AnElementcanBePushedIntoTheStack

	|stack|
	
	stack := Stack new.
	
	stack push: 'messi'.
	
	self deny: stack isEmpty .! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 16:34:33'!
test03AnElementcanBePoppedFromTheStack

	|stack|
	
	stack := Stack new.
	
	stack push: 'messi'.
	
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 16:36:57'!
test04TheElementPoppedFromStackIsTheLastOne

	|stack poppedElement pushedElement|
	
	stack := Stack new.
	
	pushedElement := 'messi'.
	stack push: pushedElement .
	
	poppedElement := stack pop.
	
	self assert: poppedElement equals: pushedElement.! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 16:46:12'!
test05StackBehavesLIFO

	|stack firstPushedElement secondPushedElement firstPoppedElement secondPoppedElement|
	
	stack := Stack new.
	
	firstPushedElement :=  'messi'.
	secondPushedElement := 'dibu'.
	
	stack push: firstPushedElement.
	stack push: secondPushedElement.
	
	firstPoppedElement := stack pop.
	secondPoppedElement := stack pop.
	
	
	self assert: firstPoppedElement equals: secondPushedElement.
	
	self assert: secondPoppedElement equals: firstPushedElement.! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 17:02:41'!
test06ByToppingAnElementTheLastOnePushedIsObtainedWithoutRemovingItFromTheStack

	|stack firstPushedElement lastPushedElement|
	
	stack := Stack new.
	
	firstPushedElement := 'messi'.
	stack push: firstPushedElement.
	
	lastPushedElement := 'dibu'.
	stack push: lastPushedElement .

	
	self assert: stack top  equals: lastPushedElement.
	
	self assert: stack size equals: 2.! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 17:42:14'!
test07CanNotTopAnEmptyStack

	|stack|
	
	stack := Stack new.
	
	self 
		should: [ stack top ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Stack stackEmptyErrorDescription equals: anError messageText ].
	! !

!StackTest methodsFor: 'tests' stamp: 'b 10/7/2022 17:42:23'!
test08CanNotPopAnEmptyStack

	|stack|
	
	stack := Stack new.
	
	self 
		should: [ stack pop ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Stack stackEmptyErrorDescription equals: anError messageText ].
	! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'accesing' stamp: 'b 10/7/2022 14:24:41'!
isEmpty
	^ elements isEmpty.! !

!Stack methodsFor: 'accesing' stamp: 'b 10/7/2022 15:04:32'!
size
	^elements size.! !

!Stack methodsFor: 'accesing' stamp: 'b 10/7/2022 17:45:15'!
top
	self CheckForStackEmptyError.
	^elements last.! !


!Stack methodsFor: 'adding' stamp: 'b 10/7/2022 14:34:12'!
push: anElement

	elements add: anElement.! !


!Stack methodsFor: 'removing' stamp: 'b 10/7/2022 17:45:15'!
pop
	self CheckForStackEmptyError.
	^elements removeLast.! !


!Stack methodsFor: 'initialize' stamp: 'b 10/7/2022 14:24:02'!
initialize
	elements := OrderedCollection new.! !


!Stack methodsFor: 'private' stamp: 'b 10/7/2022 17:45:15'!
CheckForStackEmptyError
	(elements isEmpty) ifTrue: [^self error: self class stackEmptyErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'error' stamp: 'b 10/7/2022 17:38:39'!
stackEmptyErrorDescription

	^'Empty stack has no top'.! !
