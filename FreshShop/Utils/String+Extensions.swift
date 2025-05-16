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
    
    func group(_ character: Character, count: Int) -> String {
        var modifiedString = self.replacingOccurrences(of: String(character), with: "")
        
        for index in 0..<modifiedString.count {
            if index % count == 0 && index != 0 {
                let groupCharacterCount = modifiedString.count(where: { $0 == character })
                let stringIndex = modifiedString.index(modifiedString.startIndex, offsetBy: index + groupCharacterCount)
                modifiedString.insert(character, at: stringIndex)
            }
        }
        
        return modifiedString
    }
    
}
