// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iterable_flutter",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        // The library name is hyphen separated because Swift Package Manager uses it as the
        // CFBundleIdentifier when linked dynamically, and that cannot contain underscores.
        .library(name: "iterable-flutter", targets: ["iterable_flutter"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // Pinned to the same version as the Iterable-iOS-SDK dependency in iterable_flutter.podspec.
        .package(url: "https://github.com/Iterable/swift-sdk.git", exact: "6.6.4")
    ],
    targets: [
        .target(
            name: "iterable_flutter",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "IterableSDK", package: "swift-sdk")
            ]
        )
    ]
)
