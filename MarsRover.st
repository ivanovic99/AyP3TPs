!classDefinition: #TestsMarsRover category: 'MarsRover'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestsMarsRover methodsFor: 'setup' stamp: 'MF 6/30/2021 18:43:35'!
setUp
	marsRover := 	MarsRover createMarsRoverInCoordinates: 0@0 pointingToCardinalPoint: 'North'. 
! !


!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:48:47'!
test01MarsRoverDoesntMoveIfCommandSequenceIsEmpty
	self assert: (marsRover isInCoordinates: (0@0)).
	
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:48:58'!
test02MarsRoverMovesForwardIfCommandSequenceIsF
	marsRover recieveAndExecuteCommandSequence: 'f'.
	self assert: (marsRover isInCoordinates: 0@1).
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:07'!
test03MarsRoverMovesForwardAndBackwardIfCommandSequenceIsFB
	marsRover recieveAndExecuteCommandSequence: 'fb'.
	self assert: (marsRover isInCoordinates: 0@0).
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:14'!
test04MarsRoverTurnsLeft
	marsRover recieveAndExecuteCommandSequence: 'l'.
	self assert: (marsRover isPointingToCardinalPoint: 'West').
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:20'!
test05MarsRoverTurnsRight
	marsRover recieveAndExecuteCommandSequence: 'r'.
	self assert: (marsRover isPointingToCardinalPoint: 'East').
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:26'!
test06MarsRoverExecutesMultipleCommandsCorrectly
	marsRover recieveAndExecuteCommandSequence: 'frfflbb'.
	self assert: ((marsRover isPointingToCardinalPoint: 'North') and: (marsRover isInCoordinates: (2@-1))).
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:34'!
test07MarsRoverMovesDiagonally
	marsRover recieveAndExecuteCommandSequence: 'lfrflfrf'.
	self assert: ((marsRover isPointingToCardinalPoint: 'North') and: (marsRover isInCoordinates: (-2@2))).
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:42'!
test08MarsRoverExecutesMultipleCommandsAndFailsOnInvalidCommand
	self
		should: [ marsRover recieveAndExecuteCommandSequence: 'llffrffxbr'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover marsRoverInvalidCommand.
			self assert: ((marsRover isPointingToCardinalPoint: 'West') and: (marsRover isInCoordinates: (-2@-2))) 
			].
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'IE 6/30/2021 18:49:48'!
test09MarsRoverReturnsErrorWithInvalidDirection
	
	self
		should: [MarsRover createMarsRoverInCoordinates: 0@0 pointingToCardinalPoint: 'asd'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover marsRoverHeadError .
			].
! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordinates head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:15:18'!
checkCommand: aCharacter
	^MarsRoverCommand newWith: aCharacter .
	
	
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:03:21'!
executeCommand: aCommand
	aCommand executeOn: self
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:20:53'!
initializeWithCoordinates: aSetOfCoordinates andCardinalPoint: aCardinalPoint

	coordinates := aSetOfCoordinates.
	head := MarsRoverHead newWith: aCardinalPoint .
	 ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 6/29/2021 17:13:54'!
isInCoordinates: aSetOfCoordinates

	^(coordinates = aSetOfCoordinates). ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:54:45'!
isPointingToCardinalPoint: aCardinalPoint
	^head isPointingToCardinalPoint: aCardinalPoint.
	
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:03:42'!
moveBackwards

	coordinates := coordinates  + head moveMarsRoverBackwards.
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:03:49'!
moveForward

	coordinates := coordinates  + head moveMarsRoverForward.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:27:32'!
recieveAndExecuteCommandSequence: aCommandSequence 
	| aCharacter processedCommand |
		
	1 to: aCommandSequence size do: [:index|
		aCharacter := aCommandSequence at: index. 
		processedCommand  := self checkCommand: aCharacter.
		self executeCommand: processedCommand .
		].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:30:39'!
turnLeft

	head := head turnedLeft. ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:30:45'!
turnRight

	head := head turnedRight. 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:02:10'!
createMarsRoverInCoordinates: aSetOfCoordinates pointingToCardinalPoint: aCardinalPoint
	^MarsRover new initializeWithCoordinates: aSetOfCoordinates andCardinalPoint: aCardinalPoint.
	! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:42:43'!
marsRoverHeadError
	^'Invalid Direction for Mars Rover Head'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:02:59'!
marsRoverInvalidCommand

	^'Invalid Character for Mars Rover Command'.! !


!classDefinition: #MarsRoverCommand category: 'MarsRover'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRover'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:13:33'!
newWith: aCharacter
	^ (MarsRoverCommand allSubclasses detect:[:aClass | aClass isIdentifiedWith: aCharacter] ifNone: [^self error: MarsRover marsRoverInvalidCommand ]) new.
! !


!classDefinition: #Backwards category: 'MarsRover'!
MarsRoverCommand subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backwards methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:04:05'!
executeOn: aMarsRover
	aMarsRover moveBackwards .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'MarsRover'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:13:58'!
isIdentifiedWith: aCharacter
	^aCharacter  = $b.! !


!classDefinition: #Forward category: 'MarsRover'!
MarsRoverCommand subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:04:12'!
executeOn: aMarsRover
	aMarsRover moveForward .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:14:09'!
