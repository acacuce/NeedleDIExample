//
//  ViewController.swift
//  TestNeedle
//
//  Created by Никита Солдатов on 24.11.2020.
//

import UIKit
import Chat
import Core

public protocol TransactionsAPIServiceProtocol  {
    func obtainTransactions()
}

public class TransactionsViewController: UIViewController {
    private let cardID: UUID
    private lazy var contentView = TransactionsView()
    private let service: TransactionsAPIServiceProtocol

    public init(service: TransactionsAPIServiceProtocol = TransactionsAPIService(apiClient: ApiClient.shared), cardID: UUID) {
        self.service = service
        self.cardID = cardID
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
        title = "Транзакции"
        contentView.sendToChat = { [unowned self] in
            let controller = SendToChatViewController()
            self.present(controller, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }


}

