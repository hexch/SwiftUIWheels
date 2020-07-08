////  AnimatedIndicator.swift
//  SwiftUIWheels
//
//  Created by hexch on 2020/07/08.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import SwiftUI

struct AnimatedIndicator: View {
    @State var angle: Double = 0.0
    @State var isAnimating = false
    var color :Color = .white
    var font :Font = .title
    var animatingSpeed:Double = 5.0
    var body: some View {
        Image(systemName: "rays")
            .font(self.font)
            .foregroundColor(self.color)
            .rotationEffect(Angle(degrees: self.isAnimating ? 360 :0))
            .animation(Animation.linear(duration: self.animatingSpeed).repeatForever())
            .onAppear(perform: {self.isAnimating = true})
    }
}

struct AnimatedIndicator_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedIndicator()
    }
}
