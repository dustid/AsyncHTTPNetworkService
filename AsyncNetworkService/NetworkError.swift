//
//  AsyncNetworkError.swift
//  AsyncNetworkService
//
//  Created by Matt Kiazyk on 2022-01-21.
//

import Foundation

public enum NetworkError: Error, LocalizedError, Equatable {
    case invalidResponseFormat
    case decoding(error: Error)
    case decodingString
    case noDataInResponse
    case badRequest(contextualizedDescription: String? = nil)
    case unauthorized(contextualizedDescription: String? = nil)
    case forbidden(contextualizedDescription: String? = nil)
    case notFound(contextualizedDescription: String? = nil)
    case timeout(contextualizedDescription: String? = nil)
    case serverError(contextualizedDescription: String? = nil)
    case other(contextualizedDescription: String? = nil)
    
    public var errorDescription: String? {
        switch self {
        case .badRequest(let contextualizedDescription):
            return contextualizedDescription
        case .unauthorized(let contextualizedDescription):
            return contextualizedDescription
        case .forbidden(let contextualizedDescription):
            return contextualizedDescription
        case .notFound(let contextualizedDescription):
            return contextualizedDescription
        case .timeout(let contextualizedDescription):
            return contextualizedDescription
        case .serverError(let contextualizedDescription):
            return contextualizedDescription
        case .other(let contextualizedDescription):
            return contextualizedDescription
        default:
            return nil
        }
    }
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest(let lhsDesc), .badRequest(let rhsDesc)),
            (.unauthorized(let lhsDesc), .unauthorized(let rhsDesc)),
            (.forbidden(let lhsDesc), .forbidden(let rhsDesc)),
            (.notFound(let lhsDesc), .notFound(let rhsDesc)),
            (.timeout(let lhsDesc), .timeout(let rhsDesc)),
            (.serverError(let lhsDesc), .serverError(let rhsDesc)),
            (.other(let lhsDesc), .other(let rhsDesc)):
            return lhsDesc == rhsDesc
        case (.invalidResponseFormat, .invalidResponseFormat),
            (.noDataInResponse, .noDataInResponse),
            (.decodingString, .decodingString):
            return true
        case (.decoding(let lhsErr), .decoding(let rhsErr)):
            return (lhsErr as NSError).isEqual(rhsErr as NSError)
        default:
            return false
        }
    }
}
