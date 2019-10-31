//
//  WebImage.swift
//  MTIExercise
//
//  Created by federico mazzini on 29/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct WebImage : View {
    
    @State private var uiImage: UIImage? = nil
    var placeholderImage = Constants.Assets.Images.defaultPlaceHolder
    var path: String
    
    init(path: String) {
        self.path = path
    }
    
    var body: some View {
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .onAppear(perform: downloadWebImage)
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue,lineWidth: 2).shadow(radius: 10))
            .aspectRatio(contentMode: .fill)
            .padding(2)
    }
    
    func downloadWebImage() {
        guard let url = URL(string: path) else {
            print("WebImage: Invalid URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            } else {
                print("WebImage error: \(String(describing: error))")
            }
        }.resume()
    }
}

public struct WebImage_Previews: PreviewProvider {
    public static var previews: some View {
        var myImage = WebImage(path: "")
        myImage.placeholderImage = Constants.Assets.Images.defaultPreviewImage
        return myImage
    }
}
