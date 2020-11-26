//
//  DataProviders.swift
//  TestNeedle
//
//  Created by Никита Солдатов on 25.11.2020.
//

import Core
import Foundation

final class CardsAPIService: CardListAPIServiceProtocol, CardDetailsAPIServiceProtocol {
    private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func ontainCards() {}

    func ontainCard(with id: UUID) {}

}
