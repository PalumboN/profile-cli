Class {
	#name : 'BaselineOfProfileCLI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfProfileCLI',
	#package : 'BaselineOfProfileCLI'
}

{ #category : 'baselines' }
BaselineOfProfileCLI >> baseline: spec [

	<baseline>
	"TODO: Add Method Proxies dependency"
	spec for: #common do: [ spec package: 'Profile-CLI' ]
]
