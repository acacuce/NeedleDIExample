//
//  TabBarFactory.swift
//  App
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Cards
import Chat
import Profile
import Transactions
import NeedleFoundation

protocol TabBarDependencies: Dependency {}

class TabBarComponent: Component<TabBarDependencies> {
    var cardModuleComponent: Cards.CardsModuleComponent {
        return CardsModuleComponent(parent: self)
    }
}

final class TabFactory {
    enum Tab: Int, CaseIterable {
        case cards
        case chat
        case profile
    }

    private let tabBarComponent: TabBarComponent

    init(tabBarComponent: TabBarComponent) {
        self.tabBarComponent = tabBarComponent
    }

    func makeController(for tab: Tab) -> UIViewController {
        switch tab {
        case .cards:
            return tabBarComponent.cardModuleComponent.cardListComponent.makeViewController()
        case .chat:
            return Chat.ChatViewController()
        case .profile:
            return Profile.ProfileViewController()
        }
    }

    func makeTabBarItem(for tab: Tab) -> UITabBarItem {
        switch tab {
        case .cards:
            return UITabBarItem(
                title: "Карты",
                image: UIImage(systemName: "creditcard"),
                selectedImage: UIImage(systemName: "creditcard.fill")
            )
        case .chat:
            return UITabBarItem(
                title: "Чат",
                image: UIImage(systemName: "message"),
                selectedImage: UIImage(systemName: "message.fill")
            )
        case .profile:
            return UITabBarItem(
                title: "Профиль",
                image: UIImage(systemName: "person"),
                selectedImage: UIImage(systemName: "person.fill")
            )
        }
    }
}
