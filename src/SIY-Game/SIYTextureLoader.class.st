"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYTextureLoader,
	#superclass : #Object,
	#instVars : [
		'assetLoader'
	],
	#category : #'SIY-Game',
	#'squeak_changestamp' : 'LK 1/4/2024 15:51'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 15:49'
}
SIYTextureLoader >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName basePath: self basePath.]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureLoader >> basePath [

	^  'textures'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureLoader >> getTexture: aFilename [

	^ self assetLoader loadForm: aFilename
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYTextureLoader >> repositoryName [

	^ 'swa23-24-group16'
]
