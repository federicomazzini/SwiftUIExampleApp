//
//  LaptopsViewModel.swift
//  MTIExercise
//
//  Created by federico mazzini on 29/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation
import Combine

class LaptopsViewModel: ObservableObject, Identifiable {

    @Published var dataSource: [LaptopRowViewModel] = []
    @Published var isLoading: Bool = true

    private let laptopFetcher: LaptopFetchable
    private var disposables = Set<AnyCancellable>()

    init(
        laptopFetcher: LaptopFetchable,
        scheduler: DispatchQueue = DispatchQueue(label: "LaptopViewModel")
    ) {
        self.laptopFetcher = laptopFetcher
    }

    func fetchLaptops() {
        isLoading = true
        laptopFetcher.laptopList()
        .map { response in
            response.list.map(LaptopRowViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                self.isLoading = false
                switch value {
                case .failure:
                    self.dataSource = []
                    print(value)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] laptops in
                guard let self = self else { return }
                self.isLoading = false
                self.dataSource = laptops
        })
        .store(in: &disposables)
    }

}
