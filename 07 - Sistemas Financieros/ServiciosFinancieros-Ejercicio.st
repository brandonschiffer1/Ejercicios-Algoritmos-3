!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'firstAccount secondAccount emptyPortfolio portfolioWithFirstAccount portfolioWithAnEmptyPortfolio portfolioWithAPortfolioThatHasFirstAccount portfolioWithAnAccountAndAPortfolioThatHasAnAccount portfolioWithFirstAndSecondAccount anotherPortfolioWithFirstAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:08:23'!
test01PortfolioHasZeroAsBalanceWhenCreatedWithAnEmptyAccount
.
	
	self assert: (portfolioWithFirstAccount balance) equals: (0*peso).! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:08:23'!
test02DepositInAnAccountIncreasesBalanceOnThePortfolio

	
	Deposit register: (100*peso) on: firstAccount.
	
	self assert: (portfolioWithFirstAccount balance) equals: (firstAccount balance).! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:00:20'!
test03DepositInMultipleAccountsMakesBalanceOnThePortfolioTheSumOfTheAccountsBalance


	Deposit register: (100*peso) on: firstAccount .
	Deposit register: (100*peso) on: secondAccount.

	
	self assert: (portfolioWithFirstAndSecondAccount balance) equals: (firstAccount balance + secondAccount balance).! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:08:23'!
test04PortfolioHasAnAccountThatRegisteredASpecificTransaction
	|  aDeposit |
	

	aDeposit:= Deposit register: (100*peso) on: firstAccount.
	
	
	self assert: (portfolioWithFirstAccount hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:08:23'!
test05PortfolioDoesNotHaveAnAccountThatRegisteredASpecificTransaction

	
	| aDeposit |
	aDeposit:= Deposit register: (100*peso) on: secondAccount.
	
	
	self deny: (portfolioWithFirstAccount hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:08:23'!
test06PortfolioHasNoTransactionsWhenNoAccountRegisteredATransaction
	self assert: portfolioWithFirstAccount transactions isEmpty.! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:09:07'!
test07PortfolioHasTheTransactionRegisteredByTheAccount

	
	Deposit register: (100*peso) on: firstAccount .
	
	
	
	self assert: (portfolioWithFirstAccount transactions) equals: (firstAccount transactions).
	

	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:35:07'!
test08PortfolioHasAllTransactionsWhenMultipleAccountsRegisteredATransaction
	
	
	Deposit register: (100*peso) on: firstAccount .
	Deposit register: (100*peso) on: secondAccount .	
	
	
	
	self assert: (portfolioWithFirstAndSecondAccount transactions) equals: (firstAccount transactions, secondAccount transactions ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:35:53'!
test09PortfolioBalanceIsZeroWhenContainingAnEmptyPortfolio
	self assert: portfolioWithAnEmptyPortfolio balance equals: 0 * peso.
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:44:21'!
test10DepositInAnAccountContainedInAPortfolioIncreasesBalanceOnTheOtherPortfolio
	| portfolioWithFirstAccountAdded portfolioFather |
	
	
	 portfolioWithFirstAccountAdded := emptyPortfolio add: firstAccount .
	Deposit register: 100*peso  on: firstAccount .
	portfolioFather := Portfolio with: portfolioWithFirstAccountAdded.
	
	self assert: portfolioFather balance equals: portfolioWithFirstAccountAdded balance. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:57:05'!
test11ATransactionMadeToAnAccountContainedInAPortfolioIsRegisteredInTheOtherPortfolio
	
	| transaction portfolioWithFirstAccountAndAPortfolioWithSecondAccount |
	emptyPortfolio add: secondAccount .
	 portfolioWithFirstAccountAndAPortfolioWithSecondAccount := portfolioWithAnEmptyPortfolio add: firstAccount .
	
	transaction := Withdraw register: 1000*peso  on: firstAccount .
	
	self assert: (portfolioWithFirstAccountAndAPortfolioWithSecondAccount hasRegistered: transaction).
	
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 02:00:08'!
test12ATransactionMadeToAnAccountContainedInAPortfolioIncreasesTheTotalTransactionsOfTheOtherOne

	
	Deposit register: 400*peso  on: firstAccount .
	
	self assert: (portfolioWithAPortfolioThatHasFirstAccount transactions size) equals: 1.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 01:58:54'!
test13PortfolioCanNotAddAnAlreadyAddedAccount
	self should: [portfolioWithFirstAccount add: firstAccount ] 
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAlreadyAddedAccountErrorDescription].
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 02:00:08'!
test14PortfolioCanNotAddAnAccountThatIsAlreadyInAnAddedPortfolio
	
	self should: [portfolioWithAPortfolioThatHasFirstAccount add: firstAccount] 
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAlreadyAddedAccountErrorDescription].
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 14:05:11'!
test15PortfolioCanNotAddItself
	self should: [emptyPortfolio add: emptyPortfolio] 
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddPorfolioItselfErrorDescription].
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'b 11/11/2022 02:02:42'!
test16PortfolioCanNotAddAnAccountThatHasBeenAddedToAFather

	
	portfolioWithAnEmptyPortfolio add: firstAccount.
	
	self should: [emptyPortfolio add: firstAccount]
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAccountThatHasBeenAddedToAFatherErrorDescription ].
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'ro 11/11/2022 10:58:00'!
test17PortfolioCanNotAddPortfolioWithAnAccountThatIsAlreadyInThePortfolio

	self should: [ portfolioWithFirstAccount add: anotherPortfolioWithFirstAccount]
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio 
		canNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolioErrorDescription ].
	
