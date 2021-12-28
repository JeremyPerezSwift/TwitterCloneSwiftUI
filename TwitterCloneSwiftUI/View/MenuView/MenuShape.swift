//
//  MenuShape.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 28/12/2021.
//

import SwiftUI

struct MenuShape: Shape {
    var value: CGFloat
    
    var animatableData: CGFloat {
        get { return value }
        set { value = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width - 100
            let height = rect.height
            
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            
            path.move(to: CGPoint(x: width, y: 0))
            
            path.addCurve(to: CGPoint(x: width, y: height + 100), control1: CGPoint(x: width + value, y: height / 3), control2: CGPoint(x: width - value, y: height / 2))
        }
    }
}

