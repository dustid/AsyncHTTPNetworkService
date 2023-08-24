//
//  ResponseValidator.swift
//  AsyncNetworkService
//
//  Created by Matt Kiazyk on 2022-01-21.
//

import Foundation

/// Validates that a response meets certain criteria. If it does not, throws an error.
public typealias ResponseValidator = (HTTPURLResponse, Data?) throws -> Void

public let statusCodeIsIn200s: ResponseValidator = { response, data in
    switch response.statusCode {
    case 200..<300:
        return
    case 401:
        throw NetworkError.unauthorized
    case 403:
        throw NetworkError.forbidden
    case 404:
        throw NetworkError.notFound
    case 405:
        throw NetworkError.badRequest
    case 500..<600:
        throw NetworkError.serverError
    default:
        throw NetworkError.non200StatusCode(statusCode: response.statusCode, data: data)
    }
}
