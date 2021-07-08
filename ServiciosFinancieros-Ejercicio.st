!classDefinition: #EXTRAValidPortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #EXTRAValidPortfolioTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:27:07'!
test01PortfolioCannotStoreSameAccountTwice
	|portfolio account|
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: account.
	
	 "manejo podria ser error o no hacer nada"
	
	self 
		should: [portfolio addAccountOrPortfolio: account]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountInPortfolioErrorDescription ].	
	
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:25:39'!
test02PortfolioCannotStoreAnAccountThatIsAlreadyInAnInternalPortfolio
	|portfolio1 portfolio2 accountA |
	
	accountA := ReceptiveAccount new.
	
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	
	"Agrego la cuenta al ptf2, y este al ptf1, luego intento agregar cuenta a ptf1"
	portfolio2 addAccountOrPortfolio: accountA.
	portfolio1 addAccountOrPortfolio: portfolio2.
	
	self 
		should: [portfolio1 addAccountOrPortfolio: accountA.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountInPortfolioErrorDescription ].	
	

! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:10:09'!
test03PortfolioCannotStoreItself
	|portfolio |
	
	
	portfolio  := Portfolio new.
	
	self 
		should: [portfolio addAccountOrPortfolio: portfolio.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreSelfErrorDescription ].	! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:11:03'!
test04PortfolioCannotStoreAccountIfAccountIsItemtOfPortfolioParent
	|portfolio1 portfolio2 account|
	
	account := ReceptiveAccount new.
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	
	portfolio1 addAccountOrPortfolio: account.
	portfolio1 addAccountOrPortfolio: portfolio2.

	
	
	self 
		should: [portfolio2 addAccountOrPortfolio: account.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountInPortfolioErrorDescription ].	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:28:38'!
test05PortfolioCannotStoreAnyAccountIfAnyAccountIsItemtOfAnyPortfolioParent
	|portfolio1 portfolio2 portfolio3 accountA accountB|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	portfolio3 := Portfolio new.
	
	"agrego cuentas a pf1 y pf2"
	portfolio1 addAccountOrPortfolio: accountA.
	portfolio2 addAccountOrPortfolio: accountB.
	
	"agrego pf3 a pf1 y pf2"
	portfolio1 addAccountOrPortfolio: portfolio3.
	portfolio2 addAccountOrPortfolio: portfolio3.
	
	
	

	self 
		should: [portfolio3 addAccountOrPortfolio: accountA.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountInPortfolioErrorDescription ].	

	self 
		should: [portfolio3 addAccountOrPortfolio: accountB.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountInPortfolioErrorDescription ].	! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:31:28'!
test06PortfolioCannotStorePortfolioIfBothIncludeTheSameAccount
	|portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	
	"agrego cuenta a pf1 y pf2"
	portfolio1 addAccountOrPortfolio: account.
	portfolio2 addAccountOrPortfolio: account.
	
	"agrego pf2 a pf1 "
	
	self 
		should: [portfolio1 addAccountOrPortfolio: portfolio2.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountInPortfolioErrorDescription ].	
	
! !


!classDefinition: #PortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:56:11'!
test01PortfolioKnowsBalanceOfItsAccount
	
	|portfolio account|
	
	account := ReceptiveAccount new.	
	Deposit register: 10 * peso  on: account. 
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: account.
	
	self assert: portfolio balance equals: 10 * peso.
	self deny: (portfolio balance isEqualTo: 5 * peso).

	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:16'!
test02PortfolioKnowsBalanceOfItsManyAccounts
	
	|portfolio accountA accountB| 
	
	accountA := ReceptiveAccount new.	
	accountB := ReceptiveAccount new.	

	Deposit register: 20 * peso  on: accountA. 
	Deposit register: 30 * peso on: accountB.
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: accountA.
	portfolio addAccountOrPortfolio: accountB.

	self assert: portfolio balance equals: 50 * peso.
	self deny: (portfolio balance isEqualTo: 5 * peso).
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:20'!
test03PortfolioKnowsBalanceOfInternalAccountsAndPortfolios
	
	|portfolio1 portfolio2 accountA accountB accountC| 
	
	accountA := ReceptiveAccount new.	
	accountB := ReceptiveAccount new.	
	accountC := ReceptiveAccount new.

	Deposit register: 20 * peso  on: accountA. 
	Deposit register: 30 * peso on: accountB.
	Deposit register: 40 * peso on: accountC.
	
	portfolio1  := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 addAccountOrPortfolio: accountA.
	portfolio1 addAccountOrPortfolio: accountB.
	
	portfolio2 addAccountOrPortfolio: portfolio1.
	portfolio2 addAccountOrPortfolio: accountC.

	self assert: portfolio2 balance equals: 90 * peso.
	self deny: (portfolio2 balance isEqualTo: 5 * peso).
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:24'!
test04PortfolioCanCheckForAccountTransactions
	
	|portfolio1 portfolio2 accountA accountB|
	
	accountA := ReceptiveAccount new.	
	accountB := ReceptiveAccount new.	
	
	Deposit register: 10 * peso  on: accountA. 
	portfolio1  := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 addAccountOrPortfolio: accountA.
	portfolio2 addAccountOrPortfolio: accountB.
	
	
	self assert: portfolio1 checkForTransaction.
	self deny: portfolio2 checkForTransaction.

	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:30'!
