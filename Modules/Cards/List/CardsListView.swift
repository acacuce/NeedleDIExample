//
//  CardsView.swift
//  Cards
//
//  Created by Никита Солдатов on 25.11.2020.
//

import UIKit
import Interfaces

final class CardsListView: UIView {
    var showCard: IDAction?

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
        scrollableStackView.stackView.alignment = .leading
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(scrollableStackView)
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(
                title: "Карта 1",
                image: UIImage(systemName: "creditcard"),
                handler: { [unowned self] action in
                    self.showCard?(UUID())
                }
            )
        )
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: .zero)
        scrollableStackView.stackView.addArrangedSubview(button)

        let button2 = UIButton(
            type: .system,
            primaryAction: UIAction(
                title: "Карта 2",
                image: UIImage(systemName: "creditcard"),
                handler: { [unowned self] action in
                    self.showCard?(UUID())
                }
            )
        )
        button2.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.contentEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: .zero)
        scrollableStackView.stackView.addArrangedSubview(button2)
    }

    private func makeConstraints() {
        scrollableStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollableStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollableStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollableStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

