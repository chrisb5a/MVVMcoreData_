//
//  NetworkError.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import Foundation

enum NetworkError: Error {
    case badData
    case badURL
    case other(Error)
}