! !


!PortfolioTest methodsFor: 'setUp/tearDown' stamp: 'b 11/11/2022 02:07:12'!
setUp
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	emptyPortfolio  := Portfolio new.
	portfolioWithFirstAccount := Portfolio with: firstAccount.
	anotherPortfolioWithFirstAccount := Portfolio with: firstAccount. 
	portfolioWithFirstAndSecondAccount := (Portfolio with: firstAccount) add: secondAccount .
	portfolioWithAnEmptyPortfolio := Portfolio with: emptyPortfolio.
	portfolioWithAPortfolioThatHasFirstAccount  := Portfolio with: portfolioWithFirstAccount .
	portfolioWithAnAccountAndAPortfolioThatHasAnAccount  := (Portfolio with: portfolioWithFirstAccount)add:secondAccount.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'b 11/10/2022 20:29:57'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'originAccount destinationAccount transferValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'b 11/11/2022 13:48:33'!
test01TransferCanBeRegisteredBetweenTwoAccounts
	
	
	
	Transfer from: originAccount to: 	destinationAccount value: transferValue.
	
	
	self assert: originAccount balance equals: transferValue negated.
	self assert: 	destinationAccount balance equals: transferValue. ! !

!TransferTest methodsFor: 'tests' stamp: 'b 11/11/2022 13:48:39'!
test02TransferKnowsItsTransferValue

	| transfer |
	
	transfer := Transfer from: originAccount to: 	destinationAccount value: transferValue.
	
	self assert: transfer value equals: transferValue.
	
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'b 11/11/2022 13:48:45'!
test03TransferDepositLegKnowsItsCounterPart
	
	| transfer |
	
	transfer := Transfer from: originAccount to: 	destinationAccount value: transferValue.
	
	self assert: transfer depositLeg counterPart equals: transfer withdrawLeg. 
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'b 11/11/2022 13:48:51'!
test04TransferWithdrawLegKnowsItsCounterPart

	| transfer |
	transfer := Transfer from: originAccount to: 	destinationAccount value: transferValue.	
	
	self assert: transfer withdrawLeg counterPart equals: transfer depositLeg. 
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'b 11/10/2022 18:16:06'!
test05CanNotMakeATransferWithANegativeValue
	
	
	self should: [Transfer from: originAccount to: destinationAccount value: transferValue negated.] 
		raise: Error
		withExceptionDo: [:anError| self assert: anError messageText equals: Transfer invalidTransferValueErrorDescription].! !


!TransferTest methodsFor: 'setUp/tearDown' stamp: 'b 11/9/2022 14:51:32'!
setUp

	originAccount := ReceptiveAccount new.
	destinationAccount  := ReceptiveAccount new.
	
	transferValue := 100 * peso.
	
	
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'fathers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'private' stamp: 'b 11/11/2022 02:08:35'!
addFather: aNewFatherPortfolio
	fathers add: aNewFatherPortfolio.! !

!Account methodsFor: 'private' stamp: 'ro 11/11/2022 11:24:38'!
isAlreadyAddedOn: anAccount 
	self subclassResponsibility
	! !

!Account methodsFor: 'private' stamp: 'b 11/11/2022 00:12:51'!
isComposedBy: anAccount
	self subclassResponsibility.! !


!Account methodsFor: 'initialize' stamp: 'b 11/11/2022 00:10:29'!
initialize
	self subclassResponsibility.! !


