//
//  PokemonListAssembly.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 08.08.2022.
//

import DITranquillity

final class PokemonListPart: DIPart {
    static func load(container: DIContainer) {
        container.register(PokemonListViewModel.init)
            .as(PokemonListViewModel.self)
            .lifetime(.objectGraph)

        container.register(PokemonListView.init)
            .as(PokemonListView.self)
            .lifetime(.objectGraph)
    }
}

final class PokemonListAssemply {
    static func createView(_ container: DIContainer) -> PokemonListView {
        return container.resolve()
    }
}
