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
	instanceVariableNames: 'value counterPart'
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


!Deposit methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:33:53'!
addCounterPart: aCounterPart

	counterPart := aCounterPart.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:25:20'!
counterPart

	^counterPart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceBetweenAccounts category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceBetweenAccounts
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:43:12'!
getAmount 

	^amount.! !

!TransferenceBetweenAccounts methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:36:09'!
initializeWithAccountToWithdraw: anAccountToWithdraw andAccountToDeposit: anAccountToDeposit withAmount: anAmount
	
	|depositTransaction withdrawTransaction |
	 
	amount := anAmount.
	withdrawTransaction := Withdraw register: anAmount on: anAccountToWithdraw.
	depositTransaction := Deposit register: anAmount on: anAccountToDeposit.
	depositTransaction addCounterPart: withdrawTransaction.
	withdrawTransaction addCounterPart: depositTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceBetweenAccounts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceBetweenAccounts class
	instanceVariableNames: ''!

!TransferenceBetweenAccounts class methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 17:32:43'!
fromAccount: accountToWithdraw toAccount: accountToDeposit withAmount: amount

	^TransferenceBetweenAccounts new initializeWithAccountToWithdraw: accountToWithdraw andAccountToDeposit: accountToDeposit withAmount: amount.! !


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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'IE 7/3/2021 19:24:39'!
lastTransaction

	^self transactions last.! !