!Account methodsFor: 'main protocol' stamp: 'b 11/11/2022 00:09:49'!
balance
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'b 11/11/2022 00:12:37'!
hasRegistered: aTransaction
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'verification' stamp: 'b 11/11/2022 00:37:44'!
verifyIfAccountIsAlreadyAdded: anAccountToBeChecked
	
	
	self verifyIfAnAccountIsComposedBy: anAccountToBeChecked .
	self verifyIfAnyFatherHasAnAccount: anAccountToBeChecked.
	self verifyIfPortfolioAccountsAreAlreadyAdded: anAccountToBeChecked.
	
	 
	
	! !

!Portfolio methodsFor: 'verification' stamp: 'b 11/11/2022 02:11:11'!
verifyIfAnAccountIsComposedBy: anAccountToBeChecked
	(self isComposedBy: anAccountToBeChecked) ifTrue: [self error: self class canNotAddAnAlreadyAddedAccountErrorDescription]
	
	 
	
	! !

!Portfolio methodsFor: 'verification' stamp: 'b 11/11/2022 02:11:06'!
verifyIfAnyFatherHasAnAccount: anAccountToBeChecked
	(self fathersHaveAnAccount: anAccountToBeChecked) ifTrue:[self error: self class canNotAddAnAccountThatHasBeenAddedToAFatherErrorDescription] 
	
	 
	
	! !

!Portfolio methodsFor: 'verification' stamp: 'b 11/11/2022 14:26:11'!
verifyIfPortfolioAccountsAreAlreadyAdded: anAccountToBeChecked
	 (self isPartOf: anAccountToBeChecked) ifTrue: [self error: self class canNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolioErrorDescription].
	 
	
	! !

!Portfolio methodsFor: 'verification' stamp: 'b 11/11/2022 14:05:59'!
verifyIfPortfolioIsAlreadyAdded: aPortfolio
	(self = aPortfolio) ifTrue: [self error: self class canNotAddPorfolioItselfErrorDescription].
	! !


!Portfolio methodsFor: 'main protocol' stamp: 'b 11/11/2022 14:05:59'!
add: anAccount
	self verifyIfAccountIsAlreadyAdded: anAccount.
	self verifyIfPortfolioIsAlreadyAdded: anAccount.
	accounts add: anAccount.
	anAccount addFather: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'b 11/11/2022 00:14:13'!
balance
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^(0*peso)].
! !

!Portfolio methodsFor: 'main protocol' stamp: 'b 11/11/2022 14:29:11'!
hasRegistered: aTransaction
	accounts detect: [:anAccount| anAccount hasRegistered: aTransaction] ifFound:[:anAccount| ^true] ifNone:[ ^false].! !

!Portfolio methodsFor: 'main protocol' stamp: 'b 11/11/2022 00:14:13'!
transactions
	|transactions |
	transactions := OrderedCollection new.
	accounts do: [:anAccount |  	transactions addAllLast: anAccount transactions].
	^transactions ! !


!Portfolio methodsFor: 'initialize' stamp: 'b 11/11/2022 00:15:52'!
initialize 
	accounts := OrderedCollection new.
	fathers := OrderedCollection new.! !

!Portfolio methodsFor: 'initialize' stamp: 'b 11/11/2022 00:55:09'!
initializeWith: anAccount
	accounts  := OrderedCollection with: anAccount.
	anAccount addFather: self.! !


!Portfolio methodsFor: 'private' stamp: 'b 11/10/2022 23:49:46'!
fathersHaveAnAccount: anAccountToBeChecked
	^fathers anySatisfy: [:father | father isComposedBy: anAccountToBeChecked].! !

!Portfolio methodsFor: 'private' stamp: 'ro 11/11/2022 11:41:38'!
isAlreadyAddedOn: aPortfolio
	^accounts anySatisfy: [:anAccount | aPortfolio isComposedBy: anAccount].! !

!Portfolio methodsFor: 'private' stamp: 'b 11/11/2022 13:59:53'!
isComposedBy: anAccountToBeChecked
	^ accounts anySatisfy: [:anAccount | anAccount isComposedBy: anAccountToBeChecked].! !

!Portfolio methodsFor: 'private' stamp: 'b 11/11/2022 15:24:14'!
isPartOf: anAccountToBeChecked
	^anAccountToBeChecked isAlreadyAddedOn: self.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'b 11/10/2022 23:48:15'!
canNotAddAnAccountThatHasBeenAddedToAFatherErrorDescription
	^'Account has already been added in a father'.! !

