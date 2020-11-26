//
//  ViewController.swift
//  TestNeedle
//
//  Created by Никита Солдатов on 24.11.2020.
//

import UIKit
import Core

public protocol ChatAPIServiceProtocol  {
    func obtainChats()
}

public class ChatViewController: UIViewController {
    private lazy var contentView = ChatView()
    private let service: ChatAPIServiceProtocol

    public init(service: ChatAPIServiceProtocol = ChatAPIService(apiClient: ApiClient.shared)) {
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
        title = "Чат"
        contentView.showCard = { [unowned self] in
            // let controller = CardDetailsViewController()
            // present(controller, animated: true)
        }
        // Do any additional setup after loading the view.
    }


}

