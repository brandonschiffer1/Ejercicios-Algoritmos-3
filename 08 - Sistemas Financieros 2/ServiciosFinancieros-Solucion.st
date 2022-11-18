!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'anAccount originAccount destinationAccount anAccountSummary anAccountSummaryOfOriginAccount anAccountSummaryOfDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'setUp/tearDown' stamp: 'b 11/15/2022 21:09:17'!
setUp
	anAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	anAccountSummary := AccountSummary of: anAccount.
	anAccountSummaryOfOriginAccount := AccountSummary of: originAccount.
	anAccountSummaryOfDestinationAccount := AccountSummary of: destinationAccount.
	
	! !


!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:08:27'!
test01SummaryOfAnEmptyAccountIsZeroAsBalance
	| expectedSummary |
	
	expectedSummary := OrderedCollection with: 'Balance = 0 * pesos'.
	
	
	self assert: (anAccountSummary exportReport) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:08:28'!
test02SummaryOfAnAccountWithADepositIsTheDepositValueAndItsBalance
	| expectedSummary |
	
	Deposit register: 50 * peso on: anAccount.
	expectedSummary := OrderedCollection newFrom: {'Depósito por 50 * pesos'. 'Balance = 50 * pesos'}.
	
	self assert: (anAccountSummary exportReport) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:08:28'!
test03SummaryOfAnAccountWithAWithdrawitIsTheWithdrawValueAndItsBalance
	| expectedSummary |
	
	Withdraw register: 10 * peso on: anAccount.
	expectedSummary := OrderedCollection newFrom: {'Extracción por 10 * pesos'. 'Balance = -10 * pesos'}.
	
	self assert: (anAccountSummary exportReport) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:09:53'!
test04SummaryOfAnAccountWithATransferWithdrawLegIsTheTransferWithdrawLegValueAndItsBalance
	| expectedSummary |
	
	Transfer amount: 25 * peso from: originAccount to: destinationAccount. 
	expectedSummary := OrderedCollection newFrom: {'Salida por transferencia de 25 * pesos'. 'Balance = -25 * pesos'}.
	
	self assert: (anAccountSummaryOfOriginAccount exportReport ) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:10:06'!
test05SummaryOfAnAccountWithATransferDepositLegIsTheTransferDepositLegValueAndItsBalance
	| expectedSummary |

	
	Transfer amount: 35 * peso from: originAccount to: destinationAccount. 
	expectedSummary := OrderedCollection newFrom: {'Entrada por transferencia de 35 * pesos'. 'Balance = 35 * pesos'}.
	
	self assert: (anAccountSummaryOfDestinationAccount exportReport ) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:10:21'!
test06SummaryOfAnAccountWithDepositWithdrawAndTranfersIsAllItsValuesAndBalance
	| expectedSummary |
	
	Deposit register: 100 * peso on: originAccount .
	Withdraw register: 40 * peso on: originAccount .
	Transfer amount: 30 * peso from: originAccount to: destinationAccount.
	Transfer amount: 80 * peso from: destinationAccount to: originAccount .
	 
	expectedSummary := OrderedCollection newFrom: {'Depósito por 100 * pesos'. 'Extracción por 40 * pesos'. 'Salida por transferencia de 30 * pesos'. 'Entrada por transferencia de 80 * pesos'. 'Balance = 110 * pesos'}.
	
	self assert: (anAccountSummaryOfOriginAccount exportReport ) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:11:02'!
test07SummaryOfAnEmptyPortfolioIsZeroAsBalance
	| expectedSummary emptyPortfolio accountSummaryOfEmptyPortfolio |
	emptyPortfolio := Portfolio new.
	 
	expectedSummary := OrderedCollection newFrom: {'Balance = 0 * pesos'}.
	accountSummaryOfEmptyPortfolio := AccountSummary of: emptyPortfolio.
	
	self assert: (accountSummaryOfEmptyPortfolio exportReport) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'b 11/15/2022 21:12:01'!
test08SummaryOfAPortfolioWithAnAccountThatHasTransactionsIsTheTransactionsValuesAndBalance
	| expectedSummary aPortfolioWithAnAccount accountSummaryOfAPortfolioWithAnAccount |
	
	
	Deposit register: 20 * peso on: anAccount.
	Withdraw register: 10 * peso on: anAccount.
	
	aPortfolioWithAnAccount := Portfolio with: anAccount.
	accountSummaryOfAPortfolioWithAnAccount := AccountSummary of: aPortfolioWithAnAccount.
	 
	expectedSummary := OrderedCollection newFrom: {'Depósito por 20 * pesos'. 'Extracción por 10 * pesos'. 'Balance = 10 * pesos'}.
	
	self assert: (accountSummaryOfAPortfolioWithAnAccount exportReport ) equals: expectedSummary.! !


