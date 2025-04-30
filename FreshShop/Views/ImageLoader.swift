//
//  ImageLoader.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 30/04/2025.
//

import SwiftUI

struct ImageLoader: View {
    // MARK: - PROPERTIEs
    let urlString: String
    
    // MARK: - BODY
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { img in
            img.resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 6, y: 8)
        } placeholder: {
            ProgressView("Loading...")
        }//: PLACEHOLDER
    }//:BODY
}

#Preview {
    ImageLoader(urlString: "")
}
