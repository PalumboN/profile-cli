Class {
	#name : #BaselineOfProfileCLI,
	#superclass : #BaselineOf,
	#category : #BaselineOfProfileCLI
}

{ #category : #baselines }
BaselineOfProfileCLI >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'Profile-CLI' ]
]
