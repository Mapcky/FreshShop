//
//  CustomTopShape.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CustomTopShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners:  [.topRight, .topLeft], cornerRadii: CGSize(width: 50, height: 50))
        
        return Path(path.cgPath)
    }
}
#Preview {
    CustomTopShape()
}
