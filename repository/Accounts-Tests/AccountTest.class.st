Class {
	#name : #AccountTest,
	#superclass : #TestCase,
	#category : #'Accounts-Tests'
}

{ #category : #tests }
AccountTest >> testAccountAfterDeposit100BalanceEqualsTo100 [
	| account |
	account := Account forSavingsWithDrawalLimitedto: 200.
	account deposit: 100.
	self assert: account balance equals: 100
]

{ #category : #tests }
AccountTest >> testAccountCreatedBalanceEqualsZero [
	| account |
	account := Account forSavingsWithDrawalLimitedto: 100.
	self assert: account balance equals: 0
]

{ #category : #tests }
AccountTest >> testAccountDeposit100Withdraw100Balance0 [
	| account |
	account := Account forSavingsWithDrawalLimitedto: 1000.
	account deposit: 100.
	self assert: account balance equals: 100.
	account withdraw: 100.
	self assert: account balance equals: 0
]

{ #category : #tests }
AccountTest >> testCheckingsAccountCanWithdrawBelow0Balance [
	| checkingsAccount |
	checkingsAccount := Account forCheckingsAllowingUpTo: -500.
	self assert: checkingsAccount balance equals: 0.
	checkingsAccount withdraw: 100.
	self assert: checkingsAccount balance equals: -100.
	self should: [ checkingsAccount withdraw: 1000 ] raise: AssertionFailure
]

{ #category : #tests }
AccountTest >> testGetRemainingMoneyOnAccount [
	| account amountToWithdraw |
	amountToWithdraw := 40.
	account := Account forSavingsWithDrawalLimitedto: 1000.
	account deposit: 100.
	self assert: account balance equals: 100.
	account withdraw: amountToWithdraw.
	self assert: account balance equals: 100 - amountToWithdraw
]

{ #category : #tests }
AccountTest >> testSavingsAccountCanWithdrawOnlyBelowWithdrawalLimit [
	| savingsAccount |
	savingsAccount := Account forSavingsWithDrawalLimitedto: 300.
	savingsAccount deposit: 500.
	self should: [ savingsAccount withdraw: 400 ] raise: AssertionFailure.
	self assert: savingsAccount balance equals: 500.
	savingsAccount withdraw: 300.
	self assert: savingsAccount balance equals: 200
]

{ #category : #tests }
AccountTest >> testWithdrawlMoreThanAvailableRejected [
	| account |
	account := Account forSavingsWithDrawalLimitedto: 200.
	account deposit: 100.
	self assert: account balance equals: 100.
	self should: [ account withdraw: 120 ] raise: AssertionFailure.
	self assert: account balance equals: 100
]
