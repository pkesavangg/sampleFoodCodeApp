//
//  HelpView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 21/11/22.
//

import SwiftUI
import MessageUI



struct HelpView: View {
    
   let email = "info@greatergoods.com"
   let phoneNumber = "866.991.8494"
   let urlLink = "https://greatergoods.com/service/0451"
   let aboutLink = "https://greatergoods.com/community"
    
   @State private var url = ""
    
   @State var navigateToSiteLink = false
   
    var body: some View {
        
        NavigationView {
            VStack {
                
               
                Image("Pat_Ashley").resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Have a question? we're here for you. Contact us and we'll be happy to help.").navigationTitle("Help").navigationBarTitleDisplayMode(.inline).padding(.all,10).toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack{
                            Button("BACK") {
                                print("Pressed")
                            }
                            Spacer()
                            Text("Help")
                           
                           
                        }
                    }
                }
                
                NavigationLink("", destination: UrlView(urlValue: url), isActive: $navigateToSiteLink )

                VStack{
                    HStack{
                        Text("User Manual: ").font(.body)
                        Button {
                            self.url = urlLink
                            self.navigateToSiteLink = true
                        } label: {
                            Text("greatergoods.com/")
                        }
                        Spacer()
                    }
                    HStack{
                        Text("Phone: ").font(.body)
                        Link(phoneNumber, destination: URL(string: "tel:\(phoneNumber)")!).foregroundColor(.green)
                        Spacer()
                    }
                    HStack{
                        Text("Email: ").font(.body)
                        Link(email, destination: URL(string: "mailto:\(email)")!).foregroundColor(.green)
                  
                        Spacer()
                    }
                }.padding()
                
                
                Button(action: {
                    self.url = aboutLink
                    self.navigateToSiteLink = true
                }) {
                    Text("ABOUT US").padding().foregroundColor(.white)
                }
                .background(Color.green).cornerRadius(10.0).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                Spacer()
                Text("App version: 2.0.0")
                Spacer()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
