# Iterable Flutter Plugin

Flutter plugin to support Android and iOS push notifications from [https://iterable.com/](https://iterable.com/).

---

This is the **Spring Health** fork of the (now abandoned) [iterable_flutter](https://github.com/la-haus/iterable-flutter) project.
As a result, this is not officially published via pub.dev, with the installation process being that of any, non-pub.dev published packag/plugin.

---

## Usage

To use this plugin, add `iterable_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Supported methods

| Method                         | Android | iOS | Web | MacOS | Windows | Linux |
| ------------------------------ | ------- | --- | --- | ----- | ------- | ----- |
| `initialize`                   | X       | X   |     |       |         |       |
| `setEmail`                     | X       | X   |     |       |         |       |
| `setUserId`                    | X       | X   |     |       |         |       |
| `registerForPush`              | X       | X   |     |       |         |       |
| `updateUser`                   | X       | X   |     |       |         |       |
| `signOut`                      | X       | X   |     |       |         |       |
| `track`                        | X       | X   |     |       |         |       |
| `setNotificationOpenedHandler` | X       | X   |     |       |         |       |

## Installation

1. Add `iterable_flutter` as a plugin in `pubspec.yaml` with the version you need like this:

```yaml
iterable_flutter:
  git:
  url: https://github.com/mabidakun/iterable-flutter.git
  ref: 0.6.0-MA-SH
```

2. Use `IterableFlutter.initialize` to set your iterable keys.
   > First, create a mobile API Key from [Iterable](https://support.iterable.com/hc/en-us/articles/360043464871#creating-api-keys).
   > Then, also from Iterable, [create a mobile app](https://support.iterable.com/hc/en-us/articles/115000331943#_2-create-a-mobile-app-in-iterable) and [assign a push integration](https://support.iterable.com/hc/en-us/articles/115000331943#_3-assign-a-push-integration-to-the-mobile-app)
   > to it.

```dart
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    IterableFlutter.initialize(
      apiKey: <api-key>,
      pushIntegrationName: <name>,
    );
  }
}
```

3. Identify the user

   > The identification can be done either using `IterableFlutter.setEmail` or `IterableFlutter.setUserId` methods.
   > Don't set an email and user ID in the same session, doing so causes the SDK to treat them as different users.

4. Call `IterableFlutter.registerForPush` to register the device for current user and listen for opened pushes with `IterableFlutter.setNotificationOpenedHandler`

5. Track your events and optional data fields, call `IterableFlutter.track` method.

## iOS dependency management

The iOS plugin ships both a Swift package (`ios/iterable_flutter/Package.swift`) and a podspec
(`ios/iterable_flutter.podspec`), so it works with either dependency manager. Both pin the same
Iterable iOS SDK version.

- **Swift Package Manager** — enabled by default. Nothing to do in your app; `flutter build ios`
  picks it up.
- **CocoaPods** — used automatically when Swift Package Manager is off
  (`flutter config --no-enable-swift-package-manager`).

This plugin requires **Flutter 3.44 or newer**. Its Swift package depends on `FlutterFramework`,
which the Flutter tool only generates from 3.44 onwards.

The plugin's minimum iOS deployment target is **16.0**. With CocoaPods a lower app target is only a
warning, but Swift Package Manager treats it as an error, so set `IPHONEOS_DEPLOYMENT_TARGET` to at
least 16.0 in your Xcode project.

Expect one harmless build message: a deployment-target warning from `IterableSDK`, whose own
`Package.swift` still declares iOS 10. Xcode raises it automatically.

#### Consuming via a local `path:` dependency

Flutter names the Swift package symlink after the plugin's **checkout directory**. If that directory
is named exactly `iterable-flutter`, it collides with this package's library product
(`iterable-flutter`) and Xcode fails with `unable to override package 'iterable_flutter'`. Clone into
a directory named `iterable_flutter` instead. Git and pub.dev dependencies are unaffected — their
cache directories carry a commit or version suffix.

### Example

Check the [example/](example/) folder to see an example project using this library.
