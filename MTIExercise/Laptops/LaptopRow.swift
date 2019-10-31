//
//  LaptopRow.swift
//  MTIExercise
//
//  Created by federico mazzini on 29/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct LaptopRow: View {
    private let viewModel: LaptopRowViewModel
    var image: WebImage
    
    init(viewModel: LaptopRowViewModel) {
        self.viewModel = viewModel
        self.image = WebImage(path: viewModel.urlString)
    }
    
    var body: some View {
        HStack {
            image
            VStack() {
                Text(viewModel.title).font(.subheadline)
                    .padding(2)
                Text(viewModel.fullDescription).font(.subheadline)
                    .padding(4)
                    .lineLimit(3)
            }
        }
    }
}

extension LaptopRow {
    static func mockLaptopRow() -> LaptopRow {
        var row = LaptopRow(viewModel: LaptopRowViewModel(item: LaptopResponse.mockItem))
        row.image.placeholderImage = Constants.Assets.Images.defaultPreviewImage
        
        return row
    }
}

public struct LaptopRow_Previews: PreviewProvider {
    public static var previews: some View {
        
        // Display size categories
        ForEach(ContentSizeCategory.allCases, id: \.self) { sizeCategory in
            LaptopRow.mockLaptopRow()
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, sizeCategory)
                .previewDisplayName("\(sizeCategory)")
        }
    }
}
