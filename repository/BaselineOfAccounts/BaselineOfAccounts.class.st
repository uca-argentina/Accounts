Class {
	#name : #BaselineOfAccounts,
	#superclass : #BaselineOf,
	#category : #BaselineOfAccounts
}

{ #category : #baselines }
BaselineOfAccounts >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Accounts';
				package: 'Accounts-Tests' with: [ spec requires: #('Accounts') ].

			spec
				group: 'default' with: #('deployment');
				group: 'deployment' with: #('Accounts');
				group: 'development' with: #('Accounts-Tests') ]
]
