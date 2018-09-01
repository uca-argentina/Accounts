Class {
	#name : #SavingsAccount,
	#superclass : #Object,
	#instVars : [
		'limit'
	],
	#category : #Accounts
}

{ #category : #'Instance Creation' }
SavingsAccount class >> withLimit: aLimit [
	^ self new initializeWithLimit: aLimit
]

{ #category : #updating }
SavingsAccount >> assertCanWithdraw: anAmount from: anAccount [
	anAmount > anAccount balance
		ifTrue: [ AssertionFailure signal: 'you can''t withdraw more than you have.' ].
	anAmount > limit
		ifTrue: [ AssertionFailure signal: ('you can''t withdraw more than the limit of. <1p>' expandMacrosWith: limit) ]
]

{ #category : #initialization }
SavingsAccount >> initializeWithLimit: aLimit [
	limit := aLimit
]
