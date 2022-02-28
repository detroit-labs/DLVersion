# DLVersion

[![CI Status](http://img.shields.io/travis/detroit-labs/DLVersion.svg?style=flat)](https://travis-ci.org/detroit-labs/DLVersion)
[![Version](https://img.shields.io/cocoapods/v/DLVersion.svg?style=flat)](http://cocoadocs.org/docsets/DLVersion)
[![License](https://img.shields.io/cocoapods/l/DLVersion.svg?style=flat)](http://cocoadocs.org/docsets/DLVersion)
[![Platform](https://img.shields.io/cocoapods/p/DLVersion.svg?style=flat)](http://cocoadocs.org/docsets/DLVersion)

DLVersion is a model for working with iOS, macOS, tvOS and watchOS versions.  DLVersion supports numeric versioning with major, minor and any number of patch version segments.  DLVersion provides functions for comparing and describing the model.  

## Usage

### Creating a DLVersion object

Create a DLVersion object as below: 

```
let version = try DLVersion.version(string: "1.2.3")
```

Obtain the local version of the associated project from the bundle: 

```
let localVersion = try DLVersion.localVersion()
```

### Comparing DLVersions

```
let versionOne = try DLVersion.version(string: "1.2.3")
let versionTwo = try DLVersion.version(string: "1.2.5")
let versionThree = try DLVersion.version(string: "1.2.3")

versionOne.isOlderThanVersion(versionTwo) // returns true
versionOne.isNewerThanVersion(versionTwo) // returns false
versionOne.isEqualToVersion(versionThree) // returns true
```

### Describing DLVersions

```
let version = DLVersion.version("3.2.5.1")
print(version.string) // prints "3.2.5.1"
print(version.description) // prints "3.2.5.1"
let hash = version.hash // hashes the DLVersion string property
```

### Error Handling

When creating a version from a string, the string may be malformed or unable to be parsed.  In this event, DLVersion will throw `DLVersionError.malformedString`.

When retrieving the version from the bundle, if no version was found, DLVersion will throw `DLVersionError.noBundleVersion`.

## Installation

DLVersion is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```rb
pod "DLVersion"
```

## Author

Vincent Frascello, vincent.frascello@detroitlabs.com

## License

DLVersion is available under the MIT license. See the LICENSE file for more info.
