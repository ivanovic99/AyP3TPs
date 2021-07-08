!classDefinition: #PortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: 'portfolioA portfolioB account1 account2 portfolio account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:01:21'!
test01PortfolioKnowsBalanceOfItsAccount
	
	
	Deposit register: 10 * peso  on: account. 
	
	portfolio addAccountOrPortfolio: account.
	
	self assert: portfolio balance equals: 10 * peso.
	self deny: (portfolio balance isEqualTo: 5 * peso).

	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:02:29'!
test02PortfolioKnowsBalanceOfItsManyAccounts
	
	
	account1 := ReceptiveAccount new.	
	account2 := ReceptiveAccount new.	

	Deposit register: 20 * peso  on: account1. 
	Deposit register: 30 * peso on: account2.
	portfolio  := Portfolio new.
	
	portfolio addAccountOrPortfolio: account1.
	portfolio addAccountOrPortfolio: account2.

	self assert: portfolio balance equals: 50 * peso.
	self deny: (portfolio balance isEqualTo: 5 * peso).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:05:11'!
test03PortfolioKnowsBalanceOfInternalAccountsAndPortfolios

	Deposit register: 20 * peso  on: account. 
	Deposit register: 30 * peso on: account1.
	Deposit register: 40 * peso on: account2.
	
	portfolioA addAccountOrPortfolio: account.
	portfolioB addAccountOrPortfolio: account1.
	
	portfolioB addAccountOrPortfolio: portfolioA.
	portfolioB addAccountOrPortfolio: account2.

	self assert: portfolioB balance equals: 90 * peso.
	self deny: (portfolioB balance isEqualTo: 5 * peso).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:06:04'!
test04PortfolioCanCheckForAccountTransactions
	
	Deposit register: 10 * peso  on: account1. 
	
	portfolioA addAccountOrPortfolio: account1.
	portfolioB addAccountOrPortfolio: account2.
	
	self assert: portfolioA checkForTransaction.
	self deny: portfolioB checkForTransaction.

	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:06:49'!
test05PortfolioCanCheckForAParticularAccountTransaction
	
	|transaction transactionB|
	
	transaction := Deposit register: 10 * peso  on: account1. 
	transactionB := Deposit register: 10 * peso  on: account2. 
	
	portfolio addAccountOrPortfolio: account1.
	
	self assert: (portfolio hasRegistered: transaction).
	self deny: (portfolio hasRegistered: transactionB ).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:07:20'!
test06PortfolioCanCheckForPortfolioTransactions

	Deposit register: 10 * peso  on: account. 

	portfolioA addAccountOrPortfolio: portfolioB .
	portfolioB addAccountOrPortfolio: account .
	
	self assert: portfolioA checkForTransaction.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:07:37'!
test07PortfolioKnowsTransactionsOfInternalAccount
	
	Deposit register: 10 * peso  on: account. 

	portfolio addAccountOrPortfolio: account .
	
	self assert: (portfolio getAccountTransactions: account) equals: account transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:07:56'!
test08PortfolioRisesAnErrorIfAskedForTransactionsOfNonInternalAccount
	
	Deposit register: 10 * peso  on: account. 
	
	self 
		should: [portfolio getAccountTransactions: account]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio accountIsNotInPortfolioErrorDescription ].	! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:08:40'!
test09PortfolioKnowsAllTransactionsOfAnInternalAccount

	Deposit register: 10 * peso  on: account. 
	
	portfolio addAccountOrPortfolio: account.
	
	self assert: portfolio transactions equals: account transactions .! !

!PortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:09:25'!
test10PortfolioKnowsAllTransactionsOfAllInternalAccounts

	|transactionA transactionB allTransactions|
	
	transactionA := Deposit register: 10 * peso  on: account1. 
	transactionB := Deposit register: 20 * peso  on: account2. 
	
	allTransactions := OrderedCollection new.
	allTransactions add: transactionA .
	allTransactions add: transactionB .
	
	portfolio addAccountOrPortfolio: account1.
	portfolio addAccountOrPortfolio: account2.
	
	self assert: portfolio transactions equals: allTransactions .! !


!PortfolioTests methodsFor: 'setup' stamp: 'MF 7/8/2021 17:01:06'!
setUp
	
	portfolio := Portfolio new.
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.
	
	account := ReceptiveAccount new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.! !


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
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTests methodsFor: 'tests' stamp: 'MF 7/8/2021 16:51:45'!
test01AnyAmountOfPesosTransferenceCanBeMade

	|  transference amount |
	
	amount := 20 * peso.
	transference := Transference register: amount from: account1 to: account2.
	self assert: transference value equals: amount.
	self deny: (transference value isEqualTo: 10*peso).! !

