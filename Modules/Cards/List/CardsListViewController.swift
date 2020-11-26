//
//  ViewController.swift
//  TestNeedle
//
//  Created by Никита Солдатов on 24.11.2020.
//

import UIKit
import Transactions
import NeedleFoundation
import Core

public protocol CardsListDependencies: Dependency {
    var cardsListAPIService: CardListAPIServiceProtocol { get }
}

public class CardsListComponent: Component<CardsListDependencies> {
    public func makeViewController() -> CardsListViewController {
        return CardsListViewController(service: dependency.cardsListAPIService)
    }
}

public protocol CardListAPIServiceProtocol {
    func ontainCards()
}

public class CardsListViewController: UIViewController {
    lazy var contentView = CardsListView()
    private let service: CardListAPIServiceProtocol

    init(service: CardListAPIServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = contentView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Карты"
        contentView.showCard = { [unowned self] id in
            navigationController?.pushViewController(CardDetailsViewController(), animated: true)
        }
        // Do any additional setup after loading the view.
    }

    func showDetails() {
    }

}

