//
//  DeliveryAdressView.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI

struct DeliveryAdressView: View {
    // MARK: - PROPERTIES
    @Environment(\.navigationState) private var navigationState
    
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var country: String = ""
    @State private var zipCode: String = ""
    @State private var isDefault: Bool = false
    @State private var isDefaultDisabled: Bool = false

    
    enum AddressField: CaseIterable {
        case street, city, state, zipCode, country
    }
    
    @State private var fieldErrors: [AddressField: Bool] = [:]
    
    @Environment(AddressViewModel.self) private var addressVM


    // MARK: - FUNCTIONS
    
    private func validateForm() -> Bool {
        fieldErrors = [:]

        var isValid = true

        if street.isEmptyOrWhiteSpaces {
            fieldErrors[.street] = true
            isValid = false
        }

        if city.isEmptyOrWhiteSpaces {
            fieldErrors[.city] = true
            isValid = false
        }

        if state.isEmptyOrWhiteSpaces {
            fieldErrors[.state] = true
            isValid = false
        }

        if !zipCode.isZipCode {
            fieldErrors[.zipCode] = true
            isValid = false
        }

        if country.isEmptyOrWhiteSpaces {
            fieldErrors[.country] = true
            isValid = false
        }

        return isValid
    }
    
    func sendData() async {
        
        let newAddress = Address(street: street, city: city, state: state, country: country, zip: zipCode, isDefault: true)//default hardcoded
        
        do {
            try await addressVM.newAddress(newAddress: newAddress)
        } catch {
            print(error.localizedDescription)
        }
        
    }

    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Set Address")
                    .font(.title)
                    .foregroundStyle(.gray.opacity(0.7))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    NiceTextField(titleLabel: "Street", fieldValue: $street, showError: fieldErrors[.street] ?? false)
                    
                    NiceTextField(titleLabel: "City", fieldValue: $city, showError: fieldErrors[.city] ?? false)
                    
                    NiceTextField(titleLabel: "State", fieldValue: $state, showError: fieldErrors[.state] ?? false)
                    
                    NiceTextField(titleLabel: "Country", fieldValue: $country, showError: fieldErrors[.country] ?? false)
                    
                    NiceTextField(titleLabel: "Zip Code", fieldValue: $zipCode, showError: fieldErrors[.zipCode] ?? false)
                    
                    Toggle("Set as default", isOn: $isDefault)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 15)
                        .disabled(isDefaultDisabled)
                    
                }//: VSTACK
                
                GreenButton(title: "Save", enabled: validateForm(), action: {
                    Task {
                        await sendData()
                        navigationState.path.removeLast()
                    }
                    
                })//: BUTTON
                
            }//: VSTACK
            .padding()
            .padding(.bottom, 80)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 15)
            .shadow(radius: 0.5)
            .padding(.top, 30)
        }//: Scroll
        .background(Color("LightGrayBackground"))
        .navigationBarBackButtonHidden()
        .onAppear(){
            if addressVM.addresses.isEmpty {
                isDefault = true
                isDefaultDisabled = true
            }
        }
    }
}

#Preview {
    DeliveryAdressView()
        .environment(AddressViewModel(httpClient: .development))
        .environment(\.navigationState, NavigationState())
}
