//
//  TransactionsView.swift
//  Transactions
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Interfaces

final class TransactionsView: UIView {
    var sendToChat: EmptyAction?

    lazy var scrollableStackView: ScrollableStackView = ScrollableStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func commonInit() {
        backgroundColor = .systemBackground
        scrollableStackView.stackView.distribution = .fill
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(scrollableStackView)
        let transaction1 = TransactionItemView()
        transaction1.titleLabel.text = "Транзакция 1"
        transaction1.sendToChat = { [unowned self] in
            self.sendToChat?()
        }
        let transaction2 = TransactionItemView()
        transaction2.titleLabel.text = "Транзакция 2"
        transaction2.sendToChat = { [unowned self] in
            self.sendToChat?()
        }
        scrollableStackView.stackView.addArrangedSubview(transaction1)
        scrollableStackView.stackView.addArrangedSubview(transaction2)
    }

    private func makeConstraints() {
        scrollableStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollableStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollableStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollableStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