!Portfolio class methodsFor: 'error' stamp: 'b 11/10/2022 22:39:59'!
canNotAddAnAlreadyAddedAccountErrorDescription
	^'The account is already in the portfolio'.! !

!Portfolio class methodsFor: 'error' stamp: 'b 11/11/2022 13:59:03'!
canNotAddPorfolioItselfErrorDescription
	^' a portfolio cannot add itself'.! !

!Portfolio class methodsFor: 'error' stamp: 'b 11/11/2022 00:35:22'!
canNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolioErrorDescription
	^' cannot add a portfolio with an account that is already in a father portfolio'.! !


!Portfolio class methodsFor: 'instance creation' stamp: 'b 11/11/2022 00:54:37'!
with: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'b 11/11/2022 00:20:28'!
initialize

	transactions := OrderedCollection new.
	fathers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'b 11/4/2022 19:37:25'!
balance
	| aBalance|
	aBalance := 0.
	
	transactions do: [:aTransaction | 
		 aBalance := aTransaction applyTo: aBalance.
			
		
		].
	
	^aBalance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'b 11/10/2022 20:29:57'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'ro 11/11/2022 11:37:45'!
isAlreadyAddedOn: aPortfolio
	^aPortfolio isComposedBy: self.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'b 11/10/2022 23:50:49'!
isComposedBy: anAccountToBeChecked
	^self = anAccountToBeChecked.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'b 11/11/2022 14:12:12'!
value 

	^value.! !


!AccountTransaction methodsFor: 'operations' stamp: 'b 11/11/2022 14:13:08'!
applyTo: aBalance
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'initialize' stamp: 'b 11/11/2022 14:15:30'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'b 11/11/2022 14:18:40'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'operations' stamp: 'b 11/4/2022 19:37:25'!
applyTo: aBalance
	^aBalance +  value.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'counterPart' stamp: 'b 11/9/2022 14:33:11'!
addCounterPart: aTransferWithdraw
	counterPart := aTransferWithdraw.! !

!TransferDeposit methodsFor: 'counterPart' stamp: 'b 11/9/2022 14:33:42'!
counterPart
	^counterPart.! !


!TransferDeposit methodsFor: 'operations' stamp: 'b 11/11/2022 02:17:26'!
applyTo: aBalance
	^aBalance +  value.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'counterPart' stamp: 'b 11/9/2022 14:35:37'!
addCounterPart: aTransferDeposit
	counterPart := aTransferDeposit.! !

!TransferWithdraw methodsFor: 'counterPart' stamp: 'b 11/9/2022 14:35:10'!
counterPart
	^counterPart.! !


!TransferWithdraw methodsFor: 'operations' stamp: 'b 11/11/2022 02:17:39'!
applyTo: aBalance
	^aBalance -  value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'operations' stamp: 'b 11/4/2022 19:40:25'!
applyTo: aBalance
		^aBalance -  value.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialize' stamp: 'b 11/11/2022 13:43:53'!
initializeFor: aValue withdraw: aWithdraw deposit: aDeposit.
	
	
	value := aValue.
	
	depositLeg := aDeposit.
	withdrawLeg := aWithdraw.
	
	depositLeg addCounterPart: withdrawLeg.
	withdrawLeg addCounterPart: depositLeg.
	! !


!Transfer methodsFor: 'legs' stamp: 'b 11/9/2022 14:25:38'!
depositLeg
	^depositLeg.! !

!Transfer methodsFor: 'legs' stamp: 'b 11/9/2022 14:25:54'!
withdrawLeg
	^withdrawLeg.! !


!Transfer methodsFor: 'value' stamp: 'b 11/9/2022 14:18:52'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'depositLeg withdrawLeg'!

!Transfer class methodsFor: 'error' stamp: 'b 11/10/2022 18:16:55'!
invalidTransferValueErrorDescription
	^'Can not transfer a negative  amount of money'.! !


!Transfer class methodsFor: 'verification' stamp: 'b 11/11/2022 13:20:36'!
checkTransferValue: aValue
	(aValue < 0) ifTrue: [self error: self invalidTransferValueErrorDescription].! !


!Transfer class methodsFor: 'instance creation' stamp: 'b 11/11/2022 13:42:40'!
from: anOriginAccount to: aDestinationAccount value: aValue

	| deposit withdraw |
	self checkTransferValue: aValue.
	
	deposit := TransferDeposit register: aValue on: aDestinationAccount .
	withdraw := TransferWithdraw register: aValue on: anOriginAccount.

	^self new initializeFor: aValue withdraw: withdraw deposit: deposit.! !
