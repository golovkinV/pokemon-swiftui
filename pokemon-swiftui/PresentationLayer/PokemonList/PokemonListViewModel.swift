//
//  PokemonListViewModel.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 26.07.2022.
//

import Combine
import UIKit

// MARK: - ViewModel
final class PokemonListViewModel: ObservableObject {
    private var bag = Set<AnyCancellable>()
    private let pokemonService: PokemonService

    @Published var pokemons: [Pokemon] = []

    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }

    func fetchPokemons() {
        Task {
            let reply = try await pokemonService.fetchPokemons()
            reply
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: {
                    print($0)
                }, receiveValue: { [weak self] pokemons in
                    self?.pokemons = pokemons
                })
                .store(in: &bag)
        }
    }
}
