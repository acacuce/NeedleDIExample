//
//  ChatAPIService.swift
//  Chat
//
//  Created by Никита Солдатов on 26.11.2020.
//

import Core
import Foundation

public final class ChatAPIService: ChatAPIServiceProtocol {
    private let apiClient: ApiClient

    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    public func obtainChats() {}
}
