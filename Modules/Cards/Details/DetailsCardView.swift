//
//  DetailsCardView.swift
//  Cards
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Interfaces

final class CardsDetailsView: UIView {
    var showTransactions: EmptyAction?

    public lazy var stackView: UIStackView = {
        let instance = UIStackView(frame: CGRect.zero)
        instance.translatesAutoresizingMaskIntoConstraints = false
        instance.axis = .vertical
        instance.spacing = 16
        instance.distribution = .equalSpacing
        return instance
    }()

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
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(stackView)

        let button = UIButton(
            type: .system,
            primaryAction: UIAction(
                title: "Транзакции по карте",
                image: UIImage(systemName: "rectangle.stack"),
                handler: { [unowned self] action in
                    self.showTransactions?()
                }
            )
        )
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)
    }

    private func makeConstraints() {
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