!classDefinition: #AccountTransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountTransferNetTest
	instanceVariableNames: 'originAccount destinationAccount anAccount accountTransferNetOfAnAccount accountTransferNetOfOriginAccount accountTransferNetOfDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransferNetTest methodsFor: 'setUp/tearDown' stamp: 'b 11/15/2022 21:16:19'!
setUp
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.
	accountTransferNetOfAnAccount := AccountTransferNet of: anAccount.
	accountTransferNetOfOriginAccount := AccountTransferNet of: originAccount.
	accountTransferNetOfDestinationAccount := AccountTransferNet of: destinationAccount.! !


!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test01TransferNetOfAnAccountWithNoTransactionsIsZero
	
	
	self assert: (accountTransferNetOfAnAccount transferNetBalance) equals: 0 * peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test02TransferNetOfAnAccountWithATransferWithdrawLegIsTheTransferWithdrawLegValue

	
	Transfer amount: 50 * peso from: originAccount to: destinationAccount.
	
	self assert: (accountTransferNetOfOriginAccount transferNetBalance ) equals: -50* peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test03TransferNetOfAnAccountWithATransferDepositLegIsTheTransferDepositLegValue
	
	
	Transfer amount: 50 * peso from: originAccount to: destinationAccount.
	
	self assert: (accountTransferNetOfDestinationAccount transferNetBalance ) equals: 50* peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test04TransferNetOfAnAccountWithATransferDepositLegAndTransferWithdrawLegIsTheNetValue
	
	
	Transfer amount: 50 * peso from: originAccount to: destinationAccount.
	Transfer amount: 10 * peso from: destinationAccount to: originAccount.
	
	self assert: (accountTransferNetOfOriginAccount transferNetBalance ) equals: -40* peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test05TransferNetOfAnAccountTakesIntoConsiderationJustTransferLegs
	
	
	Deposit register: 30 * peso on: originAccount.
	Withdraw register: 10 * peso on: originAccount.
	Transfer amount: 50 * peso from: originAccount to: destinationAccount.
	Transfer amount: 10 * peso from: destinationAccount to: originAccount.
	
	self assert: (accountTransferNetOfOriginAccount transferNetBalance ) equals: -40* peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test06TransferNetOfAnEmptyPortfolioIsZero
	| emptyPortfolio accountTransferNetOfEmptyPortfolio |
	emptyPortfolio := Portfolio new.
	accountTransferNetOfEmptyPortfolio := AccountTransferNet of: emptyPortfolio.
	
	
	self assert: (accountTransferNetOfEmptyPortfolio transferNetBalance) equals: 0* peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'b 11/18/2022 01:42:34'!
