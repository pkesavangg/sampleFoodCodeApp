//
//  ButtonStyle.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 12/11/22.
//

import Foundation

import SwiftUI

 struct MyButtonStyle: ButtonStyle {
     let backgroundColor : Color
     let buttonTextColor : Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(buttonTextColor)
            .clipShape(Capsule())
            .frame(width: 331, height: 88)
            .background(backgroundColor).cornerRadius(45)
            .font(.system(size: 40))
            
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: { print("Pressed") }) {
            Label("Press Me", systemImage: "star")
        }
        .buttonStyle(MyButtonStyle(backgroundColor: .red , buttonTextColor: .white))
    }
}
