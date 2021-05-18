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

!CustomerBookTest methodsFor: 'helpers' stamp: 'IE 5/18/2021 20:07:42'!
canNotDo: block errorSent: error exceptionRised: exception

	block
		on: error
		do: exception.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IE 5/18/2021 20:07:45'!
newCustomerWithNameOrNil: customerName

	| customer |
	customer := CustomerBook new.
	customerName = nil ifFalse: [
		customer addCustomerNamed: customerName.
		].
	^customer.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IE 5/18/2021 20:07:37'!
numberOfActiveCoustumers: activeCostumers equalsTo: conditionActive numberOfSuspendedCostumers: suspendedCostumers equalsTo: conditionSuspended numberOfTotalCostumer: totalCostumers equalsTo: conditionTotal AndNotFails: block

	self
		assert: activeCostumers
		equals: conditionActive.
	self
		assert: suspendedCostumers
		equals: conditionSuspended.
	self
		assert: totalCostumers
		equals: conditionTotal.
		
	block value.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'IE 5/18/2021 20:07:53'!
timeNeededToRemoveOrAddACustomer: removeOrAdd

	^ removeOrAdd timeToRun.! !


!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:46:16'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customer timeNeededToAddACustomer |
	customer _ self newCustomerWithNameOrNil: nil.
	timeNeededToAddACustomer _ self timeNeededToRemoveOrAddACustomer: [ customer addCustomerNamed: 'Paul McCartney' ].
	self assert: timeNeededToAddACustomer < (50 * millisecond).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:47:49'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customer customerName timeNeededToRemoveACostumer |
	customerName _ 'Paul McCartney'.
	customer _ self newCustomerWithNameOrNil: customerName.
	timeNeededToRemoveACostumer _ self timeNeededToRemoveOrAddACustomer: [ customer removeCustomerNamed: customerName ].
	self assert: timeNeededToRemoveACostumer < (100 * millisecond).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:50:29'!
test03CanNotAddACustomerWithEmptyName

	| customer |
	customer _ self newCustomerWithNameOrNil: nil.
	self
		canNotDo: [
			customer addCustomerNamed: ''.
			self fail ]
		errorSent: Error
		exceptionRised: [ :arg |
			self assert: arg messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customer isEmpty ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:51:22'!
test04CanNotRemoveAnInvalidCustomer

	| customer customerName |
	customerName _ 'John Lennon'.
	customer _ self newCustomerWithNameOrNil:  customerName.
	self
		canNotDo: [
			customer removeCustomerNamed: 'Paul McCartney'.
			self fail ]
		errorSent: NotFound
		exceptionRised: [ :arg |
			self assert: customer numberOfCustomers = 1.
			self assert: (customer includesCustomerNamed: customerName) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:51:44'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customer customerName |
	customerName _ 'Paul McCartney'.
	customer _ self newCustomerWithNameOrNil: customerName.
	customer suspendCustomerNamed: customerName.
	self
		numberOfActiveCoustumers: 0
		equalsTo: customer numberOfActiveCustomers
		numberOfSuspendedCostumers: 1
		equalsTo: customer numberOfSuspendedCustomers
		numberOfTotalCostumer: 1
		equalsTo: customer numberOfCustomers
		AndNotFails: [ self assert: (customer includesCustomerNamed: customerName) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:52:01'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customer customerName |
	customerName _ 'Paul McCartney'.
	customer _ self newCustomerWithNameOrNil: customerName.
	customer suspendCustomerNamed: customerName.
	customer removeCustomerNamed: customerName.
	self
		numberOfActiveCoustumers: 0
		equalsTo: customer numberOfActiveCustomers
		numberOfSuspendedCostumers: 0
		equalsTo: customer numberOfSuspendedCustomers
		numberOfTotalCostumer: 0
		equalsTo: customer numberOfCustomers
		AndNotFails: [ self deny: (customer includesCustomerNamed: customerName) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:52:23'!
test07CanNotSuspendAnInvalidCustomer

	| customer customerName |
	customerName _ 'John Lennon'.
	customer _ self newCustomerWithNameOrNil: customerName.
	self
		canNotDo: [
			customer suspendCustomerNamed: 'Ringo Starr'.
			self fail ]
		errorSent: CantSuspend
		exceptionRised: [ :arg |
			self assert: customer numberOfCustomers = 1.
			self assert: (customer includesCustomerNamed: customerName) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IE 5/18/2021 19:52:43'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customer customerName |
	customerName _ 'John Lennon'.
	customer _ self newCustomerWithNameOrNil: customerName.
	customer suspendCustomerNamed: customerName.
	self
		canNotDo: [
			customer suspendCustomerNamed: customerName.
			self fail ]
		errorSent: CantSuspend
		exceptionRised: [ :arg |
			self assert: customer numberOfCustomers = 1.
			self assert: (customer includesCustomerNamed: customerName) ].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'IE 5/18/2021 20:04:05'!
addCustomerNamed: customerName

	self isEmptyAndItCanNotBeEmpty: customerName.
	(self includesCustomerNamed: customerName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: customerName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'IE 5/18/2021 20:03:31'!
removeCustomerNamed: customerName

	self isEmptyAndItCanNotBeEmpty: customerName.
	active remove: customerName ifAbsent: [
		suspended remove: customerName  ifAbsent: [^NotFound signal]
		].
	^customerName. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'IE 5/18/2021 19:54:28'!
suspendCustomerNamed: customerName 
	
	(active includes: customerName) ifFalse: [^CantSuspend signal].
	
	active remove: customerName.
	
	suspended add: customerName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'IE 5/18/2021 20:04:51'!
numberOfActiveCustomers

	^active size.! !

!CustomerBook methodsFor: 'accessing' stamp: 'IE 5/18/2021 18:38:59'!
numberOfCustomers
	
	^(self numberOfActiveCustomers) + (self numberOfSuspendedCustomers). ! !

!CustomerBook methodsFor: 'accessing' stamp: 'IE 5/18/2021 20:05:10'!
numberOfSuspendedCustomers

	^suspended size.! !


!CustomerBook methodsFor: 'testing' stamp: 'IE 5/18/2021 20:09:28'!
includesCustomerNamed: customerName

	^(active includes: customerName) or: [ suspended includes: customerName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !

!CustomerBook methodsFor: 'testing' stamp: 'IE 5/18/2021 20:03:05'!
isEmptyAndItCanNotBeEmpty: customerName

	customerName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

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
