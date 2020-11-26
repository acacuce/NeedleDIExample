//
//  TabBarController.swift
//  App
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit

class TabBarController: UITabBarController {
    private let tabBarFactory: TabFactory
    init(tabBarFactory: TabFactory) {
        self.tabBarFactory = tabBarFactory
        super.init(nibName: nil, bundle: nil)
        setControllers()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setControllers() {
        let controllers: [UINavigationController] = TabFactory.Tab.allCases.map {
            let controller = tabBarFactory.makeController(for: $0)
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.tabBarItem = tabBarFactory.makeTabBarItem(for: $0)
            return navigationController
        }
        setViewControllers(controllers, animated: false)
    }

}
