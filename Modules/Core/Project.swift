import ProjectDescription

let project = Project(
    name: "Core",
    targets: [
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.AtiModular.Core",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "Alamofire")
            ]
        ),
        .target(
            name: "CoreTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.AtiModular.CoreTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Core")
            ]
        )
    ]
)
