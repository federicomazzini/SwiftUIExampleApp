//
//  ActivityIndicator.swift
//  MTIExercise
//
//  Created by federico mazzini on 31/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorOverlay: View {
    
    @State var spinCircle = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 80)
                .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            }
        .onAppear {
            self.spinCircle = true
        }
    }
}

#if DEBUG
struct ActivityIndicatorOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorOverlay()
    }
}
#endif
