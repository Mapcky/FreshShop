//
//  String+Extensions.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import Foundation
extension String {
    
    var isEmptyOrWhiteSpaces: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isZipCode: Bool {
        //Argentina ZIP Regex
        let zipCodeRegex = "^[0-9]{4}$"
        return NSPredicate(format: "SELF MATCHES %@", zipCodeRegex).evaluate(with: self)
    }
}
