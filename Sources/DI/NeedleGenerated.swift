

import Cards
import Chat
import Core
import Foundation
import NeedleFoundation
import Profile
import Transactions
import UIKit

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->TabBarComponent") { component in
        return TabBarDependencies6b058f6bef1c605940dfProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->TabBarComponent->CardsModuleComponent") { component in
        return CardsModuleDependencies61760645c7ae98a54adfProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppComponent->TabBarComponent->CardsModuleComponent->CardsListComponent") { component in
        return CardsListDependencies3f6b60fcb2c51bb5416cProvider(component: component)
    }
    
}

// MARK: - Providers

/// ^->AppComponent->TabBarComponent
private class TabBarDependencies6b058f6bef1c605940dfProvider: TabBarDependencies {


    init(component: NeedleFoundation.Scope) {

    }
}
/// ^->AppComponent->TabBarComponent->CardsModuleComponent
private class CardsModuleDependencies61760645c7ae98a54adfProvider: CardsModuleDependencies {
    var apiClient: ApiClient {
        return appComponent.apiClient
    }
    private let appComponent: AppComponent
    init(component: NeedleFoundation.Scope) {
        appComponent = component.parent.parent as! AppComponent
    }
}
/// ^->AppComponent->TabBarComponent->CardsModuleComponent->CardsListComponent
private class CardsListDependencies3f6b60fcb2c51bb5416cProvider: CardsListDependencies {
    var cardsListAPIService: CardListAPIServiceProtocol {
        return cardsModuleComponent.cardsListAPIService
    }
    private let cardsModuleComponent: CardsModuleComponent
    init(component: NeedleFoundation.Scope) {
        cardsModuleComponent = component.parent as! CardsModuleComponent
    }
}
