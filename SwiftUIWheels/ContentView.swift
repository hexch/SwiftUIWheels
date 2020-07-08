////  ContentView.swift
//  SwiftUIWheels
//
//  Created by hexch on 2020/07/02.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isProgressing = false
    @State var isDisabled = false
    @State var label :String = "Press Me"
    
    @State private var showActionSheet = false
    
    
    var body: some View {
        VStack{
            Spacer()
            ProgressableButton(isProgressing: self.$isProgressing, isDisabled: self.$isDisabled, label: self.$label){
                print(self.label)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                self.showActionSheet.toggle()
            }, label: {
                Text("ChangeState")
            })
                .actionSheet(isPresented: self.$showActionSheet, content: {
                    ActionSheet(title: Text("select action"),
                                message: nil,
                                buttons: [
                                    .default(Text("normal"), action: {
                                        self.isProgressing = false
                                        self.isDisabled = false
                                    }),
                                    .destructive(Text("disable"), action: {
                                        self.isProgressing = false
                                        self.isDisabled = true
                                    }),
                                    .destructive(Text("progress"), action: {
                                        self.isProgressing = true
                                        self.isDisabled = false
                                    }),
                                    .cancel()
                    ])
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
