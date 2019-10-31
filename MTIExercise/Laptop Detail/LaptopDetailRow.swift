//
//  LaptopDetailRow.swift
//  MTIExercise
//
//  Created by federico mazzini on 31/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct LaptopDetailRow: View {
    
    private let viewModel: LaptopDetailRowViewModel
    var image: WebImage
    
    init(viewModel: LaptopDetailRowViewModel) {
        self.viewModel = viewModel
        self.image = WebImage(path: viewModel.urlString)
    }
    
    var body: some View {
        VStack() {
            image
            Text(viewModel.title).font(.subheadline)
                .padding(4)
            Text(viewModel.fullDescription).font(.subheadline)
                .padding(4)
        }
    }
    
}
