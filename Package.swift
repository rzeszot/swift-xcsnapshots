// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "XCSnapshots",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(name: "XCSnapshots", targets: ["XCSnapshots"]),
  ],
  targets: [
    .target(name: "XCSnapshots"),
    .testTarget(name: "XCSnapshotsTests", dependencies: ["XCSnapshots"], resources: [
      .copy("Snapshots")
    ])
  ]
)
