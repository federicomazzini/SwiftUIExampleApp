//
//  LaptopDetailViewModel.swift
//  MTIExercise
//
//  Created by federico mazzini on 31/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

class LaptopDetailViewModel {
    
  var dataSource: LaptopRowViewModel

  init(viewModel: LaptopRowViewModel) {
    self.dataSource = viewModel
  }
    
}
