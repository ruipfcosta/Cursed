// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Cursed",
    products: [
        .library(name: "Cursed", targets: ["Cursed"]),
        .executable(name: "CursedExample", targets: ["CursedExample"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(name: "Cncurses", providers: [.brew(["ncurses"])]),
        .target(name: "Cursed", dependencies: ["Cncurses"]),
        .target(name: "CursedExample", dependencies: ["Cursed"]),
        .testTarget(name: "CursedTests", dependencies: ["Cursed"]),
    ]
)
