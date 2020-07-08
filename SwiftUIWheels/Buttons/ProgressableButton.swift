////  ProgressableButton.swift
//  SwiftUIWheels
//
//  Created by hexch on 2020/07/02.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import SwiftUI

struct ProgressableButton: View {
    @Binding var isProgressing: Bool
    @Binding var isDisabled :Bool
    @Binding var label:String
    
    var font:Font = .body
    var normalStyle = CommonStyle(config: .init(bgColor: .blue, fgColor: .white))
    var progressingStyle = CommonStyle(config: .init(bgColor: .gray, fgColor: .white))
    var disableStyle = CommonStyle(config: .init(bgColor: .gray, fgColor: .black))
    var action :()->Void = {}
    
    var style :CommonStyle{
        if isDisabled{
            return disableStyle
        }else if isProgressing{
            return progressingStyle
        }else{
            return normalStyle
        }
    }
    
    var body: some View {
        Button(action: {self.action()}, label: {
            VStack {
                HStack{
                    Spacer()
                    if isProgressing{
                        AnimatedIndicator(font:self.font)
                    }else{
                        Text(self.label)
                            .font(self.font)
                    }
                    Spacer()
                }
            }.frame(height: 15, alignment: .center)
        })
            .buttonStyle(self.style)
            .disabled(self.isProgressing || self.isDisabled)
    }
}

struct ProgressableButton_Previews: PreviewProvider {
    static var previews: some View {
        ProgressableButton(isProgressing: .constant(true), isDisabled: .constant(false), label: .constant("test")).padding()
    }
}