test05PortfolioCanCheckForAParticularAccountTransaction
	
	|portfolio account accountB transaction transactionB|
	
	account := ReceptiveAccount new.	
	accountB := ReceptiveAccount new.	

	
	transaction := Deposit register: 10 * peso  on: account. 
	transactionB := Deposit register: 10 * peso  on: accountB. 
	
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: account.
	
	
	self assert: (portfolio hasRegistered: transaction).
	self deny: (portfolio hasRegistered: transactionB ).
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:34'!
test06PortfolioCanCheckForPortfolioTransactions
	
	|portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	portfolio1  := Portfolio new.
	portfolio2 := Portfolio new.
	
	Deposit register: 10 * peso  on: account. 

	portfolio1 addAccountOrPortfolio: portfolio2 .
	portfolio2 addAccountOrPortfolio: account .

	
	self assert: portfolio1 checkForTransaction.
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:38'!
test07PortfolioKnowsTransactionsOfInternalAccount
	
	|portfolio  account |
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	Deposit register: 10 * peso  on: account. 

	portfolio addAccountOrPortfolio: account .
	
	self assert: (portfolio checkAccountTransactions: account) equals: account transactions.
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:53:46'!
test08PortfolioRisesAnErrorIfAskedForTransactionsOfNonInternalAccount
	
	|portfolio  account |
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	Deposit register: 10 * peso  on: account. 

	
	self 
		should: [portfolio checkAccountTransactions: account]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio accountIsNotInPortfolioErrorDescription ].	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:51'!
test09PortfolioKnowsAllTransactionsOfAnInternalAccount

	|portfolio  account  transaction|
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	transaction := Deposit register: 10 * peso  on: account. 

	
	portfolio addAccountOrPortfolio: account.
	
	self assert: portfolio transactions equals: account transactions .! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:38:57'!
test10PortfolioKnowsAllTransactionsOfAllInternalAccounts

	|portfolio  accountA accountB transactionA transactionB allTransactions|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	portfolio  := Portfolio new.
	
	transactionA := Deposit register: 10 * peso  on: accountA. 
	transactionB := Deposit register: 20 * peso  on: accountB. 
	
	allTransactions := OrderedCollection new.
	allTransactions add: transactionA .
	allTransactions add: transactionB .
	
	
	portfolio addAccountOrPortfolio: accountA.
	portfolio addAccountOrPortfolio: accountB.
	
	self assert: portfolio transactions equals: allTransactions .! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTests methodsFor: 'tests' stamp: 'IE 7/7/2021 22:40:47'!
test01AnyAmountOfPesosTransferenceCanBeMade

	| accountA accountB transference amount |
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	amount := 20 * peso.
	transference := Transference register: amount from: accountA to: accountB.
	self assert: transference value equals: amount.
	self deny: (transference value isEqualTo: 10*peso).! !

!TransferenceTests methodsFor: 'tests' stamp: 'IE 7/7/2021 22:37:33'!
test02EmittingAccountSuffersAccordingWithdrawalAfterTransference

	| accountA accountB |
	
	accountA := ReceptiveAccount new.
	Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	
	Transference register: 50 * peso  from: accountA to: accountB.
	self assert: 0 * peso equals: accountA balance.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'IE 7/7/2021 22:37:37'!
test03ReceivingAccountSuffersAccordingDepositAfterTransference

	| accountA accountB |
	
	accountA := ReceptiveAccount new.
	Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	Transference register: 50 * peso from: accountA to: accountB.
	self assert: 50 * peso equals: accountB balance.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'IE 7/7/2021 22:37:42'!
test04EmittingAccountWithdrawalKnowsItsCounterPart

	| accountA accountB |
	
	
	accountA := ReceptiveAccount new.
	Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	Transference register: 50 * peso from: accountA to: accountB.
	self assert: accountA lastTransaction counterPart equals: accountB lastTransaction.! !

!TransferenceTests methodsFor: 'tests' stamp: 'IE 7/7/2021 22:37:46'!
test05ReceivingAccountDepositKnowsItsCounterPart

	| accountA accountB |
	
	accountA := ReceptiveAccount new.
	Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	Transference register: 50 * peso from: accountA to: accountB.
	self assert: accountA lastTransaction counterPart equals: accountB lastTransaction.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'IE 7/3/2021 16:33:52'!
addToBalance

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositForTransference category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #DepositForTransference
	instanceVariableNames: 'counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositForTransference methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:37:21'!
addCounterPart: aCounterPart

	counterPart := aCounterPart.! !

!DepositForTransference methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:40:26'!
counterPart

	^counterPart.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'IE 7/3/2021 16:28:26'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'IE 7/3/2021 16:33:52'!
