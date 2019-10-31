//
//  LaptopsView.swift
//  MTIExercise
//
//  Created by federico mazzini on 29/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct LaptopsView: View {
    
    @ObservedObject var viewModel: LaptopsViewModel
    
    init(viewModel: LaptopsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    laptopSection
                }
            }
            .onAppear(perform: viewModel.fetchLaptops)
            .navigationBarTitle("Laptops")
        }
    }
}

private extension LaptopsView {
    
    var laptopSection: some View {
        Section {
//            NavigationLink(destination: ) {
                ForEach(viewModel.dataSource, content: LaptopRow.init(viewModel:))
//            }
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    
}
