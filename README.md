![](Logo/logo.png)

[![Build Status](https://travis-ci.org/khoiln/SwiftlyExt.svg?branch=master)](https://travis-ci.org/khoiln/SwiftlyExt)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftlyExt.svg)](https://img.shields.io/cocoapods/v/SwiftlyExt.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg)
[![Platform](https://img.shields.io/cocoapods/p/SwiftlyExt.svg?style=flat)](http://cocoadocs.org/docsets/SwiftlyExt)

SwiftlyExt is a library that extends certain Swift standard types and classes using extension feature in the Swift language.

- [Requirements](#requirements)
- [Installation](#installation)
- [Documentation via CocoaDocs](http://cocoadocs.org/docsets/SwiftlyExt/)
- [FAQ](#faq)
- [License](#license)

## Requirements

- iOS 9.0+ / macOS 10.11+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build SwiftlyExt.

To integrate SwiftlyExt into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SwiftlyExt', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwiftlyExt into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "khoiln/SwiftlyExt" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `SwiftlyExt.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate SwiftlyExt into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add SwiftlyExt as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/khoiln/SwiftlyExt.git
```

- Open the new `SwiftlyExt` folder, and drag the `SwiftlyExt.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `SwiftlyExt.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `SwiftlyExt.xcodeproj` folders each with two different versions of the `SwiftlyExt.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `SwiftlyExt.framework`.

- Select the top `SwiftlyExt.framework` for iOS and the bottom one for OS X.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `SwiftlyExt` will be listed as either `SwiftlyExt iOS`, `SwiftlyExt macOS`, `SwiftlyExt tvOS` or `SwiftlyExt watchOS`.

- And that's it!

> The `SwiftlyExt.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

---

##FAQ

###What is the purpose of the project?

SwiftlyExt is a collection of useful extensions that we use daily for iOS, and macOS development. It helps us save a ton of time writing the same code over and over again. Hope SwiftyExt will helps you too.

## License

SwiftyExt is released under the MIT license. See LICENSE for details.