!TransferenceTests methodsFor: 'tests' stamp: 'MF 7/8/2021 16:52:32'!
test02EmittingAccountSuffersAccordingWithdrawalAfterTransference
	
	Deposit register: 50 * peso on: account1.
	
	Transference register: 50 * peso  from: account1 to: account2.
	self assert: 0 * peso equals: account1 balance.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:09:40'!
test03ReceivingAccountSuffersAccordingDepositAfterTransference
	
	Deposit register: 50 * peso on: account1.
	
	Transference register: 50 * peso from: account1 to: account2.
	self assert: 50 * peso equals: account2 balance.
	! !

!TransferenceTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:30:25'!
test04EmittingAccountWithdrawalKnowsItsCounterPart

	Deposit register: 50 * peso on: account1.
	
	Transference register: 50 * peso from: account1 to: account2.
	self assert: account1 lastTransaction counterPart equals: account2 lastTransaction.
	
	Deposit register: 10 * peso on: account2.
	self deny: (account1 lastTransaction counterPart isEqualTo: account2 lastTransaction).

! !

!TransferenceTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:33:59'!
test05ReceivingAccountDepositKnowsItsCounterPart
	
	Deposit register: 50 * peso on: account1.
	
	Transference register: 50 * peso from: account1 to: account2.
	
	self assert: account2 lastTransaction counterPart equals: account1 lastTransaction.
	
	Deposit register: 10 * peso on: account1.
	self deny: (account2 lastTransaction counterPart isEqualTo: account1 lastTransaction).! !


!TransferenceTests methodsFor: 'setup' stamp: 'MF 7/8/2021 16:50:42'!
setUp
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
! !


!classDefinition: #ValidPortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ValidPortfolioTests
	instanceVariableNames: 'portfolioA portfolioB account1 account2 portfolioC'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ValidPortfolioTests methodsFor: 'setup' stamp: 'MF 7/8/2021 17:13:44'!
setUp
	
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.
	portfolioC := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.! !


!ValidPortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:12:34'!
test01PortfolioCannotStoreSameAccountTwice
	
	portfolioA addAccountOrPortfolio: account1.
	
	self 
		should: [portfolioA addAccountOrPortfolio: account1]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountThatPortfolioAlreadyIncludes ].	
	
	
! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:12:26'!
test02PortfolioCannotStoreAnAccountThatIsAlreadyInAnInternalPortfolio
	
	"Agrego la cuenta al ptf2, y este al ptf1, luego intento agregar cuenta a ptf1"
	portfolioB addAccountOrPortfolio: account1.
	portfolioA addAccountOrPortfolio: portfolioB.
	
	self 
		should: [portfolioA addAccountOrPortfolio: account1.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountThatPortfolioAlreadyIncludes ].	
	

! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:12:54'!
test03PortfolioCannotStoreItself
	
	portfolioA  := Portfolio new.
	
	self 
		should: [portfolioA addAccountOrPortfolio: portfolioA.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreSelfErrorDescription ].	! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:13:21'!
test04PortfolioCannotStoreAccountIfAccountIsItemtOfPortfolioParent
	
	portfolioA addAccountOrPortfolio: account1.
	portfolioA addAccountOrPortfolio: portfolioB.

	
	self 
		should: [portfolioB addAccountOrPortfolio: account1.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountIncludedInAParentPortfolioErrorDescription ].	
! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:14:31'!
test05PortfolioCannotStoreAnyAccountIfAnyAccountIsItemtOfAnyPortfolioParent

	"agrego cuentas a pf1 y pf2"
	portfolioA addAccountOrPortfolio: account1.
	portfolioB addAccountOrPortfolio: account2.
	
	"agrego pf3 a pf1 y pf2"
	portfolioA addAccountOrPortfolio: portfolioC.
	portfolioB addAccountOrPortfolio: portfolioC.
		

	self 
		should: [portfolioC addAccountOrPortfolio: account1.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountIncludedInAParentPortfolioErrorDescription ].	

	self 
		should: [portfolioC addAccountOrPortfolio: account2.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStoreAccountIncludedInAParentPortfolioErrorDescription ].	! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'MF 7/8/2021 17:15:04'!
test06PortfolioCannotStorePortfolioIfBothIncludeTheSameAccount

	"agrego cuenta a pf1 y pf2"
	portfolioA addAccountOrPortfolio: account1.
	portfolioB addAccountOrPortfolio: account1.
	
	"agrego pf2 a pf1 "
	
	self 
		should: [portfolioA addAccountOrPortfolio: portfolioB.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio cannotStorePortfolioSharingAccountWithMeErrorDescription ].	
	
! !


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


