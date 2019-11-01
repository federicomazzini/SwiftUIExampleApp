//
//  LaptopDetailView.swift
//  MTIExercise
//
//  Created by federico mazzini on 31/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct LaptopDetailView: View {

    var viewModel: LaptopRowViewModel
    var image: WebImage

    init(viewModel: LaptopRowViewModel) {
        self.viewModel = viewModel
        self.image = WebImage(path: viewModel.urlString)
    }

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(Font.system(size: 25))
                .fontWeight(.medium)
            image
                .frame(width: 200, height: 200, alignment: .center)
                .padding(EdgeInsets(top: 12.0, leading: 18.0, bottom: 12.0, trailing: 18.0))
            Text(viewModel.fullDescription)
                .font(Font.system(size: 16))
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 8.0, leading: 18.0, bottom: 25.0, trailing: 18.0))
        }
    }
}

extension LaptopDetailView {
    static func mockLaptop() -> LaptopDetailView {
        var row = LaptopDetailView(viewModel: LaptopRowViewModel(item: LaptopResponse.mockItem))
        row.image.placeholderImage = Constants.Images.defaultPreviewImage

        return row
    }
}

public struct LaptopDetailView_Previews: PreviewProvider {
    public static var previews: some View {
        LaptopDetailView.mockLaptop()
    }
}
