//
//  CreditCardView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI

struct CreditCardView: View {
    // MARK: - PROPERTIES
    @Environment(NavigationState.self) private var navigationState
    @Environment(CartViewModel.self) private var cartVM
    private var paymentVM = PaymentViewModel(httpClient: HTTPClient())
    @Environment(OrderViewModel.self) private var orderVM
    
    @State private var cardNumber: String = ""
    @State private var cardName: String = ""
    @State private var expireMonth: String = ""
    @State private var expireYear: String = ""
    @State private var CVV: String = ""
    @State private var isProcessingPayment = false
    
    
    @FocusState private var activeField: FocusedTextField?
    @State private var animateField: FocusedTextField?
    
    
    // MARK: - COMPUTED PROPERTIES
    
    private var cardIsComplete: Bool {
        guard let month = Int(expireMonth),
              let year = Int(expireYear),
              (1...12).contains(month),
              year > 24,
              expireMonth.count == 2,
              expireYear.count == 2,
              cardNumber.count == 19,
              !cardName.isEmpty,
              CVV.count == 3 else {
            return false
        }
        return true
    }
    
    // MARK: - FUNCTIONS
    
    private func checkout() async {
        withAnimation(.easeInOut) {
            isProcessingPayment = true
        }
        
        do {
            try await paymentVM.creditCardPayment(totalAmount: cartVM.total)
            
            guard paymentVM.paymentStatus == true else {
                withAnimation(.easeInOut) {
                    isProcessingPayment = false
                }
                return
            }
            
            do {
                guard let order = orderVM.createLocalOrder(from: cartVM) else {
                    withAnimation(.easeInOut) {
                        isProcessingPayment = false
                    }
                    return
                }
                
                try await orderVM.generateOrder(order: order)
                
                cartVM.emptyLocalCart()
                withAnimation(.easeInOut) {
                    isProcessingPayment = false
                }
                navigationState.path.append(Route.purchaseComplete)
                
            } catch {
                print(error.localizedDescription)
                withAnimation(.easeInOut) {
                    isProcessingPayment = false
                }
            }
        } catch {
            print(error.localizedDescription)
            withAnimation(.easeInOut) {
                isProcessingPayment = false
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        
        VStack(spacing: 10) {
            
            ZStack {
                if animateField != .CVV {
                    MeshGradient(
                        width: 3,
                        height: 3,
                        points: [
                            .init(0, 0), .init(0.5, 0), .init(1, 0),
                            .init(0, 0.5), .init(0.9, 0.6), .init(1, 0.5),
                            .init(0, 1), .init(0.5, 1), .init(1, 1)
                        ],
                        colors: [
                            .gray.opacity(0.9), .gray.opacity(0.6), .gray.opacity(0.8),
                            .gray.opacity(0.7), .gray.opacity(0.7), .gray.opacity(0.5),
                            .gray.opacity(0.3), .gray.opacity(0.6), .gray.opacity(0.5)
                        ]
                    )//: MESH
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 30, height: 30)
                                    .offset(x: -10)

                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: 30, height: 30)
                                    .offset(x: 10)
                            }
                            .padding()
                        }
                    }
                    .overlay {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("CARD NUMBER")
                                    .font(.caption)
                                
                                Text(cardNumber.isEmpty ? "**** **** **** ****" : cardNumber)
                                    .font(.title2)
                            }//:VSTACK
                            .padding()
                            
                            HStack(spacing: 10) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("CARD HOLDER")
                                        .font(.caption)
                                    
                                    Text(cardName.isEmpty ? "YOUR NAME" : cardName)
                                }//: VSTACK
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("EXPIRES")
                                        .font(.caption)
                                    HStack(spacing: 5) {
                                        Text(expireMonth.isEmpty ? "MM" : expireMonth)
                                        Text("/")
                                        Text(expireYear.isEmpty ? "YY" : expireYear)
                                    }//: HSTACK
                                }//: VSTACK
                                .padding()
                            }//:HSTACK
                            
                        }//:VSTACK
                    }
                    .foregroundStyle(.white)
                    .monospaced()
                    .transition(.flip)
                    
                }//:IF
                else {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.red.mix(with: .blue, by: 0.2))
                        .overlay {
                            VStack(spacing: 15) {
                                Rectangle()
                                    .fill(.black)
                                    .frame(height: 45)
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text("CVV")
                                        .font(.caption)
                                        .padding(.trailing, 15)
                                    ZStack(alignment: .trailing) {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.white)
                                            .frame(height: 45)
                                        Text(CVV.isEmpty ? "***" : CVV)
                                            .foregroundStyle(.black)
                                            .padding(.trailing, 5)
                                    }//:ZSTACK
                                    .padding(.horizontal, 10)
                                }//: VSTACK
                            }//:VSTACK
                        }//:OVERLAY
                        .foregroundStyle(.white)
                        .monospaced()
                        .transition(.reverseFlip)
                }//: ELSE
            }//:ZSTACK
            .frame(height: 200)
            .animation(.snappy, value: activeField)
        
            NiceTextField(titleLabel: "Card Number", fieldValue: $cardNumber) {
                cardNumber = String(cardNumber.group(" ", count: 4).prefix(19))
            }
            .keyboardType(.numberPad)
            .focused($activeField, equals: .cardNumber)
            
            NiceTextField(titleLabel: "Name", fieldValue: $cardName)
                .focused($activeField, equals: .cardName)
            
            HStack(spacing: 10) {
                NiceTextField(titleLabel: "Month", fieldValue: $expireMonth) {
                    expireMonth = String(expireMonth.prefix(2))
                    
                    if expireMonth.count == 2 {
                        activeField = .expireYear
                    }
                }
                .focused($activeField, equals: .expireMonth)
                
                NiceTextField(titleLabel: "Year", fieldValue: $expireYear) {
                    expireYear = String(expireYear.prefix(2))
                }
                .focused($activeField, equals: .expireYear)
                
                NiceTextField(titleLabel: "CVV", fieldValue: $CVV) {
                    CVV = String(CVV.prefix(3))
                }
                .focused($activeField, equals: .CVV)
            }//:HSTACK
            .keyboardType(.numberPad)
            
            Button(action:{
                Task {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                    await checkout()
                    
                }
            }, label: {
                if isProcessingPayment {
                    ProgressView()
                        .padding()
                        .tint(.white)
                } else {
                    Text("Pay $\(cartVM.total)")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(cardIsComplete ? Color.green : Color.gray)
                        .cornerRadius(10)
                        .shadow(color: cardIsComplete ? Color.green.opacity(0.3) : .clear, radius: 5, x: 0, y: 5)
                        .animation(.easeInOut, value: cardIsComplete)
                }//ELSE
            })//: BUTTON
            .frame(maxWidth: isProcessingPayment ? nil : .infinity)
            .background(Capsule().fill(cardIsComplete ? Color.green : .gray))
            .padding(.top, 20)
            .disabled(isProcessingPayment || !cardIsComplete)
            .animation(.easeInOut, value: cardIsComplete)
        }//:VSTACK
        .padding()
        .onChange(of: activeField, { oldValue, newValue in
            withAnimation(.snappy) {
                animateField = newValue
            }
        })
        .navigationBarBackButtonHidden()
    }
}


// MARK: - FOCUSED TEXT FIELD ENUM

enum FocusedTextField {
    case none
    case cardNumber
    case cardName
    case expireMonth
    case expireYear
    case CVV
}

#Preview {
    CreditCardView()
        .environment(NavigationState())
        .environment(CartViewModel(httpClient: .development))
        .environment(OrderViewModel(httpClient: .development))

}
