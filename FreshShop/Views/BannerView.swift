//
//  BannerView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 17/03/2025.
//

import SwiftUI

struct BannerView: View {
    // MARK: - PROPERTIES
    
    let developmentBanners: [String] = ["banner1", "banner2", "banner3", "banner4"]
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(developmentBanners, id:\.self) { banner in
                Image(banner)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    BannerView()
}
