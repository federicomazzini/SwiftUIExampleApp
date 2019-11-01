//
//  LaptopFetcher.swift
//  MTIExercise
//
//  Created by federico mazzini on 30/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation
import Combine

protocol LaptopFetchable {
  func laptopList() -> AnyPublisher<LaptopResponse, MTIError>
}

// MARK: - API
class LaptopFetcher {
  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }
}

private extension LaptopFetcher {
  struct MTIExerciseAPI {
    static let scheme = "https"
    static let host   = "private-f0eea-mobilegllatam.apiary-mock.com"
    static let path   = "/list"
  }

  func makeLaptopListComponents() -> URLComponents {
    var components = URLComponents()
    components.scheme = MTIExerciseAPI.scheme
    components.host   = MTIExerciseAPI.host
    components.path   = MTIExerciseAPI.path
    return components
  }

}

// MARK: - LaptopFetchables
extension LaptopFetcher: LaptopFetchable {
    func laptopList() -> AnyPublisher<LaptopResponse, MTIError> {
        return laptopList(with: makeLaptopListComponents())
    }

    private func laptopList<T>(with components: URLComponents) -> AnyPublisher<T, MTIError> where T: Decodable {
        guard let url = components.url else {
            let error = MTIError.network(description: "Couldn't create URL")

            // This .eraseToAnyPublisher() changes the published type to an AnyPublisher with only the error.
            return Fail(error: error).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }

            /*
                This .flatMap(maxPublishers:) transforms all elements from an upstream publisher
                into a new or existing publisher. I need only one so I added .max(1)
                */
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data) // Custom decode func using generics.
            }

            .eraseToAnyPublisher()
    }

}
