//
//  ContentView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var navigated = false
    var body: some View {

        HelpView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
        
    }
}
