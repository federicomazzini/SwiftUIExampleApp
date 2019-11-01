//
//  LaptopRowViewModel.swift
//  MTIExercise
//
//  Created by federico mazzini on 30/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation

struct LaptopRowViewModel: Identifiable {
    private let item: LaptopResponse.Item
    
    var id: String { title }
    
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

// Used to hash on the title in order to produce a single view model for each title.
extension LaptopRowViewModel: Hashable {
  static func == (lhs: LaptopRowViewModel, rhs: LaptopRowViewModel) -> Bool {
    return lhs.title == rhs.title
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.title)
  }
}
