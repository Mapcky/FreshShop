//
//  DeliveryAdressView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI

struct DeliveryAdressView: View {
    // MARK: - PROPERTIES
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var country: String = ""
    @State private var zipCode: String = ""
    @State private var validationErrors: [String] = []

    // MARK: - FUNCTIONS
    
    private func validateForm() -> Bool {
        
        validationErrors = []
        
        if street.isEmptyOrWhiteSpaces {
            validationErrors.append("Street is required.")
        }
        if city.isEmptyOrWhiteSpaces {
            validationErrors.append("City is required.")
        }
        if state.isEmptyOrWhiteSpaces {
            validationErrors.append("State is required.")
        }
        if !zipCode.isZipCode {
            validationErrors.append("Invalid ZIP code.")
        }
        if country.isEmptyOrWhiteSpaces {
            validationErrors.append("Country is required.")
        }
        
        return validationErrors.isEmpty
    }

    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Set Address")
                    .font(.title)
                    .foregroundStyle(.gray.opacity(0.7))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    NiceTextField(titleLabel: "Street", fieldValue: $street)
                    NiceTextField(titleLabel: "City", fieldValue: $city)
                    NiceTextField(titleLabel: "State", fieldValue: $state)
                    NiceTextField(titleLabel: "Country", fieldValue: $country)
                    NiceTextField(titleLabel: "Zip Code", fieldValue: $zipCode)
                    
                }//: VSTACK
                
                Button(action:{
                }, label: {
                    Text("Save")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Capsule().fill(Color("ButtonsDarkGreen")))
                        .foregroundStyle(.white)
                        .contentShape(Capsule())
                })//: BUTTON
            }//: VSTACK
            .padding()
            .padding(.bottom, 80)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
            .navigationBarBackButtonHidden()
        }//: Scroll
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DeliveryAdressView()
}
