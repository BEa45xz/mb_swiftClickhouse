// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name:         "SwiftClickHouse",
  dependencies: [
      .package(url: "https://github.com/IBM-Swift/SwiftyJSON", from: "17.0.0"),
      .package(url: "https://github.com/IBM-Swift/BlueSocket.git", from: "1.0.0")
  ],
  targets:      [
      .target(name: "SwiftClickHouse", dependencies: ["SwiftyJson", "BlueSocket"]),
  ]
)
