!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IE 7/22/2021 17:58:47'!
test01MarsRoverLoggerLogsChangeInPositionMovingForward

	| marsRover result marsRoverLogger |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverLogger := MarsRoverLogger new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverLogger.
	
	marsRover processCommands: 'f'.
	
	result add: '0@1'.
	
	self assert: marsRoverLogger log equals: result.! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IE 7/22/2021 17:59:08'!
test02MarsRoverLoggerLogsChangeInPositionMovingBackwards

	| marsRover result marsRoverLogger |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverLogger := MarsRoverLogger new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverLogger.
	marsRover processCommands: 'b'.
	
	result add: '0@-1'.
	
	self assert: marsRoverLogger log equals: result.! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IE 7/22/2021 18:00:29'!
test03MarsRoverLoggerLogsChangeInDirectionTurningRight

	| marsRover result marsRoverLogger |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	result := OrderedCollection new.
	marsRoverLogger := MarsRoverLogger new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverLogger.
	marsRover addDirectionObserver: marsRoverLogger.
	
	marsRover processCommands: 'bfffr'.

	result add: '0@-1'.
	result add: '0@0'.
	result add: '0@1'.
	result add: '0@2'.
	result add: 'East'.
	
	self assert: marsRoverLogger log equals: result.! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IE 7/22/2021 18:01:15'!
test04MarsRoverLoggerLogsChangeInDirectionTurningLeft

	| marsRover result marsRoverLogger |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverLogger := MarsRoverLogger new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverLogger.
	marsRover addDirectionObserver: marsRoverLogger.
	
	marsRover processCommands: 'bfffrrl'.
	
	result add: '0@-1'.
	result add: '0@0'.
	result add: '0@1'.
	result add: '0@2'.
	result add: 'East'.
	result add: 'South'.
	result add: 'East'.
	
	self assert: marsRoverLogger log equals: result.! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IE 7/22/2021 18:10:37'!
test05MarsRoverLoggerCanLogOnlyChangesInPosition

	| marsRover result marsRoverLogger |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	result := OrderedCollection new.
	marsRoverLogger := MarsRoverLogger new.
	
	marsRover addPositionObserver: marsRoverLogger.
	marsRover processCommands: 'bfffrrl'.
	
	result add: '0@-1'.
	result add: '0@0'.
	result add: '0@1'.
	result add: '0@2'.
	
	self assert: marsRoverLogger log equals: result.! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'IE 7/22/2021 18:04:13'!
test06MarsRoverLoggerCanLogOnlyChangesInDirection

	| marsRover result marsRoverLogger |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	result := OrderedCollection new.
	marsRoverLogger := MarsRoverLogger new.
	
	marsRover addDirectionObserver: marsRoverLogger.
	marsRover processCommands: 'bfffrrlll'.
	
	result add: 'East'.
	result add: 'South'.
	result add: 'East'.
	result add: 'North'.
	result add: 'West'.
	
	self assert: marsRoverLogger log equals: result.! !


!classDefinition: #TestMarsRoverWindow category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IE 7/22/2021 18:05:41'!
test01MarsRoverStatusWindowShowsChangeInPositionMovingForward

	| marsRover result marsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverStatusWindow := MarsRoverStatusWindow new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverStatusWindow.
	
	marsRover processCommands: 'f'.
	
	result add: '0@1'.
	
	self assert: marsRoverStatusWindow status equals: result.

	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IE 7/22/2021 18:05:59'!
test02MarsRoverStatusWindowShowsChangeInPositionMovingBackwards

	| marsRover result marsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverStatusWindow := MarsRoverStatusWindow new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverStatusWindow.
	
	marsRover processCommands: 'bb'.
	
	result add: '0@-2'.
	
	self assert: marsRoverStatusWindow status equals: result.

	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IE 7/22/2021 18:12:15'!
test03MarsRoverStatusWindowShowsChangeInDirectionTurningLeft

	| marsRover result marsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverStatusWindow := MarsRoverStatusWindow new.
	result := OrderedCollection new.
	
	marsRover addDirectionObserver: marsRoverStatusWindow.
	
	marsRover processCommands: 'l'.
	
	result add: 'West'.
	
	self assert: marsRoverStatusWindow status equals: result.

	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IE 7/22/2021 18:14:59'!
test04MarsRoverStatusWindowShowsChangeInDirectionTurningRight

	| marsRover result marsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverStatusWindow := MarsRoverStatusWindow new.
	result := OrderedCollection new.
	
	marsRover addDirectionObserver: marsRoverStatusWindow.

	marsRover processCommands: 'r'.
	
	result add: 'East'.
	
	self assert: marsRoverStatusWindow status equals: result.

	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IE 7/22/2021 18:16:51'!
