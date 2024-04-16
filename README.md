# opus-swift
This package was created to provide an easy-to-maintain binding for [libopus](https://opus-codec.org/docs/opus_api-1.3.1/index.html)

# Version
The current release supports libopus v1.4

# Usage
This package is supposed to be used with SwiftPM or added as a Package dependency from XCode.

For Swift Package Manager add the following lines your Package.swift under `dependencies`:

```swift
  .package(
    name: "opus-swift",
    url: "https://github.com/HealsCodes/opus-swift.git",
    from: "1.4"
  )
```

To use the package in your swift code simply import it:

```swift
import LibOpus
```

# Licensing
This project is under MIT license. 

libopus sources are pulled from [https://gitlab.xiph.org/opus](https://gitlab.xiph.org/xiph/opus/). 

Opus is licensed under the [New BSD License](https://wiki.xiph.org/XiphWiki:Copyrights). 
