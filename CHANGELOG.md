## 0.7.0
- feat(iOS): add Swift Package Manager support. CocoaPods is still supported; apps do not need to
  change anything.
- **Breaking**: minimum Flutter version is now 3.44, required by the Swift package's
  `FlutterFramework` dependency.
- refactor(iOS): sources moved to `ios/iterable_flutter/Sources/iterable_flutter/` and the
  Objective-C shim was removed (Swift Package Manager targets cannot mix Objective-C and Swift).
- **Breaking (native only)**: the Swift class `SwiftIterableFlutterPlugin` is now
  `IterableFlutterPlugin`. A deprecated `SwiftIterableFlutterPlugin` typealias is kept for source
  compatibility. The Dart API is unchanged.
- build(Android): migrate to the declarative Flutter Gradle plugin, AGP 9 and Gradle 9. The library
  now declares a `namespace`, targets Java 17, and raises `minSdk` from 16 to 24. An explicit
  `androidx.appcompat:appcompat:1.7.0` was added because `iterableapi` pulls in a 1.0.0 version whose
  transitive artifacts fail the AGP 8+ manifest merger.
- ci: workflows now run Flutter 3.44.8 instead of 2.8.1, which could not build this package at all.
- The example app was updated to build again: iOS deployment target 16.0, the same Android Gradle
  migration, a newer `firebase-messaging`, and the unused `flutter_config` dependency removed.

## 0.5.9
- Update README with no longer maintaining message

## 0.5.8
- feat(Track): allow data fields params for track #61

## 0.5.7
- build(Dependencies): update iterable android and iOS dependencies #57

## 0.5.6
### Fix
- fix(UpdateUser): waiting for user update never ends on Android #54

## 0.5.5
### Fix
- fix(PayLoad Push): IOS SDK sends the push payload encoded sometimes.

## 0.5.4
### Features
- feat(Data Push): have a single delivery format of the push notification metadata. 🧾 #47.
- feat(Library Pubspec): add pubspec to the ignore file by recommendation #43
### Fix
- Fix Crash on API 31+ #46.
- fix(Open Push IOS): could not read push data when app was closed. #45
- fix(Last Push Payload): when you open the app, reload the latest data from the push notification #42
### Other work
- ci(Android): fix ci builds for android #44

## 0.3.0+1
Added to update pubspec info.

## 0.3.0
- Implement signOut on iOS (thanks to @Gabriel-Azevedo: https://github.com/la-haus/iterable-flutter/pull/37

## 0.1.1
- Add updateUser support and registerForPush in iOS

## 0.1.0
Initial release
