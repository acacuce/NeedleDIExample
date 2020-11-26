//
//  AppComponent.swift
//  App
//
//  Created by Никита Солдатов on 25.11.2020.
//

import Foundation
import NeedleFoundation
import Core

final class AppComponent: BootstrapComponent {
    // Должно быть так
    // lazy var apiClient: ApiClient = ApiClient()
    lazy var apiClient: ApiClient = ApiClient.shared
    lazy var tabBarComponent: TabBarComponent = TabBarComponent(parent: self)
}
