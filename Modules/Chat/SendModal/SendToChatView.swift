//
//  SendToChatView.swift
//  Chat
//
//  Created by Никита Солдатов on 26.11.2020.
//

import UIKit

final class SendToChatView: UIView {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        let textField = UITextField()
        textField.placeholder = "Введите сообщение"
        stackView.addArrangedSubview(textField)

        let button = UIButton(
            type: .system,
            primaryAction: UIAction(
                title: "Отправить",
                image: UIImage(systemName: "arrow.up.circle"),
                handler: { action in
                    print("aaaa")
                }
            )
        )
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)

        let button2 = UIButton(
            type: .system,
            primaryAction: UIAction(
                title: "Переход к Профилю",
                image: UIImage(systemName: "person"),
                handler: { action in
                    print("aaaa")
                }
            )
        )
        button2.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button2.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.addArrangedSubview(button2)
    }

    private func makeConstraints() {
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: .zero).isActive = true
    }
}
