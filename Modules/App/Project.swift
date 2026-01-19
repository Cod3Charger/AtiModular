import ProjectDescription

let project = Project(
    name: "AtiModular",
    targets: [
        .target(
            name: "AtiModular",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.AtiModular",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["../../AtiModular/Sources/**"],
            resources: ["../../AtiModular/Resources/**"],
            dependencies: [
                .project(target: "Core", path: "../Core"),
                .project(target: "Features", path: "../Features")
            ]
        ),
        .target(
            name: "AtiModularTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.AtiModularTests",
            infoPlist: .default,
            sources: ["../../AtiModular/Tests/**"],
            dependencies: [.target(name: "AtiModular")]
        ),
    ]
)
