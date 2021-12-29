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
      .copy("Helpers/Lenna.png"),
      .copy("Helpers/Trollface.png"),
//      .copy("_Snapshots"),
      .copy("Extra/UIViewController/_Snapshots")
    ])
  ]
)
