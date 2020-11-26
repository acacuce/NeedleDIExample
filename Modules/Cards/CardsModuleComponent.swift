//
//  CardsModuleComponent.swift
//  App
//
//  Created by Никита Солдатов on 25.11.2020.
//

import Foundation
import NeedleFoundation
import Core

public protocol CardsModuleDependencies: Dependency {
    var apiClient: ApiClient { get }
}

protocol CardListFactory {
    func makeViewController() -> UIViewController
}

public class CardsModuleComponent: Component<CardsModuleDependencies> {
    private lazy var cardsAPIService: CardsAPIService = CardsAPIService(apiClient: dependency.apiClient)
    public var cardsListAPIService: CardListAPIServiceProtocol { return cardsAPIService }
    public lazy var cardListComponent: CardsListComponent = CardsListComponent(parent: self)
}
