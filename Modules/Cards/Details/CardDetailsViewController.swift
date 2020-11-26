//
//  CardDetailsViewController.swift
//  Cards
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Transactions
import Core

protocol CardDetailsAPIServiceProtocol {
    func ontainCard(with id: UUID)
}

final class CardDetailsViewController: UIViewController {
    lazy var contentView = CardsDetailsView()
    private let service: CardDetailsAPIServiceProtocol

    init(service: CardDetailsAPIServiceProtocol = CardsAPIService(apiClient: ApiClient.shared)) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Детали по карте"
        contentView.showTransactions = { [unowned self] in
            self.showTransactions()
        }
    }

    func showTransactions() {
        let transactions = TransactionsViewController(cardID: UUID())
        navigationController?.pushViewController(transactions, animated: true)
    }

}
