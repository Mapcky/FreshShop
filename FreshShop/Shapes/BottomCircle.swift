//
//  BottomCircle.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 18/03/2025.
//

import SwiftUI

struct BottomCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let curveHeight: CGFloat = height * 0.2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height - curveHeight))
        
        path.addQuadCurve(
            to: CGPoint(x: width, y: height - curveHeight),
            control: CGPoint(x: width / 2, y: height)
        )
        
        path.addLine(to: CGPoint(x: width, y: 0))
        
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    BottomCircle()
}
