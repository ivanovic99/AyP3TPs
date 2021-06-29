!classDefinition: #TestsMarsRover category: 'MarsRover'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/29/2021 16:22:45'!
test01ReturnErrorIfCommandSequenceIsEmpty
	| marsRover  |
	
	marsRover := MarsRover createMarsRoverInCoordinates: 0@0 pointingToCardinalPoint: 'North'. "Hasta aca todo ok"
	self
		should: [ marsRover recieveAndExecuteCommandSequence: ''. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover marsRoverInvalidCommand ].
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/29/2021 17:01:04'!
test02MovesForwardIfCommandSequenceIsF
	| marsRover |
	
	marsRover := MarsRover createMarsRoverInCoordinates: 0@0 pointingToCardinalPoint: 'North'. 
	marsRover recieveAndExecuteCommandSequence: 'f'.
	self assert: (marsRover isInCoordinates: 0@1).
! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordinates cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 17:12:05'!
checkCommand: aCommand

	(aCommand = $f or: aCommand = $b or: aCommand = $i or: aCommand = $r) ifTrue: [^true].
	^self error: (self class marsRoverInvalidCommand).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 17:15:59'!
executeCommand: aCommand

	"((aCommand = 'f') or: (aCommand = 'b') or: (aCommand = 'i') or: (aCommand = 'r'))"
	(aCommand = $f) ifTrue: [self moveForward.].
	(aCommand = $b) ifTrue: [self moveBackward.].
	(aCommand = $i) ifTrue: [self turnLeft.].
	(aCommand = $r) ifTrue: [self turnRight.].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 15:52:40'!
initializeWithCoordinates: aSetOfCoordinates andCardinalPoint: aCardinalPoint

	coordinates := aSetOfCoordinates.
	cardinalPoint := aCardinalPoint.
	 ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 17:13:54'!
isInCoordinates: aSetOfCoordinates

	^(coordinates = aSetOfCoordinates). ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 17:16:35'!
moveForward

	"cardinalPoint isNorth"
	(cardinalPoint = 'North') ifTrue: [coordinates := coordinates + (0@1)].
	cardinalPoint = 'South' ifTrue: [coordinates := coordinates - (0@1)].
	cardinalPoint = 'East' ifTrue: [coordinates := coordinates + (1@0)].
	cardinalPoint = 'West' ifTrue: [coordinates := coordinates - (1@0)].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 16:20:48'!
recieveAndExecuteCommandSequence: aCommandSequence 
	| command |
	
	(aCommandSequence size = 0) ifTrue: [^self error: self class marsRoverInvalidCommand ].
	
	1 to: aCommandSequence size do: [:index|
		command := aCommandSequence at: index. 
		self checkCommand: command.
		self executeCommand: command.
		].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 15:53:59'!
createMarsRoverInCoordinates: aSetOfCoordinates pointingToCardinalPoint: aCardinalPoint
	| marsRover |
	
	marsRover := MarsRover new initializeWithCoordinates: aSetOfCoordinates andCardinalPoint: aCardinalPoint.
	^marsRover.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 15:55:45'!
marsRoverInvalidCommand

	^'ERROR: invalid command, execution aborted'.! !
