//
//  LandingPage.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 16/11/22.
//

import SwiftUI

struct LandingPage: View {
    @State var signUpNavigated = false
    @State var loginNavigated = false
    @State var privateScreen  = false
    @State var isActive : Bool = false
    
    var privacyLink = "https://greatergoods.com/privacy?landing=true"
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.40, green: 0.73, blue: 0.42, opacity:  1.00).edgesIgnoringSafeArea(.all)
                VStack{
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 313, height: 313)
                    
                    Button("SIGN UP") {
                        self.signUpNavigated = true
                        print("Button pressed!")
                    }
                    .buttonStyle(MyButtonStyle(backgroundColor: .white,buttonTextColor: ColorCodes.signUpButtonTextColor))
                    .padding(.all)
                    
                    
                    
                    Button("LOG IN") {
                        
                        self.loginNavigated = true
                        print("Log In pressed!")
                    }
                    .buttonStyle(MyButtonStyle(backgroundColor: ColorCodes.loginButtonBackgroundColor, buttonTextColor: .white))
                    
                    NavigationLink("", destination: SignUpPage(), isActive: $signUpNavigated)
                    NavigationLink("", destination: LoginView(), isActive: $loginNavigated)
                    Spacer()
                    
//                    NavigationLink("", destination: UrlView(urlValue: privacyLink), isActive: $privateScreen )
                    
                    Button("Version 2.0.0-dev | PRIVACY POLICY QUESTIONS ?") {
                        self.privateScreen  = true
                    }.font(.system(size:20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.all).navigationBarHidden(true)
                    
                }
            }
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
