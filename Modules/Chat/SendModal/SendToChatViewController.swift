//
//  SendToChatViewController.swift
//  Chat
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit

public class SendToChatViewController: UIViewController {
    public override func loadView() {
        view = SendToChatView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Отправить Сообщение"
        // Do any additional setup after loading the view.
    }


}

