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
    @State private var reloadFlag = 0
    // MARK: - BODY
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView("Loading...")
            case .success(let img):
                img.resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 6, y: 8)
            case .failure(_):
                Image(systemName: "cart")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.6)
                    .task {
                        reloadFlag += 1 //temporal solution
                    }
            default:
                EmptyView()
            }//SWTICH
        }//PHASE
        .id("\(urlString)-\(reloadFlag)")
    }//:BODY
}

#Preview {
    ImageLoader(urlString: "https://breadtopia.com/wp-content/uploads/2023/01/20230104_131203-x-Copy.jpg")
}
