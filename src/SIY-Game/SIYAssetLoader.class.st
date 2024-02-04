"
A SIYAssetLoader is an interface for loading assets through the Git Asset Browser.

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
	#'squeak_changestamp' : 'LK 2/4/2024 19:42'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 2/4/2024 19:45'
}
SIYAssetLoader >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName 
		basePath: self basePath]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 2/3/2024 21:49'
}
SIYAssetLoader >> basePath [

	^ SubclassResponsibility
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYAssetLoader >> repositoryName [

	^ 'swa23-24-group16'
]
