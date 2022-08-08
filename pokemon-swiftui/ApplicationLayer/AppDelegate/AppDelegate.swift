//
//  AppDelegate.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 26.07.2022.
//

import UIKit
import DITranquillity

final class AppDelegate: NSObject, UIApplicationDelegate {

    private var configuration: DependenciesConfiguration!
    private(set) var container: DIContainer!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        configuration = DependenciesConfigurationImp(launchOptions: launchOptions)
        configuration.setup()
        container = configuration?.configureContainer()
        return true
    }
}