test07TransferNetOfAPortfolioWithAnAccountThatHasTransactionsIsTheNetValue
	| aPortfolioWithAnAccount accountTransferNetOfAPortfolioWithAnAccount |
	Transfer amount: 20 * peso from: originAccount to: destinationAccount.
	
	aPortfolioWithAnAccount := Portfolio with: originAccount.
	accountTransferNetOfAPortfolioWithAnAccount := AccountTransferNet of: aPortfolioWithAnAccount.
	
	
	self assert: (accountTransferNetOfAPortfolioWithAnAccount transferNetBalance) equals: -20* peso.! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test01PortfolioDetailedTreePrinterCanPrintTheNameOfAPortfolioAndItsBalance
	| expectedDetailedTree portfolioDetailedTreePrinter qataryFamilyPortfolio |
	
	expectedDetailedTree := OrderedCollection newFrom: {'Cuentas de la familia Qatari'. String tab, 'Balance = 0 * pesos'}.
	
	qataryFamilyPortfolio := Portfolio named: 'Cuentas de la familia Qatari'.
	
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: qataryFamilyPortfolio.
	
	self assert: (portfolioDetailedTreePrinter treeStructureOfPortfolio) equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test02PortfolioDetailedTreePrinterCanPrintAPortfolioWithAnAccountWithNoTransactions
	| expectedDetailedTree portfolioDetailedTreePrinter qataryFamilyPortfolio jequeSonQataryAccount |
	
	expectedDetailedTree := OrderedCollection newFrom: {'Cuentas de la familia Qatari'. String tab,  'Cuenta del hijo del jeque'. String tab, String tab, 'Balance = 0 * pesos'. String tab, 'Balance = 0 * pesos'}.
	
	jequeSonQataryAccount := ReceptiveAccount named: 'Cuenta del hijo del jeque'.
	qataryFamilyPortfolio := Portfolio named: 'Cuentas de la familia Qatari' with: jequeSonQataryAccount.
	
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: qataryFamilyPortfolio.
	
	self assert: (portfolioDetailedTreePrinter treeStructureOfPortfolio) equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test03PortfolioDetailedTreePrinterCanPrintAPortfolioAndAnAccountWithItsSummary
	| expectedDetailedTree portfolioDetailedTreePrinter qataryFamilyPortfolio jequeSonQataryAccount |
	
	expectedDetailedTree := OrderedCollection newFrom: {'Cuentas de la familia Qatari'.
													String tab,  'Cuenta del hijo del jeque'. 
													String tab, String tab, 'Depósito por 1 * peso'. 
													String tab, String tab, 'Balance = 1 * peso'. 
													String tab, 'Balance = 1 * peso'}.
	
	jequeSonQataryAccount := ReceptiveAccount named: 'Cuenta del hijo del jeque'.
	
	Deposit register: 1 * peso on: jequeSonQataryAccount.
	
	qataryFamilyPortfolio := Portfolio named: 'Cuentas de la familia Qatari' with: jequeSonQataryAccount.
	
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: qataryFamilyPortfolio.
	
	self assert: (portfolioDetailedTreePrinter treeStructureOfPortfolio) equals: expectedDetailedTree! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test04PortfolioDetailedTreePrinterCanPrintAComposedPortfolioWithManyAccountsAndTheirSummaries
	| expectedDetailedTree portfolioDetailedTreePrinter qataryFamilyPortfolio jequeSonQataryAccount fatherJequeQataryAccount daugtherOfJequeQataryAccount sonsPortolio |
	expectedDetailedTree := OrderedCollection newFrom: {'Cuentas de la familia Qatari'.
													String tab, 'Cuenta del padre del jeque'.
													String tab, String tab, 'Depósito por 200 * pesos'.
													String tab, String tab, 'Balance = 200 * pesos'. 
													String tab, 'El portfolio de los hijos'.
													String tab, String tab, 'Cuenta del hijo del jeque'. 
													String tab, String tab, String tab, 'Depósito por 100 * pesos'. 
													String tab, String tab,String tab, 'Extracción por 50 * pesos'. 
													String tab, String tab, String tab, 'Salida por transferencia de 10 * pesos'. 
													String tab, String tab, String tab, 'Balance = 40 * pesos'.
													String tab, String tab, 'La cuenta de la hija del jeque'. 
													String tab, String tab, String tab, 'Entrada por transferencia de 10 * pesos'. 
													String tab, String tab, String tab, 'Balance = 10 * pesos'. 
													String tab, String tab, 'Balance = 50 * pesos'. 
													String tab, 'Balance = 250 * pesos'}.
	
	jequeSonQataryAccount := ReceptiveAccount named: 'Cuenta del hijo del jeque'.
	fatherJequeQataryAccount := ReceptiveAccount named: 'Cuenta del padre del jeque'.
	daugtherOfJequeQataryAccount := ReceptiveAccount named: 'La cuenta de la hija del jeque'.
	sonsPortolio := Portfolio named: 'El portfolio de los hijos' with: jequeSonQataryAccount with: daugtherOfJequeQataryAccount.
	
	Deposit register: 200 * peso on: fatherJequeQataryAccount.
	Deposit register: 100 * peso on: jequeSonQataryAccount.
	Withdraw register: 50 * peso on: jequeSonQataryAccount.
	Transfer amount: 10 * peso from: jequeSonQataryAccount to: daugtherOfJequeQataryAccount.
	
	qataryFamilyPortfolio := Portfolio named: 'Cuentas de la familia Qatari' with: fatherJequeQataryAccount with: sonsPortolio.
	
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: qataryFamilyPortfolio.
	
	self assert: (portfolioDetailedTreePrinter treeStructureOfPortfolio) equals: expectedDetailedTree! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test01PortfolioTreePrinterCanPrintTheNameOfAPortfolio

	| aPortfolio portfolioTree expectedPortfolioTreePrinter |
	aPortfolio := Portfolio named: 'Qatar investment world cup 2022'.
	
	portfolioTree := PortfolioTreePrinter of: aPortfolio.
	
	expectedPortfolioTreePrinter := OrderedCollection with: 'Qatar investment world cup 2022'.

	self assert: (portfolioTree treeStructureOfPortfolio) equals: expectedPortfolioTreePrinter.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test02PortfolioTreePrinterCanPrintAPortfolioWithAnAccount

	| aPortfolio portfolioTree expectedPortfolioTreePrinter jequesAccount |
	
	jequesAccount := ReceptiveAccount named: 'Cuenta del jeque Qatari'.
	
	aPortfolio := Portfolio named: 'Qatar investment world cup 2022' with: jequesAccount.
	
	portfolioTree := PortfolioTreePrinter of: aPortfolio.
	
	expectedPortfolioTreePrinter := OrderedCollection newFrom: {'Qatar investment world cup 2022'. String tab, 'Cuenta del jeque Qatari'}.

	self assert: (portfolioTree treeStructureOfPortfolio) equals: expectedPortfolioTreePrinter.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test03PortfolioTreePrinterCanPrintAComposedPortfolioWithAnAccount

	| aPortfolio portfolioTree expectedPortfolioTreePrinter jequesAccount fathersJequeAccount qatarFamilyPortfolio |
	
	jequesAccount := ReceptiveAccount named: 'Cuenta del jeque Qatari'.
	aPortfolio := Portfolio named: 'Qatar investment world cup 2022' with: jequesAccount.
	fathersJequeAccount := ReceptiveAccount named: 'El jeque papa'. 
	qatarFamilyPortfolio := Portfolio named: 'Portfolio de la familia Qatari' with: fathersJequeAccount with: aPortfolio.
	
	portfolioTree := PortfolioTreePrinter of: qatarFamilyPortfolio.
	
	expectedPortfolioTreePrinter := OrderedCollection newFrom: {'Portfolio de la familia Qatari'. String tab, 'El jeque papa'. String tab, 'Qatar investment world cup 2022'. String tab, String tab, 'Cuenta del jeque Qatari'}.

	self assert: (portfolioTree treeStructureOfPortfolio) equals: expectedPortfolioTreePrinter.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'b 11/18/2022 12:26:52'!
