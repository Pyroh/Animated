// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Animated",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "Animated", targets: ["Animated"]),
        .executable(name: "AnimatedCodeGenerator", targets: ["AnimatedCodeGenerator"])
    ],
    targets: [
        .target(name: "Animated"),
        .target(name: "AnimatedCodeGenerator")
    ]
)
