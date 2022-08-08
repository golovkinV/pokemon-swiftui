//
//  PokemonListView.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 26.07.2022.
//

import SwiftUI

struct PokemonListView: View {

    @ObservedObject private var viewModel: PokemonListViewModel

    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.pokemons) { pokemon in
            Text(pokemon.name)
        }
        .onAppear {
            viewModel.fetchPokemons()
        }
    }
}

//struct PokemonListView_Previews: PreviewProvider {
//
//    static private let vm = PokemonListViewModel(pokemonService: PokemonServiceImp())
//
//    static var previews: some View {
//        PokemonListView(viewModel: vm)
//    }
//}
