Class {
	#name : #ClosureValueProfiler,
	#superclass : #Object,
	#instVars : [
		'handlers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Profile-CLI'
}

{ #category : #accessing }
ClosureValueProfiler class >> instance [

	^ instance
]

{ #category : #initialization }
ClosureValueProfiler class >> reset [

	instance ifNotNil: [ instance uninstall ].
	instance := self new
]

{ #category : #API }
ClosureValueProfiler >> hits [

	^ handlers collect: #count
]

{ #category : #initialization }
ClosureValueProfiler >> initialize [

	handlers := Dictionary new
]

{ #category : #configure }
ClosureValueProfiler >> installProxies: aClass [

	| handler |
	handler := MpCountingHandler new.

	self selectorsToProfile
		collect: [ :selector | aClass >> selector ]
		thenDo: [ :method |
			| p |
			p := MpMethodProxy onMethod: method handler: handler.
			p install.
			p enableInstrumentation ].

	handlers at: aClass put: handler
]

{ #category : #configure }
ClosureValueProfiler >> prepare: aClass [
	"We need to install the profilers in methods of this class but not super-methods.
	So, we will copy the super-methods to the class."

	self selectorsToProfile do: [ :selector |
		| method |
		method := aClass lookupSelector: selector.
		method methodClass = aClass ifFalse: [
			aClass compile: method sourceCode ] ]
]

{ #category : #API }
ClosureValueProfiler >> profileClass: aBlockClass [

	self prepare: aBlockClass.
	self installProxies: aBlockClass
]

{ #category : #initialization }
ClosureValueProfiler >> reset [

	handlers do: [ :handler | handler count: 0 ]
]

{ #category : #queries }
ClosureValueProfiler >> selectorsToProfile [

	^ { 
	#value.
	#value:value:.
	#value:value:value:.
	#value:value:value:value:.
	#valueWithArguments:
	}.
]

{ #category : #accessing }
ClosureValueProfiler >> stop [

	self uninstall
]

{ #category : #installation }
ClosureValueProfiler >> uninstall [
	"TODO: Improve this to only remove the proxies in the instrumented methods"

	MpMethodProxy allInstancesDo: [ :p | p uninstall ]
]
