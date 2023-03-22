// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExampleKit",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExampleKit",
            targets: ["ExampleKit"]),
    ],
    dependencies: [
        // Uncomment below line and comment 2nd package declaration to test posible deadlock fix
        //.package(url: "https://github.com/vladimirpetrovicvicert/swift-dependencies", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "0.2.0"),
        .package(url: "https://github.com/pointfreeco/swiftui-navigation", from: "0.6.0"),
    ],
    targets: [
        .target(
            name: "ExampleKit",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "SwiftUINavigation", package: "swiftui-navigation"),
            ]),
        .testTarget(
            name: "ExampleKitTests",
            dependencies: ["ExampleKit"]),
    ]
)
