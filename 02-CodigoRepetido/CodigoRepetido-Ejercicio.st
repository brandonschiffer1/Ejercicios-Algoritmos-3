!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 20:56:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self should: [ customerBook addCustomerNamed: 'John Lennon'] notTakeMoreThan: (Duration milliSeconds: 50).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 20:46:08'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self should:  [customerBook removeCustomerNamed: paulMcCartney] notTakeMoreThan: (Duration milliSeconds: 100).
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ro 9/26/2022 19:36:38'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self	try: [ customerBook addCustomerNamed: ''.] 
		catchingException: Error 
		checking: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 20:48:33'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self try: [ customerBook removeCustomerNamed: 'Paul McCartney'] 	
		catchingException: NotFound 
		checking: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 21:14:23'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self inTheBook: customerBook 
	assertAfterDoing: [customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.]  
		thatNumberOfActiveCustomersIs: 0 
		andNumberOfSuspendedCustomersIs: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 21:14:23'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.

	
	self inTheBook: customerBook 
	assertAfterDoing: [customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney] 
		thatNumberOfActiveCustomersIs: 0  
		andNumberOfSuspendedCustomersIs: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 21:17:11'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
		
	self try: [ customerBook suspendCustomerNamed: 'Ringo Starr'] 		
		catchingException: CantSuspend 
		checking: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'b 9/26/2022 21:18:08'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self try: [ customerBook suspendCustomerNamed: johnLennon ] 		
		catchingException: CantSuspend 
		checking: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'private' stamp: 'b 9/26/2022 21:14:23'!
inTheBook: aCustomerBook assertAfterDoing: operations thatNumberOfActiveCustomersIs: aNumberofActiveCustomers andNumberOfSuspendedCustomersIs: aNumberofSuspendedCustomers 

	operations value.
	
	self assert: aNumberofActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: aNumberofSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: 	aNumberofActiveCustomers + 	aNumberofSuspendedCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'private' stamp: 'ro 9/26/2022 19:37:28'!
try: aClosure catchingException: anException checking: anAssertClosure

	[ aClosure value.
	self fail ]
		on: anException
		do: anAssertClosure ! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'b 9/26/2022 20:18:22'!
includesCustomerNamed: aName

	^(active includes: aName ) or: [ suspended includes: aName].! !

!CustomerBook methodsFor: 'testing' stamp: 'b 9/26/2022 20:18:48'!
isEmpty
	
	^(active isEmpty) and: [ suspended isEmpty].! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'b 9/26/2022 20:17:31'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'b 9/24/2022 10:40:07'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self  numberOfSuspendedCustomers. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ro 9/26/2022 18:57:20'!
removeCustomerNamed: aName 
 	

	^active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'b 9/26/2022 20:19:34'!
suspendCustomerNamed: aName 
	
	(active includes: aName ) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName. 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
