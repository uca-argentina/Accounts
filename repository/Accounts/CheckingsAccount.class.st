Class {
	#name : #CheckingsAccount,
	#superclass : #Object,
	#instVars : [
		'limit'
	],
	#category : #Accounts
}

{ #category : #'Instance Creation' }
CheckingsAccount class >> withLimit: aLimit [
	^ self new initializeWithLimit: aLimit
]

{ #category : #updating }
CheckingsAccount >> assertCanWithdraw: anAmount from: anAccount [
	anAmount > (anAccount balance - limit)
		ifTrue: [ AssertionFailure signal: ('you can''t withdraw more than the lower limit of: <1p>' expandMacrosWith: limit) ]
]

{ #category : #initialization }
CheckingsAccount >> initializeWithLimit: aLimit [
	limit := aLimit
]
