// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SYPictureMetadata",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_14),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "SYPictureMetadata", targets: ["SYPictureMetadata"]),
        .library(name: "SYPictureMetadataTestAssets", targets: ["SYPictureMetadataTestAssets"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SYPictureMetadata"),
        .target(name: "SYPictureMetadataTestAssets", dependencies: ["SYPictureMetadata"], resources: [.copy("MetadataKeys"), .copy("TestFile")]),
        .testTarget(name: "SYPictureMetadataTests", dependencies: ["SYPictureMetadata", "SYPictureMetadataTestAssets"]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
