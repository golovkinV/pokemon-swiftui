//
//  PokemonService.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 08.08.2022.
//

import DITranquillity
import Combine
import Foundation

// MARK: - DIPart
final class PokemonServicePart: DIPart {
    static func load(container: DIContainer) {
        container.register(PokemonServiceImp.init)
            .as(PokemonService.self)
            .lifetime(.single)
    }
}

// MARK: - Models
enum NetworkError: Error {
    case request(underlyingError: Error)
    case unableToDecode(underlyingError: Error)
}

struct ContainerDTO<T: Decodable>: Decodable {
    let results: [T]
}

struct PokemonDTO: Decodable {
    let name: String
    let url: String
}

struct Pokemon: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let url: String
}

//----------
// MARK: - Protocol
protocol PokemonService {
    func fetchPokemons() async throws -> AnyPublisher<[Pokemon], Error>
}

final class PokemonServiceImp: PokemonService {
    func fetchPokemons() async throws -> AnyPublisher<[Pokemon], Error> {
        URLSession.shared.dataTaskPublisher(for: .init(string: "https://pokeapi.co/api/v2/pokemon")!)
            .mapError { NetworkError.request(underlyingError: $0) }
            .map(\.data)
            .flatMap {
              Just($0)
                .decode(type: ContainerDTO<PokemonDTO>.self, decoder: JSONDecoder())
                .mapError { NetworkError.unableToDecode(underlyingError: $0) }
            }
            .map(\.results)
            .map { $0.map { Pokemon(name: $0.name, url: $0.url) } }
            .eraseToAnyPublisher()
    }
}
