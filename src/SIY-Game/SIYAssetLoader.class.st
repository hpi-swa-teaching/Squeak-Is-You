"
A SIYAssetLoader is an interface for loading Assets through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYAssetLoader,
	#superclass : #Object,
	#instVars : [
		'assetLoader'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'KD 2/1/2024 13:50'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 15:49'
}
SIYAssetLoader >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName basePath: self basePath.]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYAssetLoader >> repositoryName [

	^ 'swa23-24-group16'
]
