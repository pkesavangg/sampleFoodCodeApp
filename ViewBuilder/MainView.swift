//
//  MainView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/03/23.
//

import SwiftUI

struct HeaderView<Content: View>: View {
    var headerTitle: String
    var footerTitle: String
    var content: Content
    
    init(headerTitle: String, footerTitle: String, @ViewBuilder content: () -> Content) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.content = content()
    }
    var body: some View {
        VStack{
            Text(headerTitle)
                .font(.title)
                .bold()
            Spacer()
            content
            Spacer()
            Text(footerTitle)
                .font(.title)
                .bold()
        }
    }
}


struct Subjectview: View{
    var body: some View{
        Text("Subject View")
    }
}


struct MainView: View {
    var body: some View {
        NavigationView {
            VStack{
                HeaderView(headerTitle: "Product Title",footerTitle: "Footer") {
                    VStack{
                        Text("Title")
                        Text("Title")
                        Text("Title")
                        Text("Title")
                    }
                }
//                NavigationLink("Navigate") {
//                    HStack{
//                        Text("Title")
//                    }
//                }
            }
            
        }
        
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
