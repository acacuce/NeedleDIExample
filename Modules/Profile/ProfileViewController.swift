//
//  ViewController.swift
//  TestNeedle
//
//  Created by Никита Солдатов on 24.11.2020.
//

import UIKit
import Core

public protocol ProfileAPIServiceProtocol  {
    func obtainProfile()
}

public class ProfileViewController: UIViewController {
    private let service: ProfileAPIServiceProtocol

    public init(service: ProfileAPIServiceProtocol = ProfileAPIService(apiClient: ApiClient.shared)) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Профиль"
        // Do any additional setup after loading the view.
    }


}

