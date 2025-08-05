//
//  ProductDetailScreen.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct ProductDetailScreen: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    var productDetailVM: ProductDetailViewModel
    @Environment(CartViewModel.self) private var cartVM
    let dealNewPrice: String?
    let dealValue: String?
    
    // MARK: - FUNCTIONS
    private func addItemToCart() async {
        do {
            if dealNewPrice != nil {
                try await cartVM.addItemToCart(productId: productDetailVM.id, quantity: productDetailVM.count, unitPrice: dealNewPrice!)
            } else {
                try await cartVM.addItemToCart(productId: productDetailVM.id, quantity: productDetailVM.count, unitPrice: productDetailVM.price)
            }
        } catch is CancellationError {
            //do nothing
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Rectangle().fill(Color("LightGreen"))
                        .frame(maxHeight: 450)
                        .clipShape(BottomCircle())

                    VStack (alignment: .leading) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(productDetailVM.name)
                                .font(.system(size: 36, weight: .heavy, design: .rounded))
                                .foregroundStyle(.white)
                                .shadow(radius: 8)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, 12)
                                .padding(.top, 20)
                                .lineLimit(2)
                                .minimumScaleFactor(0.8)
                        }//:VSTACK TITLE
                        .foregroundStyle(.white)
                        .shadow(radius: 5, x: 0, y: 3)
                        .padding()
                        
                        HStack(alignment: .center, spacing: 6) {
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Price")
                                    .fontWeight(.semibold)
                                Text(Double(productDetailVM.price) ?? 0, format: .currency(code: "ARS"))
                                    .font(.title3)
                                    .fontWeight(.black)
                                    .scaleEffect(1.2, anchor: .leading)
                                    .foregroundColor(dealNewPrice != nil ? .gray : .black)
                                    .strikethrough(dealNewPrice != nil, color: .gray)
                                
                                if let dealNewPrice {
                                    Text(Double(dealNewPrice) ?? 0, format: .currency(code: "ARS"))
                                        .font(.title3)
                                        .fontWeight(.black)
                                        .scaleEffect(1.2, anchor: .leading)
                                        .foregroundStyle(.orange)
                                }
                            }
                            .padding(.trailing, 10)
                            
                            Spacer()
                            
                            AsyncImage(url: URL(string: Constants.Urls.baseURL + productDetailVM.imageUrl)) { img in
                                img.resizable()
                                    .scaledToFit()
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 6, y: 8)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .padding()
                    }
                    .padding(.top, 20)
                }//:ZSTACK
                .ignoresSafeArea()
            }//:VSTACK TOP PART
            .ignoresSafeArea()
            
            
            // MARK: - BOTTOM PART
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text("Ratings")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("LightGrayBackground"))
                        
                        HStack(alignment: .center, spacing: 3, content: {
                            ForEach(1...5, id: \.self) { item in
                                let isFilled = item <= (productDetailVM.rate)
                                Button(action: {}, label: {
                                    Image(systemName: "star.fill")
                                        .frame(width: 28, height: 28, alignment: .center)
                                        .background(Color.gray.opacity(0.2).clipShape(RoundedRectangle(cornerRadius: 10)))
                                        .foregroundStyle(isFilled ? Color.green : Color.white)



                                })
                            }
                        })
                    })//:VSTACK RATING
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Button(action: {
                            productDetailVM.decrementCount()
                        }, label: {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .black, design: .rounded))
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(
                                    Circle().fill(Color.green)
                                )
                                .contentShape(Circle())
                        })
                        Button(action: {}, label: {
                            Text("\(String(productDetailVM.count))")
                                .font(.system(size: 20, weight: .black, design: .rounded))
                                .foregroundStyle(.black)
                        })
                        Button(action: {
                            productDetailVM.incrementCount()
                        }, label: {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .black, design: .rounded))
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(
                                    Capsule().fill(Color.green)
                                )
                                .contentShape(Circle())
                        })
                    }
                }//:HSTACK
                .padding(.horizontal, 30)
                
                VStack (alignment: .leading) {
                    Text("Product Description")
                        .font(.system(.title3, design: .rounded))
                        .foregroundStyle(.gray)
                    
                    Text(productDetailVM.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
                
                Spacer()
                
                Button(action:{
                    Task.detached {
                        await addItemToCart()
                        await MainActor.run {
                            navigationState.animatingBot = true
                            navigationState.showingScreen = .cart
                            navigationState.path = NavigationPath()
                        }
                    }//:TASK
                    
                }, label: {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 5)
                        .padding(.horizontal)
                })//:BUTTON
            }//:VSTACK
            .padding(.bottom, 30)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    ProductDetailScreen(productDetailVM: ProductDetailViewModel(product: Product(id: 3, name: "Fresh Oranges",price: "100",quantity: 10, imageUrl: "ProductPlaceholder",categoryId: 1, description: "", rate: 4)), dealNewPrice: nil, dealValue: nil)
        .environment(NavigationState())
        .environment(CartViewModel(httpClient: .development))
        .environment(ProductViewModel(httpClient: .development))
}
