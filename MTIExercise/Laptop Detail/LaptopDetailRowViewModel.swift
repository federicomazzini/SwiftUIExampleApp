//
//  LaptopDetailRowViewModel.swift
//  MTIExercise
//
//  Created by federico mazzini on 31/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation

struct LaptopDetailRowViewModel {
    
    private let item: LaptopResponse.Item
    
    var title: String { item.title }
    
    var fullDescription: String { item.laptopDescription }
    
    var urlString: String { item.imgUrlString ?? ""}
    
    init(item: LaptopResponse.Item) {
        self.item = item
    }
    
}
