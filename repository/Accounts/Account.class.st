Class {
	#name : #Account,
	#superclass : #Object,
	#instVars : [
		'balance',
		'accountType'
	],
	#category : #Accounts
}

{ #category : #'Instance Creation' }
Account class >> forCheckingsAllowingUpTo: aLowerLimit [
	^ self ofType: (CheckingsAccount withLimit: aLowerLimit)
]

{ #category : #'Instance Creation' }
Account class >> forSavingsWithDrawalLimitedto: aWithdrawalLimit [
	^ self ofType: (SavingsAccount withLimit: aWithdrawalLimit)
]

{ #category : #'Instance Creation' }
Account class >> ofType: anAccountType [
	^ self new initializeWithType: anAccountType
]

{ #category : #accessing }
Account >> balance [
	
	^ balance
]

{ #category : #updating }
Account >> deposit: anAmount [
	
	balance := balance + anAmount 
	


]

{ #category : #initialization }
Account >> initialize [

	super initialize.
	balance := 0.
]

{ #category : #initialization }
Account >> initializeWithType: anAccounType [
	accountType := anAccounType
]

{ #category : #updating }
Account >> withdraw: anAmount [
	accountType assertCanWithdraw: anAmount from: self.
	balance := balance - anAmount
]
