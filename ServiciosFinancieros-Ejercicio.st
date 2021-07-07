!classDefinition: #EXTRAValidPortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #EXTRAValidPortfolioTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 17:26:56'!
test01PortfolioCannotStoreSameAccountTwice
	|portfolio account|
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: account.
	portfolio addAccountOrPortfolio: account.
	 "manejo podria ser error o no hacer nada"
	
	self assert: portfolio amountOfItems equals: 1.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 17:29:27'!
test03PortfolioCannotStoreAnAccountThatIsAlreadyInAnInternalPortfolio
	|portfolio1 portfolio2 accountA |
	
	accountA := ReceptiveAccount new.
	
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	
	"Agrego la cuenta al ptf2, y este al ptf1, luego intento agregar cuenta a ptf1"
	portfolio2 addAccountOrPortfolio: accountA.
	portfolio1 addAccountOrPortfolio: portfolio2.
	
	portfolio1 addAccountOrPortfolio: accountA.

	
	self assert: portfolio1 amountOfItems equals: 1.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 17:29:41'!
test04PortfolioCannotStoreItself
	|portfolio |
	
	
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: portfolio.
	
	self assert: portfolio amountOfItems equals: 0.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 18:26:39'!
test05PortfolioCannotStoreAccountIfAccountIsItemtOfPortfolioParent
	|portfolio1 portfolio2 account|
	
	account := ReceptiveAccount new.
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	
	portfolio1 addAccountOrPortfolio: account.
	portfolio1 addAccountOrPortfolio: portfolio2.

	portfolio2 addAccountOrPortfolio: account .
	
	self assert: portfolio2 amountOfItems equals: 0.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:03:25'!
test06PortfolioCannotStoreAnyAccountIfAnyAccountIsItemtOfAnyPortfolioParent
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
	
	portfolio3 addAccountOrPortfolio: accountA.
	portfolio3 addAccountOrPortfolio: accountB.

	
	self assert: portfolio3 amountOfItems equals: 0.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:27:48'!
test07PortfolioCannotStorePortfolioIfBothIncludeTheSameAccount
	|portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	
	"agrego cuenta a pf1 y pf2"
	portfolio1 addAccountOrPortfolio: account.
	portfolio2 addAccountOrPortfolio: account.
	
	"agrego pf2 a pf1 "
	portfolio1 addAccountOrPortfolio: portfolio2.
	
	self assert: portfolio1 amountOfItems equals: 1.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:30:03'!
test08
	|portfolio1 portfolio2 portfolio3  |
	
	
	portfolio1  := Portfolio new.
	portfolio2  := Portfolio new.
	portfolio3  := Portfolio new.
	
	
	portfolio1 addAccountOrPortfolio: portfolio3.
	portfolio2 addAccountOrPortfolio: portfolio3.
	
	portfolio1 addAccountOrPortfolio: portfolio2.

	
	self assert: portfolio1 amountOfItems equals: 1.
	
! !

!EXTRAValidPortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 17:28:42'!
ztest02
	|portfolio accountA accountB|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: accountA.
	portfolio addAccountOrPortfolio: accountB.
	
	portfolio addAccountOrPortfolio: accountA.

	
	self assert: portfolio amountOfItems equals: 2.
	
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

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:06:59'!
test03PortfolioKnowsBalanceOfItsManyAccounts
	
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

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:07:33'!
test04PortfolioKnowsBalanceOfInternalAccountsAndPortfolios
	
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

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:16:31'!
test05PortfolioCanCheckForAccountTransactions
	
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

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:59:45'!
test06PortfolioCanCheckForAParticularAccountTransaction
	
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

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:18:27'!
test07PortfolioCanCheckForPortfolioTransactions
	
	|portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	portfolio1  := Portfolio new.
	portfolio2 := Portfolio new.
	
	Deposit register: 10 * peso  on: account. 

	portfolio1 addAccountOrPortfolio: portfolio2 .
	portfolio2 addAccountOrPortfolio: account .

	
	self assert: portfolio1 checkForTransaction.
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:46:30'!
test08PortfolioKnowsTransactionsOfInternalAccount
	
	|portfolio  account |
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	Deposit register: 10 * peso  on: account. 

	portfolio addAccountOrPortfolio: account .
	
	self assert: (portfolio checkAccountTransactions: account) equals: account transactions.
	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:48:45'!
