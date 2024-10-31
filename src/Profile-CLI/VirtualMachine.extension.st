Extension { #name : #VirtualMachine }

{ #category : #'*Profile-CLI' }
VirtualMachine >> totalJITCompileBlocksSize [

	^ Smalltalk vm parameterAt: 87
]

{ #category : #'*Profile-CLI' }
VirtualMachine >> totalJITCompileMethodsSize [

	^ Smalltalk vm parameterAt: 86
]

{ #category : #'*Profile-CLI' }
VirtualMachine >> totalJITCompileSize [

	^ self totalJITCompileMethodsSize + self totalJITCompileBlocksSize
]
