//
//  WebImage.swift
//  MTIExercise
//
//  Created by federico mazzini on 29/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct WebImage: View {

    @State private var uiImage: UIImage?
    var placeholderImage = Constants.Images.defaultPlaceHolder
    var path: String

    init(path: String) {
        self.path = path
    }

    var body: some View {
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .onAppear(perform: downloadWebImage)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: 2).shadow(radius: 10))
            .aspectRatio(contentMode: .fill)
            .padding(2)
    }

    func downloadWebImage() {
        guard let url = URL(string: path) else {
            print("WebImage: Invalid URL.")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            } else {
                print("WebImage error: \(String(describing: error))")
            }
        }.resume()
    }
}

#if DEBUG
public struct WebImage_Previews: PreviewProvider {
    public static var previews: some View {
        var myImage = WebImage(path: "")
        myImage.placeholderImage = Constants.Images.defaultPreviewImage
        return myImage
            .frame(width: 120, height: 120, alignment: .center)
    }
}
#endif
