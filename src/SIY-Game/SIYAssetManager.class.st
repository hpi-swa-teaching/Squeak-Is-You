"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYAssetManager,
	#superclass : #Object,
	#instVars : [
		'assetLoader'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 15:49'
}
SIYAssetManager >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName basePath: self basePath.]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'KD 1/9/2024 13:38'
}
SIYAssetManager >> basePath [

	^  SubclassResponsibility
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYAssetManager >> repositoryName [

	^ 'swa23-24-group16'
]
