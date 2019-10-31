//
//  LaptopDetailView.swift
//  MTIExercise
//
//  Created by federico mazzini on 31/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct LaptopDetailView: View {
    
    var viewModel: LaptopDetailViewModel
    
    init(viewModel: LaptopRowViewModel) {
        let vm = LaptopDetailViewModel(viewModel: viewModel)
        self.viewModel = vm
    }
    
    var body: some View {
//        NavigationView {
//            laptopSection
//        }
        Text("Hello")
    }
}

private extension LaptopDetailView {
    
//    var laptopSection: some View {
//        Section {
//            NavigationLink() {
//                LaptopDetailRow(viewModel: LaptopDetailRowViewModel(item: viewModel.item))
//            }
//        }
//    }
    
}
