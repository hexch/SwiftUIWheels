////  CommonStyle.swift
//  SwiftUIWheels
//
//  Created by hexch on 2020/07/02.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import SwiftUI

struct CommonStyle: ButtonStyle {
    struct Config {
        var bgColor: Color = .green
        var fgColor:Color = .white
        var paddingLeading:CGFloat = 15.0
        var paddingTrailing:CGFloat = 15.0
        var paddingTop:CGFloat = 15.0
        var paddingBottom:CGFloat = 15.0
        var scaleMin:CGFloat = 0.98
        var scaleMax:CGFloat = 1.0
        var opacityMin:Double = 0.5
        var opacityMax:Double = 1.0
        var radius :CGFloat = 5
        var shadowRadius:CGFloat = 3
    }
    var config:Config = .init()
    
    public func makeBody(configuration: CommonStyle.Configuration) -> some View {
        configuration.label
            .foregroundColor(config.fgColor)
            .padding(.leading,config.paddingLeading)
            .padding(.trailing,config.paddingTrailing)
            .padding(.top,config.paddingTop)
            .padding(.bottom,config.paddingBottom)
            .background(RoundedRectangle(cornerRadius: config.radius).fill(config.bgColor))
            .compositingGroup()
            .shadow(color: .black, radius: config.shadowRadius)
            .opacity(configuration.isPressed ? config.opacityMin : config.opacityMax)
            .scaleEffect(configuration.isPressed ? config.scaleMin : config.scaleMax)
        
    }
}