test04PortfolioTreePrinterCanPrintAComposedPortfolioWithManyAccounts

	| aPortfolio portfolioTree expectedPortfolioTreePrinter jequesAccount elPapaJequeAccount qatarFamilyPortfolio anotherjequeAccount |
	jequesAccount := ReceptiveAccount named: 'Cuenta del jeque Qatari'.
	anotherjequeAccount := ReceptiveAccount named: 'Cuenta del otro jeque Qatari'.

	aPortfolio := Portfolio named: 'Qatar investment world cup 2022' with: jequesAccount with: anotherjequeAccount .
	elPapaJequeAccount := ReceptiveAccount named: 'El jeque papa'. 
	qatarFamilyPortfolio := Portfolio named: 'Portfolio de la familia Qatari' with: elPapaJequeAccount with: aPortfolio.
	
	portfolioTree := PortfolioTreePrinter of: qatarFamilyPortfolio.
	
	expectedPortfolioTreePrinter := OrderedCollection newFrom: {'Portfolio de la familia Qatari'. String tab, 'El jeque papa'. String tab, 'Qatar investment world cup 2022'. String tab, String tab, 'Cuenta del jeque Qatari'. String tab, String tab, 'Cuenta del otro jeque Qatari'}.

	self assert: (portfolioTree treeStructureOfPortfolio) equals: expectedPortfolioTreePrinter.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'initialization' stamp: 'b 11/18/2022 01:39:33'!
initializeWithName: aName 
	name := aName.! !


!Account methodsFor: 'reports' stamp: 'b 11/18/2022 01:40:25'!
name
	^name! !


!Account methodsFor: 'private' stamp: 'ro 11/17/2022 19:46:03'!
addTransactionsTo: aCollectionOfTransactions
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'b 11/18/2022 01:37:06'!
named: aName 
	^self new initializeWithName: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'b 11/11/2022 20:17:34'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'ro 11/17/2022 15:46:16'!