addToBalance

	^ (-1)*value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawForTransference category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #WithdrawForTransference
	instanceVariableNames: 'counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawForTransference methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:07:46'!
addCounterPart: aCounterPart

	counterPart := aCounterPart.! !

!WithdrawForTransference methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:08:05'!
counterPart

	^counterPart.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'items parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:33:05'!
addAccountOrPortfolio: anAccountOrPortfolio
	|newItemAlreadyInParent newItemAlreadyInSelf index|
	newItemAlreadyInParent := false.
	newItemAlreadyInSelf := false.
	index := 1.
	
	(parents isEmpty) ifFalse:[	
		[newItemAlreadyInParent or: (index > parents size)] whileFalse: [ 
			newItemAlreadyInParent := (parents at: index) checkIfItemIsAlreadyInPortfolio: anAccountOrPortfolio.
			newItemAlreadyInParent ifTrue: [self error: self class cannotStoreAccountInPortfolioErrorDescription .].
			index := index + 1.
			
			]
		].
	index := 1.
	
	(anAccountOrPortfolio isKindOf: Portfolio) ifTrue: [
	(items isEmpty) ifFalse:[
		[newItemAlreadyInSelf or: (index > items size)] whileFalse:[
			newItemAlreadyInSelf := anAccountOrPortfolio checkIfItemIsAlreadyInPortfolio: (items at: index) .
			newItemAlreadyInSelf ifTrue: [self error: self class cannotStoreAccountInPortfolioErrorDescription].
			index := index + 1.
			
			]
		]].
	
	
	(anAccountOrPortfolio == self) ifTrue: [self error: self class cannotStoreSelfErrorDescription ].
		

		
	(self checkIfItemIsAlreadyInPortfolio: anAccountOrPortfolio) ifTrue: [	self error: self class cannotStoreAccountInPortfolioErrorDescription ].
		
	items add: anAccountOrPortfolio.
	
	(anAccountOrPortfolio isKindOf: Portfolio) ifTrue: [anAccountOrPortfolio addParent: self ].
	
.


! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 18:10:00'!
addParent: aParent
	parents add: aParent .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:34:02'!
amountOfItems
	^items size! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:20:43'!
balance

	^items sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:53:46'!
checkAccountTransactions: anAccount
	
	(self checkIfItemIsAlreadyInPortfolio: anAccount ) ifFalse: [^self error: self class accountIsNotInPortfolioErrorDescription ].
	
	^anAccount transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:20:43'!
checkForTransaction
|anAccount|
	1 to: items size do: [ : index |
		
		anAccount := items at: index.
		
		anAccount checkForTransaction ifTrue: [^true]
		
		].
	
	^false.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:18:57'!
checkIfItemIsAlreadyInPortfolio: anItem
	|portfolioItem|
	
	1 to: items size do: [ :index |
		portfolioItem := items at: index.
		portfolioItem == anItem ifTrue: [^true.].
		(portfolioItem isKindOf: Portfolio) ifTrue: [(portfolioItem checkIfItemIsAlreadyInPortfolio: anItem) ifTrue: [^true. ]].
		
		].
	
	^false! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:58:21'!
hasRegistered: aTransaction
	1 to: items size do: [: index|
		
		((items at: index) hasRegistered: aTransaction 	) ifTrue:[^true.].
		
		
		].
	^false.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 18:10:23'!
initialize
	items := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 16:17:27'!
transactions
	|allTransactions|
	allTransactions := OrderedCollection  new.
	 1 to: items size do: [: index|
	
		allTransactions addAllLast: ((items at: index) transactions).		
		
		
		
		].
	^allTransactions .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:03:40'!
accountIsNotInPortfolioErrorDescription

	^'Account is not Portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:31:01'!
cannotStoreAccountInPortfolioErrorDescription

	^'cannot store ACCOUNT included in self, internal portfolio or parent portfolio, or PORTFOLIO with same account'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:09:28'!
cannotStoreSelfErrorDescription

	^'Portfolio cannot store itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'IE 7/3/2021 16:33:52'!
balance

	^transactions sum: [ :aTransaction | aTransaction addToBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MF 7/5/2021 21:31:44'!
checkForTransaction

	^transactions isEmpty not.
	
! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:24:39'!
lastTransaction

	^self transactions last.! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:41:13'!
initializeWithAccountToWithdrawFrom: anAccountToWithdraw andAccountToDepositIn: anAccountToDeposit withAmount: anAmount
	
	|depositTransaction withdrawTransaction |
	 
	value := anAmount.
	withdrawTransaction := WithdrawForTransference register: anAmount on: anAccountToWithdraw.
	depositTransaction := DepositForTransference register: anAmount on: anAccountToDeposit.
	depositTransaction addCounterPart: withdrawTransaction.
	withdrawTransaction addCounterPart: depositTransaction.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:41:13'!
value 

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 22:32:53'!
register: anAmount from: accountToWithdrawFrom to: accountToDepositIn

	^Transference new initializeWithAccountToWithdrawFrom: accountToWithdrawFrom andAccountToDepositIn: accountToDepositIn withAmount: anAmount.! !
