//
//  Parsing.swift
//  MTIExercise
//
//  Created by federico mazzini on 30/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, MTIError> {
    let decoder = JSONDecoder()

    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
