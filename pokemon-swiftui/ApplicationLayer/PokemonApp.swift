//
//  PokemonApp.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 23.07.2022.
//

import SwiftUI

@main
struct PokemonApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            PokemonListAssemply.createView(appDelegate.container!)
        }
    }
}
