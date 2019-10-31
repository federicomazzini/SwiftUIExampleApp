//
//  Responses.swift
//  MTIExercise
//
//  Created by federico mazzini on 30/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation

struct LaptopResponse: Decodable {
    let list: [Item]
    
    struct Item: Decodable {
        let title: String
        let laptopDescription: String
        let imgUrlString: String?
        
        enum CodingKeys: String, CodingKey {
            case title
            case laptopDescription = "description"
            case imgUrlString      = "image"
        }
        
    }
    
    init(from decoder: Decoder) throws {
        /*
         The example endpoint's array has no key, otherwise this
         init func wouldn't have been necessary, this init is optional.
         */
        var container = try decoder.unkeyedContainer()
        var items = [Item]()
        
        while !container.isAtEnd {
            let item = try container.decode(Item.self)
            items.append(item)
        }
        
        self.list = items
    }
    
}

extension LaptopResponse {
    static let mockItem = Item(
        title: "Laptop 1",
        laptopDescription: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
        imgUrlString: ""
    )
}
