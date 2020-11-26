//
//  ApiClient.swift
//  Services
//
//  Created by Никита Солдатов on 25.11.2020.
//

import Foundation

// Синглтон делать нельзя, все через Needle
public final class ApiClient {
    static var isAlreadyInitialized = false
    // TODO: - Убрать отсюда синглтон и перенести инит в AppComponent
    public static let shared = ApiClient()
    public init() {
        guard ApiClient.isAlreadyInitialized == false else {
            fatalError("Должен быть инициализирован один раз")
        }
        ApiClient.isAlreadyInitialized = true
    }
}
