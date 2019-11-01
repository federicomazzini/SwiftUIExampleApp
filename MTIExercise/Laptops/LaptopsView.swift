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
            VStack {
                if viewModel.isLoading {
                    ActivityIndicatorOverlay()
                } else {
                    List {
                        if viewModel.dataSource.isEmpty {
                            emptySection
                        } else {
                            laptopSection
                        }
                        
                        Spacer()
                    }
                }
            }
                
            .onAppear(perform: viewModel.fetchLaptops)
            .navigationBarTitle(Constants.Strings.Laptops)
        }
    }
    
}

private extension LaptopsView {
    
    var laptopSection: some View {
        Section {
            ForEach(viewModel.dataSource) { rowViewModel in
                NavigationLink(destination: LaptopDetailView(viewModel: rowViewModel)) {
                    LaptopRow.init(viewModel: rowViewModel)
                }
            }
        }
    }
    
    var emptySection: some View {
        Section {
            Text(Constants.Strings.NoResults)
                .foregroundColor(.gray)
        }
    }
    
}
