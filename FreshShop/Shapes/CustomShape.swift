//
//  CustomShape.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 14/03/2025.
//

import SwiftUI

struct CustomShape: Shape {
    var cutoutRatio: CGFloat // Relación del tamaño del recorte respecto al ancho
    var cutoutHeight: CGFloat // Altura del recorte semicircular desde la parte superior

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let radius = rect.width / cutoutRatio // Controla el tamaño del recorte semicircular
        let center = CGPoint(x: rect.midX, y: rect.minY + cutoutHeight) // Centro del recorte más arriba

        // Comienza desde la parte izquierda
        path.move(to: CGPoint(x: 0, y: rect.minY))

        // Añade la curva de descenso hacia el borde izquierdo del semicírculo
        path.addCurve(to: CGPoint(x: center.x - radius, y: rect.minY),
                      control1: CGPoint(x: rect.maxX * 0.44, y: rect.minY - 20),
                      control2: CGPoint(x: rect.maxX * 0.35, y: rect.minY - 20))

        // Ahora cortamos hacia el semicírculo
        path.addArc(center: center, radius: radius, startAngle: .degrees(180), endAngle: .zero, clockwise: true)

        // Replicamos la curva descendente en el lado derecho del semicírculo (simétrica)
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.minY),
                      control1: CGPoint(x: rect.midX + radius * 1.12, y: rect.minY - 20),
                      control2: CGPoint(x: rect.midX + radius * 0.85, y: rect.minY - 20))

        // Continuamos hacia la parte inferior
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Línea hacia la parte inferior derecha
        path.addLine(to: CGPoint(x: 0, y: rect.maxY)) // Línea hacia la parte inferior izquierda

        // Cerrar la forma
        path.closeSubpath()

        return path
    }
}

#Preview {
    CustomShape(cutoutRatio: 8, cutoutHeight: 00)
}
