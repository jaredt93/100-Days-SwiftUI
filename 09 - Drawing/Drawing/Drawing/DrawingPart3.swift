//
//  DrawingPart3.swift
//  Drawing
//
//  Created by Jared Tamulynas on 11/17/21.
//

import SwiftUI

struct DrawingPart3: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
//            Image("HokieBird")
//                .colorMultiply(.red)
            
            Image("HokieBird")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            
            VStack {
                ZStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 140 * amount)
                        .offset(x: -50, y: -80)
                        .blendMode(.screen)

                    Circle()
                        .fill(.green)
                        .frame(width: 140 * amount)
                        .offset(x: 50, y: -80)
                        .blendMode(.screen)

                    Circle()
                        .fill(.blue)
                        .frame(width: 140 * amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)

                Slider(value: $amount)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
            
        }
    }
}

struct DrawingPart3_Previews: PreviewProvider {
    static var previews: some View {
        DrawingPart3()
    }
}
