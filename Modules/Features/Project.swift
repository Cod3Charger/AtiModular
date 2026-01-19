import ProjectDescription

let project = Project(
    name: "Features",
    targets: [
        .target(
            name: "Features",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.AtiModular.Features",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "Core", path: "../Core")
            ]
        ),
        .target(
            name: "FeaturesTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.AtiModular.FeaturesTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "Features")
            ]
        )
    ]
)
