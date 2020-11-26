//
//  ProfileAPIService.swift
//  Profile
//
//  Created by Никита Солдатов on 26.11.2020.
//

import Foundation
import Core

public final class ProfileAPIService: ProfileAPIServiceProtocol {
    private let apiClient: ApiClient

    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    public func obtainProfile() {}
}
