//
//  ImageLoader.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 30/04/2025.
//

import SwiftUI

struct ImageLoader: View {
    // MARK: - PROPERTIES
    let urlString: String
    @State private var uiImage: UIImage?
    
    // MARK: - FUNCTIONS
    
    private func loadImage() {
        let fullURLString = Constants.Urls.baseURL + urlString

        if let cached = ImageCache.shared.image(forKey: fullURLString) {
            self.uiImage = cached
            return
        }

        guard let url = URL(string: fullURLString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data, let image = UIImage(data: data) {
                ImageCache.shared.insertImage(image, forKey: fullURLString)
                DispatchQueue.main.async {
                    self.uiImage = image
                }
            }
        }.resume()
    }

    
    // MARK: - BODY
    var body: some View {
        Group {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.5), radius: 4, x: 6, y: 8)
            } else {
                ProgressView("Loading...")
                    .onAppear {
                        loadImage()
                    }
            }//: IF ELSE
        }//: GROUP
    }//:BODY
}


#Preview {
    ImageLoader(urlString: "https://breadtopia.com/wp-content/uploads/2023/01/20230104_131203-x-Copy.jpg")
}