accounts

	^accounts! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reports' stamp: 'ro 11/17/2022 15:41:05'!
accept: aPortfolioTreePrinter
	aPortfolioTreePrinter visitPortfolio: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'ro 11/17/2022 13:03:11'!
named: aName with: aReceptiveAccount 
	^self new 
		initializeWithName: aName; 
		add: aReceptiveAccount;
		yourself.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'ro 11/17/2022 13:44:27'!
named: aName with: anAccount with: anotherAccount
	^self new 
		initializeWithName: aName;
		add: anAccount;
		add: anotherAccount;
		yourself 
		
			! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'b 11/11/2022 20:17:46'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'ro 11/17/2022 15:47:17'!
accept: aPortfolioTreePrinter
	aPortfolioTreePrinter visitReceptiveAccount: self.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReport methodsFor: 'visit' stamp: 'b 11/15/2022 22:24:32'!
visitDeposit: aDeposit
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visit' stamp: 'b 11/15/2022 22:25:01'!
visitTransferDepositLeg: aTransferDepositLeg
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visit' stamp: 'b 11/15/2022 22:25:20'!
visitTransferWithdrawLeg: aTransferWithdrawLeg
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visit' stamp: 'b 11/15/2022 22:25:32'!
visitWithdraw: aWithdraw
	self subclassResponsibility ! !


!AccountReport methodsFor: 'initialization' stamp: 'b 11/18/2022 11:58:58'!
initializeOf: anAccount
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'instance creation' stamp: 'b 11/18/2022 01:42:58'!
of: anAccount 
	
	^self new initializeOf: anAccount! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'receptiveAccount account summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'b 11/15/2022 22:41:15'!
initializeOf: anAccount
	account := anAccount.
	summary := OrderedCollection new.! !


!AccountSummary methodsFor: 'main protocol' stamp: 'b 11/15/2022 22:35:16'!
exportReport
	
	account transactions do: [:aTransaction |  aTransaction accept: self.].
		
	self addBalanceDescription.
	
	^summary .
	! !


!AccountSummary methodsFor: 'adding' stamp: 'b 11/15/2022 22:36:25'!
add: aDescriptionOfATransaction
	summary add: aDescriptionOfATransaction.! !

!AccountSummary methodsFor: 'adding' stamp: 'b 11/15/2022 22:34:56'!
addBalanceDescription
	self add: ('Balance = ' , account balance asString).! !


!AccountSummary methodsFor: 'visit' stamp: 'b 11/15/2022 22:36:44'!
visitDeposit: aDeposit
	self add: 'Depósito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'visit' stamp: 'b 11/15/2022 22:36:53'!
visitTransferDepositLeg: aTransferDepositLeg
	self add: 'Entrada por transferencia de ', aTransferDepositLeg value asString.
	! !

!AccountSummary methodsFor: 'visit' stamp: 'b 11/15/2022 22:36:59'!
visitTransferWithdrawLeg: aTransferWithdrawLeg
	self add: 'Salida por transferencia de ', aTransferWithdrawLeg value asString.! !

!AccountSummary methodsFor: 'visit' stamp: 'b 11/15/2022 22:37:05'!
visitWithdraw: aWithdraw
	self add: 'Extracción por ', aWithdraw value asString.! !


!classDefinition: #AccountTransferNet category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #AccountTransferNet
	instanceVariableNames: 'account netBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransferNet methodsFor: 'initialization' stamp: 'b 11/15/2022 22:18:13'!
initializeOf: anAccount
	account := anAccount.
	netBalance := 0 * peso.
	
	! !


!AccountTransferNet methodsFor: 'visit' stamp: 'b 11/15/2022 22:39:47'!
visitDeposit: aDeposit
	
	
	! !

!AccountTransferNet methodsFor: 'visit' stamp: 'b 11/15/2022 22:39:21'!
visitTransferDepositLeg: aTransferDepositLeg
	netBalance :=  aTransferDepositLeg affectBalance: netBalance.
	
	
	
	! !

!AccountTransferNet methodsFor: 'visit' stamp: 'b 11/15/2022 22:39:34'!
visitTransferWithdrawLeg: aTransferWithdrawLeg
	 netBalance := aTransferWithdrawLeg affectBalance: netBalance .
	
	
	! !

!AccountTransferNet methodsFor: 'visit' stamp: 'b 11/15/2022 22:40:04'!
visitWithdraw: aWithdraw
	
	
	! !


