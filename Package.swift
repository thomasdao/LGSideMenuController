// swift-tools-version:5.3
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import PackageDescription

let package = Package(
    name: "LGSideMenuController",
    platforms: [
        .iOS(.v9)
    ], products: [
        .library(name: "LGSideMenuController",
                 targets: ["LGSideMenuController"])
    ],
    targets: [
        .target(name: "LGSideMenuController",
                path: "LGSideMenuController")
    ]
)
