//
//  TransactionView.swift
//  Transactions
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Interfaces

final class TransactionItemView: UIStackView {
    var sendToChat: EmptyAction?
    lazy var titleLabel: UILabel = {
        let instance = UILabel()
        instance.font = UIFont.preferredFont(forTextStyle: .body)
        instance.setContentHuggingPriority(.defaultLow, for: .horizontal)
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
        addSubviews()
        makeConstraints()
        axis = .horizontal
        distribution = .fill
    }

    private func addSubviews() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(infoButton)
    }

    private func makeConstraints() {}
}