!classDefinition: #AccountType category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:36:39'!
addParent: aParentPortfolio
 	self subclassResponsibility.! !

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:38:25'!
balance
 	self subclassResponsibility.! !

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:36:54'!
checkForTransaction
 	self subclassResponsibility.! !

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:37:08'!
checkIfItemIsAlreadyInPortfolio: anItem
 	self subclassResponsibility.! !

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:39:11'!
hasRegistered: aTransaction
 	self subclassResponsibility.! !

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:37:25'!
lookForAllTheItemsOf: collectionToGoThrough in: anAccountOrPortfolio andIfOneIsFoundThrow: anError
 	self subclassResponsibility.! !

!AccountType methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 17:40:17'!
transactions 
 	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
AccountType subclass: #Portfolio
	instanceVariableNames: 'items parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:23:49'!
addAccountOrPortfolio: anAccountOrPortfolio
	
	self checkIfItsValidToAdd: anAccountOrPortfolio .
	
	items add: anAccountOrPortfolio.
	
	anAccountOrPortfolio addParent: self.
	
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 15:56:02'!
addParent: aParentPortfolio
	parents add: aParentPortfolio .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 16:20:43'!
balance

	^items sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 13:57:41'!
checkForTransaction
	items do: [:each | 
		each checkForTransaction ifTrue: [^true].
		].
	^false.
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:24:19'!
checkIfItemIsAlreadyInPortfolio: anItem
	items do: [ :portfolioItem|
		(portfolioItem == anItem or: (portfolioItem checkIfItemIsAlreadyInPortfolio: anItem)) ifTrue: [^true].
		].
	^false
		
		! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:47:37'!
checkIfItsValidToAdd: anAccountOrPortfolio

	self lookInMyParentsFor: anAccountOrPortfolio andIfItsFoundThrow: [self error: self class cannotStoreAccountIncludedInAParentPortfolioErrorDescription].
	
	self lookForEachOfMyItemsIn: anAccountOrPortfolio andIfOneIsFoundThrow: [self error: self class cannotStorePortfolioSharingAccountWithMeErrorDescription].

	(anAccountOrPortfolio == self) ifTrue: [self error: self class cannotStoreSelfErrorDescription ].
	
	(self checkIfItemIsAlreadyInPortfolio: anAccountOrPortfolio) ifTrue: [	self error: self class cannotStoreAccountThatPortfolioAlreadyIncludes ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 15:57:43'!
getAccountTransactions: anAccount
	
	(self checkIfItemIsAlreadyInPortfolio: anAccount ) ifFalse: [^self error: self class accountIsNotInPortfolioErrorDescription ].
	
	^anAccount transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 13:57:03'!
hasRegistered: aTransaction
	items do: [:each | 
		(each hasRegistered: aTransaction) ifTrue: [^true].
		].
	^false.
	
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2021 18:10:23'!
initialize
	items := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:45:07'!
lookForEachOfMyItemsIn: anAccountOrPortfolio andIfOneIsFoundThrow: anError

	items do: [ :each|
		(anAccountOrPortfolio  checkIfItemIsAlreadyInPortfolio: each) ifTrue: anError ].
	
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:47:15'!
lookInMyParentsFor: anAccountOrPortfolio andIfItsFoundThrow: anError

	parents do: [ :each |
		(each checkIfItemIsAlreadyInPortfolio: anAccountOrPortfolio) ifTrue: anError .]

! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:05:49'!
transactions
	|allTransactions|
	allTransactions := OrderedCollection  new.
	 items do: [: each|
		allTransactions addAllLast: (each transactions).			
		].
	^allTransactions .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:03:40'!
accountIsNotInPortfolioErrorDescription

	^'Account is not Portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:07:39'!
cannotStoreAccountIncludedInAParentPortfolioErrorDescription

	^'Portfolio cannot store account included in one of its parents'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:17:13'!
cannotStoreAccountThatPortfolioAlreadyIncludes
	^'Portfolio cannot store an account it already includes'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:14:40'!
cannotStorePortfolioSharingAccountWithMeErrorDescription
	^'Portfolio cannot store another Portfolio when they both share account'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'IE 7/7/2021 23:09:28'!
cannotStoreSelfErrorDescription

	^'Portfolio cannot store itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
AccountType subclass: #ReceptiveAccount
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:26:20'!
addParent: aParentPortfolio
	"Solamente definido para polimorfismo y para modelar el Composite"! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MF 7/5/2021 21:31:44'!
checkForTransaction

	^transactions isEmpty not.
	
! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:27:10'!
checkIfItemIsAlreadyInPortfolio: anItem
	"Solamente definido para polimorfismo y para modelar el Composite"
	^false.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:24:39'!
lastTransaction

	^self transactions last.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'MF 7/8/2021 16:26:03'!
lookForAllTheItemsOf: collectionToGoThrough in: anAccountOrPortfolio andIfOneIsFoundThrow: anError
	"Solamente definido para polimorfismo y para modelar el Composite"! !


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
