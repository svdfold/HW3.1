//
//  ColorCircle.swift
//  HW3.1
//
//  Created by Mike Albright on 08.09.2021.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    var isTurnedOn: Bool
    var body: some View {
        
        if self.isTurnedOn {
            Circle().frame(width: 110, height: 110)
                .foregroundColor(color)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
        } else {
            Circle().frame(width: 110, height: 110)
                .foregroundColor(color.opacity(0.3))
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
        }
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red, isTurnedOn: false)
    }
}