test09PortfolioRisesAnErrorIfAskedForTransactionsOfNonInternalAccount
	
	|portfolio  account |
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	Deposit register: 10 * peso  on: account. 

	
	self 
		should: [portfolio checkAccountTransactions: account]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio AccountIsNotInPortfolioErrorDescription ].	! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 16:19:07'!
test10PortfolioKnowsAllTransactionsOfAnInternalAccount

	|portfolio  account  transaction|
	
	account := ReceptiveAccount new.
	portfolio  := Portfolio new.
	
	transaction := Deposit register: 10 * peso  on: account. 

	
	portfolio addAccountOrPortfolio: account.
	
	self assert: portfolio transactions equals: account transactions .! !

!PortfolioTests methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 16:19:28'!
test11PortfolioKnowsAllTransactionsOfAllInternalAccounts

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


!classDefinition: #TransferenceBetweenAccountsTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceBetweenAccountsTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccountsTests methodsFor: 'tests' stamp: 'IE 7/3/2021 19:42:43'!
test01AnyAmountOfPesosTransferenceCanBeMade

	| accountA accountB transference amount |
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	amount := 20 * peso.
	transference := TransferenceBetweenAccounts fromAccount: accountA toAccount: accountB withAmount: amount.
	self assert: transference getAmount equals: amount.
	self deny: (transference getAmount isEqualTo: 10*peso).! !

!TransferenceBetweenAccountsTests methodsFor: 'tests' stamp: 'IE 7/3/2021 19:15:06'!
test03EmittingAccountSuffersAccordingWithdrawalAfterTransference

	| accountA accountB transference amount deposit |
	
	amount := 50 * peso.
	accountA := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	transference := TransferenceBetweenAccounts fromAccount: accountA toAccount: accountB withAmount: amount.
	self assert: 0 * peso equals: accountA balance.
	! !

!TransferenceBetweenAccountsTests methodsFor: 'tests' stamp: 'IE 7/3/2021 18:49:00'!
test05ReceivingAccountSuffersAccordingDepositAfterTransference

	| accountA accountB transference amount deposit |
	
	amount := 50 * peso.
	accountA := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	transference := TransferenceBetweenAccounts fromAccount: accountA toAccount: accountB withAmount: amount.
	self assert: 50 * peso equals: accountB balance.
	! !

!TransferenceBetweenAccountsTests methodsFor: 'tests' stamp: 'IE 7/3/2021 19:38:40'!
test07EmittingAccountWithdrawalKnowsItsCounterPart

	| accountA accountB transference amount deposit |
	
	amount := 50 * peso.
	accountA := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	transference := TransferenceBetweenAccounts fromAccount: accountA toAccount: accountB withAmount: amount.
	self assert: accountA lastTransaction counterPart equals: accountB lastTransaction.! !

!TransferenceBetweenAccountsTests methodsFor: 'tests' stamp: 'IE 7/3/2021 19:39:06'!
test08ReceivingAccountDepositKnowsItsCounterPart

	| accountA accountB transference amount deposit |
	
	amount := 50 * peso.
	accountA := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: accountA.
	accountB := ReceptiveAccount new.
	
	transference := TransferenceBetweenAccounts fromAccount: accountA toAccount: accountB withAmount: amount.
	self assert: accountA lastTransaction counterPart equals: accountB lastTransaction.! !


!classDefinition: #TransferenceTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTests methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 19:38:59'!
test01
	| accountA accountB transference |
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	transference := Transference register: 100 * peso from: accountA to: accountB.
	
	self assert: transference value.! !


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


!classDefinition: #DepositForTransferences category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositForTransferences
	instanceVariableNames: 'value counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositForTransferences methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:37:21'!
addCounterPart: aCounterPart

	counterPart := aCounterPart.! !

!DepositForTransferences methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:38:00'!
addToBalance

	^ value! !

!DepositForTransferences methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:40:26'!
counterPart

	^counterPart.! !

!DepositForTransferences methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:40:40'!
initializeFor: aValue

	value := aValue ! !

