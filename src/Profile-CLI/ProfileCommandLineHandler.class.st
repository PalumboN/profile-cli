Class {
	#name : #ProfileCommandLineHandler,
	#superclass : #TestCommandLineHandler,
	#category : #'Profile-CLI'
}

{ #category : #accessing }
ProfileCommandLineHandler class >> commandName [
	^ 'profile'
]

{ #category : #accessing }
ProfileCommandLineHandler class >> description [
	^ 'A command line runner to profile execution engines'
]

{ #category : #private }
ProfileCommandLineHandler >> inform: aString [
	"Do nothing"

	
]

{ #category : #private }
ProfileCommandLineHandler >> informResults: results [

	| result |
	(self hasOption: 'closure-value-hits') ifTrue: [
		result := ClosureValueProfiler instance hits ].

	(self hasOption: 'jit-compile-time') ifTrue: [
		result := Smalltalk vm totalJITCompileTime ].

	(self hasOption: 'jit-compile-count') ifTrue: [
		result := Smalltalk vm compiledMethodsCount
		          + Smalltalk vm compiledBlocksCount ].

	(self hasOption: 'fullGC-count') ifTrue: [
		result := Smalltalk vm fullGCCount ].

	(self hasOption: 'incrementalGC-count') ifTrue: [
		result := Smalltalk vm incrementalGCCount ].

	(self hasOption: 'fullGC-time') ifTrue: [
		result := Smalltalk vm totalFullGCTime ].

	(self hasOption: 'incrementalGC-time') ifTrue: [
		result := Smalltalk vm totalIncrementalGCTime ].

	(self hasOption: 'totalGC-time') ifTrue: [
		result := Smalltalk vm totalGCTime ].

	result ifNil: [ self error: 'What do you want?' ].


	^ self stdout
		  << result asString;
		  << OSPlatform current lineEnding;
		  flush
]

{ #category : #private }
ProfileCommandLineHandler >> testRunner [

	^ HDTestReport
]
