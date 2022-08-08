//
//  PokemonListView.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 26.07.2022.
//

import SwiftUI

struct PokemonListView: View {

    private let viewModel: PokemonListViewModel

    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonListView_Previews: PreviewProvider {

    static private let vm = PokemonListViewModel()

    static var previews: some View {
        PokemonListView(viewModel: vm)
    }
}