isIdentifiedWith: aCharacter
	^aCharacter  = $f.! !


!classDefinition: #Left category: 'MarsRover'!
MarsRoverCommand subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Left methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:31:37'!
executeOn: aMarsRover
	aMarsRover turnLeft .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:14:23'!
isIdentifiedWith: aCharacter
	^aCharacter  = $l.! !


!classDefinition: #Right category: 'MarsRover'!
MarsRoverCommand subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Right methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:04:30'!
executeOn: aMarsRover
	aMarsRover turnRight .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:14:37'!
isIdentifiedWith: aCharacter
	^aCharacter  = $r.! !


!classDefinition: #MarsRoverHead category: 'MarsRover'!
Object subclass: #MarsRoverHead
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:10:38'!
marsRoverHeadCanPointTo: aCardinalPoint
	self subclassResponsibility .! !

!MarsRoverHead class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:27:57'!
newWith: aCardinalPoint
	^(MarsRoverHead allSubclasses detect:[:aClass | aClass marsRoverHeadCanPointTo: aCardinalPoint] ifNone: [^self error: MarsRover marsRoverHeadError ]) new .
	
			
		
	! !


!classDefinition: #MarsRoverHeadPointingEast category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadPointingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadPointingEast methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:55:11'!
isPointingToCardinalPoint: aCardinalPoint
	^ aCardinalPoint = 'East'.! !

!MarsRoverHeadPointingEast methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:46:32'!
moveMarsRoverBackwards
	^(-1@0).! !

!MarsRoverHeadPointingEast methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:44:46'!
moveMarsRoverForward
	^(1@0).! !

!MarsRoverHeadPointingEast methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:31:00'!
turnedLeft
	^MarsRoverHeadPointingNorth new.! !

!MarsRoverHeadPointingEast methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:31:04'!
turnedRight
	^MarsRoverHeadPointingSouth new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadPointingEast class' category: 'MarsRover'!
MarsRoverHeadPointingEast class
	instanceVariableNames: ''!

!MarsRoverHeadPointingEast class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:11:14'!
marsRoverHeadCanPointTo: aCardinalPoint
	^aCardinalPoint = 'East'.! !


!classDefinition: #MarsRoverHeadPointingNorth category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadPointingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadPointingNorth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:55:21'!
isPointingToCardinalPoint: aCardinalPoint
	^ aCardinalPoint = 'North'.! !

!MarsRoverHeadPointingNorth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:47:35'!
moveMarsRoverBackwards
	^(0@-1).! !

!MarsRoverHeadPointingNorth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:40:14'!
moveMarsRoverForward
	^(0@1).! !

!MarsRoverHeadPointingNorth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:31:53'!
turnedLeft
	^MarsRoverHeadPointingWest new.! !

!MarsRoverHeadPointingNorth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:32:00'!
turnedRight
	^MarsRoverHeadPointingEast new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadPointingNorth class' category: 'MarsRover'!
MarsRoverHeadPointingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadPointingNorth class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:11:22'!
marsRoverHeadCanPointTo: aCardinalPoint
	^aCardinalPoint = 'North'.! !


!classDefinition: #MarsRoverHeadPointingSouth category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadPointingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadPointingSouth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:55:30'!
isPointingToCardinalPoint: aCardinalPoint
	^ aCardinalPoint = 'South'.! !

!MarsRoverHeadPointingSouth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:47:46'!
moveMarsRoverBackwards
	^(0@1).! !

!MarsRoverHeadPointingSouth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:45:05'!
moveMarsRoverForward
	^(0@-1).! !

!MarsRoverHeadPointingSouth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:32:12'!
turnedLeft
	^MarsRoverHeadPointingEast new.! !

!MarsRoverHeadPointingSouth methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:32:16'!
turnedRight
	^MarsRoverHeadPointingWest new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadPointingSouth class' category: 'MarsRover'!
MarsRoverHeadPointingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadPointingSouth class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:11:29'!
marsRoverHeadCanPointTo: aCardinalPoint
	^aCardinalPoint = 'South'.! !


!classDefinition: #MarsRoverHeadPointingWest category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadPointingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadPointingWest methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 17:55:47'!
isPointingToCardinalPoint: aCardinalPoint
	^ aCardinalPoint = 'West'.! !

!MarsRoverHeadPointingWest methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:47:57'!
moveMarsRoverBackwards
	^(1@0).! !

!MarsRoverHeadPointingWest methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 16:45:22'!
moveMarsRoverForward
	^(-1@0).! !

!MarsRoverHeadPointingWest methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:32:26'!
turnedLeft
	^MarsRoverHeadPointingSouth new.! !

!MarsRoverHeadPointingWest methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:32:30'!
turnedRight
	^MarsRoverHeadPointingNorth new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadPointingWest class' category: 'MarsRover'!
MarsRoverHeadPointingWest class
	instanceVariableNames: ''!

!MarsRoverHeadPointingWest class methodsFor: 'as yet unclassified' stamp: 'MF 6/30/2021 18:11:35'!
marsRoverHeadCanPointTo: aCardinalPoint
	^aCardinalPoint = 'West'.! !
