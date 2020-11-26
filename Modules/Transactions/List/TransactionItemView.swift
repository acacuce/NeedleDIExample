//
//  TransactionView.swift
//  Transactions
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Interfaces

final class TransactionItemView: UIView {
    var sendToChat: EmptyAction?
    lazy var titleLabel: UILabel = {
        let instance = UILabel()
        instance.font = UIFont.preferredFont(forTextStyle: .body)
        instance.setContentHuggingPriority(.defaultLow, for: .horizontal)
        instance.translatesAutoresizingMaskIntoConstraints = false
        return instance
    }()

    lazy var infoButton: UIButton = {
        let instance = UIButton(
            type: .system,
            primaryAction: UIAction(
                title: "Написать в чат",
                image: UIImage(systemName: "message.circle"),
                handler: { [unowned self] action in
                    self.sendToChat?()
                })
        )
        instance.setContentHuggingPriority(.required, for: .horizontal)
        instance.titleLabel?.textAlignment = .right
        instance.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
        instance.translatesAutoresizingMaskIntoConstraints = false
        return instance
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(infoButton)
    }

    private func makeConstraints() {
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.infoButton.leadingAnchor).isActive = true

        infoButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

