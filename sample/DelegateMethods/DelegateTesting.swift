//
//  DelegateTesting.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 06/03/23.
//

import SwiftUI

protocol MyViewDelegate {
    func buttonTapped(name: String)
}

struct DelegateTesting: View, MyViewDelegate {
    var body: some View {
        VStack{
            MyView(delegate: self)
        }
    }
        
    func buttonTapped(name: String) {
       print("Button tapped \(name)")
    }
    
}

struct MyView: View {
    var delegate: MyViewDelegate?
    
    var body: some View {
        Button("Tap me") {
            delegate?.buttonTapped(name: "Testing")
        }
    }
}

struct DelegateTesting_Previews: PreviewProvider {
    static var previews: some View {
        DelegateTesting()
    }
}
