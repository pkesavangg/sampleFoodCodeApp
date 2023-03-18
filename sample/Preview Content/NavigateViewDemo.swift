//
//  NavigateViewDemo.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 09/02/23.
//

import SwiftUI

struct NavigateViewDemo: View {
    @State var showView2 = false
    var body: some View {
        NavigationView {
            VStack{
                Button {
                    showView2 = true
                } label: {
                    Text("Move to view 2")
                }
                NavigationLink("", destination: NavigateViewDemo2(), isActive: $showView2)
            }
        }
        
    }
}

struct NavigateViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigateViewDemo()
    }
}


struct NavigateViewDemo2: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showView3 = false
    var body: some View {
        NavigationView {
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).toolbar { 
                    ToolbarItemGroup(placement: .bottomBar) {
                        
                        Button {
                            withAnimation {
                                presentationMode.wrappedValue.dismiss()
                            }
                            
                        } label: {
                            Text("Back")
                        }
                        
                        
                        
                        Button {
                            showView3 = true
                            print("value")
                        } label: {
                            Text("Forward") + Text("Forward")
                        }.disabled(true)
                    }
                }
                NavigationLink(
                    "", destination: NavigateViewDemo3()
                                       .navigationBarTitle("View 3")
                                       .navigationBarHidden(true),
                                   isActive: $showView3
                               )
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}


struct NavigateViewDemo3 : View{
    var body: some View{
        Text("3rd View")
    }
}
