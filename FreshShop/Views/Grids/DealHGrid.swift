//
//  DealHGrid.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/07/2025.
//

import SwiftUI

struct DealHGrid: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    private let rowSpacing: CGFloat = 10
    private var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
    }
    
    var dealItemsVM: DealItemViewModel
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: rowSpacing, content: {
                ForEach(dealItemsVM.dealItems, id:\.self) { item in
                    VStack {
                        ZStack {
                            Color("LightGreenGridBackground")
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                            
                            ImageLoader(urlString: item.product.imageUrl)
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                        }//: ZSTACK
                        .frame(width: 100, height: 100)
                        
                        Text(item.product.name)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .frame(width: 100)
                    }//: VSTACK
                    .onTapGesture {
                        withAnimation(nil){
                            navigationState.animatingTop = true
                            navigationState.animatingBot = true
                        }
                        withAnimation(){
                            navigationState.path.append(Route.productDetail(item.product))
                        }
                    }
                }//LOOP
            })//HGRID
        }//: SCROLL
    }
}

#Preview {
    DealHGrid(dealItemsVM: DealItemViewModel(dealItems: []))
        .environment(NavigationState())
}
