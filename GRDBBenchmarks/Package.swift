// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Benchmarks",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(path: ".."),
        .package(url: "https://github.com/ordo-one/package-benchmark", from: "1.29.0"),
    ],
    targets: [
        .executableTarget(
            name: "GRDBBenchmarks",
            dependencies: [
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "Benchmark", package: "package-benchmark"),
            ],
            path: "Benchmarks/GRDBBenchmarks",
            resources: [
                .copy("Resources/ProfilingDatabase.sqlite")
            ],
            plugins: [
                .plugin(name: "BenchmarkPlugin", package: "package-benchmark")
            ]
        ),
    ]
)
