//
//  AppFramework.swift
//  pokemon-swiftui
//
//  Created by Vladimir Golovkin on 08.08.2022.
//

import DITranquillity

public class AppFramework: DIFramework {
    public static func load(container: DIContainer) {
        container.append(part: OtherPart.self)
        container.append(part: RepositoriesPart.self)
        container.append(part: ServicesPart.self)
        container.append(part: PersentersPart.self)
    }
}

private class RepositoriesPart: DIPart {
    static let parts: [DIPart.Type] = [
    ]

    static func load(container: DIContainer) {
        for part in self.parts {
            container.append(part: part)
        }

//        container.register {
//            ClearableManagerImp(items: many($0))
//        }
//        .as(ClearableManager.self)
//        .lifetime(.single)
    }
}

private class ServicesPart: DIPart {
    static let parts: [DIPart.Type] = [
    ]

    static func load(container: DIContainer) {
        for part in self.parts {
            container.append(part: part)
        }
    }
}

private class PersentersPart: DIPart {
    static let parts: [DIPart.Type] = [
        PokemonListPart.self
    ]

    static func load(container: DIContainer) {
        for part in self.parts {
            container.append(part: part)
        }
    }
}

private class OtherPart: DIPart {
    static let parts: [DIPart.Type] = [
    ]

    static func load(container: DIContainer) {
        for part in self.parts {
            container.append(part: part)
        }
    }
}
