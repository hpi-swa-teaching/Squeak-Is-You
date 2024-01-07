"
A SIYTextureManager is an interface for loading block textures through the Git Asset Browser.

Instance Variables
	assetLoader: <GitAssetLoader> 


"
Class {
	#name : #SIYTextureManager,
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
SIYTextureManager >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName basePath: self basePath.]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureManager >> basePath [

	^  'textures'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureManager >> getTexture: aFilename [

	^ self assetLoader loadForm: aFilename
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYTextureManager >> repositoryName [

	^ 'swa23-24-group16'
]