!DepositForTransferences methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:40:49'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositForTransferences class' category: 'ServiciosFinancieros-Ejercicio'!
DepositForTransferences class
	instanceVariableNames: ''!

!DepositForTransferences class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:41:21'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value counterPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'IE 7/3/2021 16:28:26'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'IE 7/3/2021 19:34:54'!
addCounterPart: aCounterPart

	counterPart := aCounterPart.! !

!Withdraw methodsFor: 'value' stamp: 'IE 7/3/2021 16:33:52'!
addToBalance

	^ (-1)*value! !

!Withdraw methodsFor: 'value' stamp: 'IE 7/3/2021 19:35:20'!
counterPart

	^counterPart.! !

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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'items parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:14:49'!
addAccountOrPortfolio: anAccountOrPortfolio
	|newItemAlreadyInParent newItemAlreadyInSelf index|
	newItemAlreadyInParent := false.
	newItemAlreadyInSelf := false.
	index := 1.
	
	(parents isEmpty) ifFalse:[	
		[newItemAlreadyInParent or: (index > parents size)] whileFalse: [ 
			newItemAlreadyInParent := (parents at: index) checkIfItemIsAlreadyInPortfolio: anAccountOrPortfolio .
			index := index + 1.
			
			]
		].
	index := 1.
	
	(anAccountOrPortfolio isKindOf: Portfolio) ifTrue: [
	(items isEmpty) ifFalse:[
		[newItemAlreadyInSelf or: (index > items size)] whileFalse:[
			newItemAlreadyInSelf := anAccountOrPortfolio checkIfItemIsAlreadyInPortfolio: (items at: index) .
			index := index + 1.
			
			]
		]].
	
	
	(anAccountOrPortfolio == self) ifFalse: [
		
	(newItemAlreadyInParent or: newItemAlreadyInSelf )ifFalse: [
		
	(self checkIfItemIsAlreadyInPortfolio: anAccountOrPortfolio) ifFalse: [	items add: anAccountOrPortfolio.
	
	(anAccountOrPortfolio isKindOf: Portfolio) ifTrue: [anAccountOrPortfolio addParent: self ].]]
	
].


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

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:45:04'!
checkAccountTransactions: anAccount
	
	(self checkIfItemIsAlreadyInPortfolio: anAccount ) ifFalse: [^self error: self class AccountIsNotInPortfolioErrorDescription ].
	
	^anAccount transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:20:43'!
checkForTransaction
|anAccount|
	1 to: items size do: [ : index |
		
		anAccount := items at: index.
		
		anAccount checkForTransaction ifTrue: [^true]
		
		].
	
	^false.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 17:04:07'!
checkIfItemIsAlreadyInPortfolio: anItem
	|portfolioItem|
	
	1 to: items size do: [ :index |
		portfolioItem := items at: index.
		portfolioItem == anItem ifTrue: [^true].
		(portfolioItem isKindOf: Portfolio) ifTrue: [(portfolioItem checkIfItemIsAlreadyInPortfolio: anItem) ifTrue: [^true]].
		
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

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MF 7/7/2021 15:43:51'!
AccountIsNotInPortfolioErrorDescription

	^'Account is not Portfolio'.! !


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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #TransferenceBetweenAccounts category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceBetweenAccounts
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:43:12'!
getAmount 

	^amount.! !

!TransferenceBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 20:41:04'!
initializeWithAccountToWithdraw: anAccountToWithdraw andAccountToDeposit: anAccountToDeposit withAmount: anAmount
	
	|depositTransaction withdrawTransaction |
	 
	amount := anAmount.
	withdrawTransaction := Withdraw register: anAmount on: anAccountToWithdraw.
	depositTransaction := DepositForTransferences register: anAmount on: anAccountToDeposit.
	depositTransaction addCounterPart: withdrawTransaction.
	withdrawTransaction addCounterPart: depositTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceBetweenAccounts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceBetweenAccounts class
	instanceVariableNames: ''!

!TransferenceBetweenAccounts class methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 17:32:43'!
fromAccount: accountToWithdraw toAccount: accountToDeposit withAmount: amount

	^TransferenceBetweenAccounts new initializeWithAccountToWithdraw: accountToWithdraw andAccountToDeposit: accountToDeposit withAmount: amount.! !
