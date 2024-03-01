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

### Example

Check the [example/](example/) folder to see an example project using this library.
