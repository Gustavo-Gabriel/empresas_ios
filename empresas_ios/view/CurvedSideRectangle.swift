//
//  CurvedSideRectangle.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import Foundation
import SwiftUI

struct CurvedSideRectangle: Shape {
    
    var yOffset: CGFloat = 50
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - yOffset))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - yOffset),
                          control: CGPoint(x: rect.midX, y: rect.maxY + yOffset))
        
        path.closeSubpath()
        
        return path
        
    }
    
}
