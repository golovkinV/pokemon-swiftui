//
//  DependenciesConfiguration.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 08.08.2022.
//

import DITranquillity
import UIKit

// MARK: - Prorocol
protocol DependenciesConfiguration {
    func setup()
    func configureContainer() -> DIContainer
}

// MARK: - DependenciesConfiguration
final class DependenciesConfigurationImp: DependenciesConfiguration {

    private let options: [UIApplication.LaunchOptionsKey: Any]?

    init(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        options = launchOptions
    }

    func setup() {
    }

    func configureContainer() -> DIContainer {
        let container = DIContainer()
        container.append(framework: AppFramework.self)
        return container
    }
}
