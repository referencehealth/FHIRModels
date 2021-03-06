// swift-tools-version:5.0
import PackageDescription

let package = Package(
	name: "FHIRModels",
	platforms: [
		.macOS(.v10_13),
		.iOS(.v11),
		.watchOS(.v4),
		.tvOS(.v11),
	],
	products: [
        .library(name: "FMCore", targets: ["FMCore"]),
		.library(name: "ModelsDSTU2", targets: ["ModelsDSTU2"]),
		.library(name: "ModelsR4", targets: ["ModelsR4"]),
		.library(name: "ModelsBuild", targets: ["ModelsBuild"]),
	],
	targets: [
		.target(name: "FMCore"),
		.target(name: "ModelsDSTU2", dependencies: ["FMCore"]),
		.target(name: "ModelsR4", dependencies: ["FMCore"]),
		.target(name: "ModelsBuild", dependencies: ["FMCore"]),
		.testTarget(name: "CoreTests", dependencies: ["FMCore"]),
		.testTarget(name: "DateTimeTests", dependencies: ["ModelsR4"]),
        .testTarget(name: "ModelTests", dependencies: ["ModelsR4"]),
        .testTarget(name: "PrimitiveTests", dependencies: ["ModelsR4"]),
	]
)