!AccountTransferNet methodsFor: 'main protocol' stamp: 'b 11/18/2022 01:42:34'!
transferNetBalance
	 

	account transactions do: [:aTransaction |   aTransaction accept: self].
	

	^netBalance.
		
	
	
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reports' stamp: 'b 11/15/2022 22:28:45'!
accept: aReport
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reports' stamp: 'b 11/15/2022 22:30:10'!
accept: aSummaryReport
	^aSummaryReport visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'reports' stamp: 'b 11/15/2022 22:30:59'!
accept: aSummaryReport
	^aSummaryReport visitTransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'reports' stamp: 'b 11/15/2022 22:30:44'!
accept: aSummaryReport
	^aSummaryReport visitTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'reports' stamp: 'b 11/15/2022 22:30:29'!
accept: aSummaryReport
	^aSummaryReport visitWithdraw: self.! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !


!classDefinition: #TreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #TreePrinter
	instanceVariableNames: 'account names'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TreePrinter methodsFor: 'visit' stamp: 'ro 11/17/2022 22:23:10'!
visitPortfolio: aPortfolio 
	self subclassResponsibility ! !

!TreePrinter methodsFor: 'visit' stamp: 'ro 11/17/2022 22:23:24'!
visitReceptiveAccount: anAccount 
	self subclassResponsibility ! !


!TreePrinter methodsFor: 'main protocol' stamp: 'b 11/18/2022 12:26:51'!
treeStructureOfPortfolio
	self addNamesIn: account.
	^names! !


!TreePrinter methodsFor: 'initialization' stamp: 'ro 11/17/2022 22:20:41'!
initializeWith: aPortfolio 
	account := aPortfolio.
	names := OrderedCollection new.! !


!TreePrinter methodsFor: 'private' stamp: 'b 11/18/2022 12:34:13'!
addChildrenNamesOf: aPortfolio
	aPortfolio accounts do: [:anAccount | names addAll: (self addTabTo: (self class of: anAccount) treeStructureOfPortfolio)].! !

!TreePrinter methodsFor: 'private' stamp: 'b 11/18/2022 12:32:18'!
addNameOf: anAccount
	names add: anAccount name! !

!TreePrinter methodsFor: 'private' stamp: 'ro 11/17/2022 22:26:13'!
addNamesIn: anAccount 
	anAccount accept: self.! !

!TreePrinter methodsFor: 'private' stamp: 'b 11/18/2022 12:30:19'!
addTabTo: anOrderedCollection
	| tabbedOrderedCollection |
	tabbedOrderedCollection := OrderedCollection new.
	anOrderedCollection do: [:anElement | tabbedOrderedCollection add: (String tab, anElement)].
	^tabbedOrderedCollection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreePrinter class' category: 'ServiciosFinancieros-Solucion'!
TreePrinter class
	instanceVariableNames: ''!

!TreePrinter class methodsFor: 'instance creation' stamp: 'ro 11/17/2022 22:21:24'!
of: aPortfolio 
	^self new initializeWith: aPortfolio ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
TreePrinter subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'visit' stamp: 'b 11/18/2022 12:37:08'!
visitPortfolio: aPortfolio 
	self addNameOf: aPortfolio.
	self addChildrenNamesOf: aPortfolio.
	self addBalanceOf: aPortfolio.
	! !

!PortfolioDetailedTreePrinter methodsFor: 'visit' stamp: 'b 11/18/2022 12:35:15'!
visitReceptiveAccount: anAccount 
	
	self addNameOf: anAccount.
	self addSummaryOf: anAccount.

	! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'b 11/18/2022 12:37:20'!
addBalanceOf: aPortfolio
	names add: (String tab,'Balance = ', aPortfolio balance asString). ! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'b 11/18/2022 12:35:41'!
addSummaryOf: anAccount
	| summary |
	summary := (AccountSummary of: anAccount) exportReport.
	summary do: [:aSummaryLine | names add:  (String tab, aSummaryLine)].! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
TreePrinter subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'visit' stamp: 'b 11/18/2022 12:33:54'!
visitPortfolio: aPortfolio 
	self addNameOf: aPortfolio.
	self addChildrenNamesOf: aPortfolio.! !

!PortfolioTreePrinter methodsFor: 'visit' stamp: 'b 11/18/2022 12:32:04'!
visitReceptiveAccount: anAccount 
	self addNameOf: anAccount.! !