test05MarsRoverStatusWindowCanShowOnlyChangesInDirection

	| marsRover result marsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverStatusWindow := MarsRoverStatusWindow new.
	result := OrderedCollection new.
	
	marsRover addDirectionObserver: marsRoverStatusWindow.

	marsRover processCommands: 'frflll'.
	
	result add: 'South'.
	
	self assert: marsRoverStatusWindow status equals: result.

	! !

!TestMarsRoverWindow methodsFor: 'tests' stamp: 'IE 7/22/2021 18:17:34'!
test06MarsRoverStatusWindowCanShowOnlyChangesInPosition

	| marsRover result marsRoverStatusWindow |
	marsRover := MarsRover startingAt: 0@0 heading: 'North'.
	marsRoverStatusWindow := MarsRoverStatusWindow new.
	result := OrderedCollection new.
	
	marsRover addPositionObserver: marsRoverStatusWindow.

	marsRover processCommands: 'frflll'.
	
	result add: '1@1'.
	
	self assert: marsRoverStatusWindow status equals: result.

	! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head directionObservers positionObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'IE 7/22/2021 15:50:10'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	directionObservers := OrderedCollection new.
	positionObservers := OrderedCollection new.
! !


!MarsRover methodsFor: 'process commands' stamp: 'IE 7/18/2021 21:40:30'!
processCommands: aStringWithCommands

	

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'IE 7/18/2021 21:42:22'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'IE 7/22/2021 15:52:53'!
move: coordinates

	position := position + coordinates.
	self positionChange.
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IE 7/22/2021 15:56:57'!
moveDown

	self move: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IE 7/21/2021 19:20:35'!
moveLeft

	self move: (-1@0).
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IE 7/21/2021 19:20:47'!
moveRight

	self move: (1@0).
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'IE 7/21/2021 19:20:56'!
moveUp

	self move: (0@1).
! !


!MarsRover methodsFor: 'dd - heading' stamp: 'IE 7/21/2021 19:28:35'!
head: newHead

	head := newHead.
	self headChange.
	
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IE 7/21/2021 20:01:02'!
headEast

	self head: (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IE 7/21/2021 19:27:30'!
headNorth

	self head: (MarsRoverHeadFacingNorth of: self).
	
	! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IE 7/21/2021 20:01:11'!
headSouth

	self head: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'IE 7/21/2021 20:01:19'!
headWest

	self head: (MarsRoverHeadFacingWest of: self).! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 15:55:18'!
addDirectionObserver: aDirectionObserver

	directionObservers add: aDirectionObserver.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 15:54:53'!
addPositionObserver: aPositionObserver

	positionObservers add: aPositionObserver.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 18:31:10'!
headChange

	self notifyObservers: directionObservers ofChangeIn: head using: #updateDirection:.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 18:28:50'!
notifyObservers: aGroupOfObservers ofChangeIn: aChange using: aMessage

	aGroupOfObservers do: [:anObserver |
		aMessage sendTo: anObserver with: aChange.
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 18:29:58'!
positionChange

	self notifyObservers: positionObservers ofChangeIn: position using: #updatePosition:.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'IE 7/19/2021 21:12:58'!
initialize

	log := OrderedCollection new.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'IE 7/19/2021 21:11:42'!
log

	^log.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 17:40:26'!
updateDirection: anUpdate

	(anUpdate isKindOf: MarsRoverHeadFacingEast ) ifTrue: [log add: 'East'].
	(anUpdate isKindOf: MarsRoverHeadFacingWest ) ifTrue: [log add: 'West'].
	(anUpdate isKindOf: MarsRoverHeadFacingNorth ) ifTrue: [log add: 'North'].	
	(anUpdate isKindOf: MarsRoverHeadFacingSouth ) ifTrue: [log add: 'South'].! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 16:01:09'!
updatePosition: anUpdate


	log add: anUpdate asString.! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'actualPosition actualDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 16:16:17'!
status
	| status | 
	status := OrderedCollection new.
	actualPosition ifNotNil: [status add: actualPosition].
	actualDirection ifNotNil: [status add: actualDirection].
	^status.! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 16:03:03'!
updateDirection: aDirection

	(aDirection isKindOf: MarsRoverHeadFacingEast ) ifTrue: [actualDirection := 'East'].
	(aDirection isKindOf: MarsRoverHeadFacingWest ) ifTrue: [actualDirection := 'West'].
	(aDirection isKindOf: MarsRoverHeadFacingNorth ) ifTrue: [actualDirection := 'North'].	
	(aDirection isKindOf: MarsRoverHeadFacingSouth ) ifTrue: [actualDirection := 'South'].! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'IE 7/22/2021 16:03:27'!
updatePosition: aPosition

	actualPosition := aPosition asString.! !
