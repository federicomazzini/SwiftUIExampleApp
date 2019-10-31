//
//  LaptopRowViewModel.swift
//  MTIExercise
//
//  Created by federico mazzini on 30/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct LaptopRowViewModel: Identifiable {
    private let item: LaptopResponse.Item
    
    var id: String {
        UUID().uuidString // This generates unique ids.
    }
    
    var title: String { item.title }
    
    var fullDescription: String { item.laptopDescription }
    
    var urlString: String { item.imgUrlString ?? ""}
    
    init(item: LaptopResponse.Item) {
        self.item = item
    }
}

extension LaptopRowViewModel {
    static let mockViewModel = LaptopRowViewModel(item: LaptopResponse.mockItem)
}
