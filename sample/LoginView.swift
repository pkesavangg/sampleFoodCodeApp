//
//  LoginView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 16/11/22.
//

import SwiftUI

struct LoginView: View {
    
    
    
    @State var email = ""
  
    @State var password = ""
    @State var selected = ""
    @State var show = false
    @State var navigated = false
    @State private var presentAlert = false
    @State private var isPasswordSecured: Bool = true
    @Environment(\.presentationMode) var presentationMode

    var  isFormValid : Bool {
        !email.isEmpty && !password.isEmpty
    }
    var body: some View {
        NavigationView {
            
            VStack {
                ZStack{
                    Text("")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .top))
                        .frame(maxWidth: .infinity)
                   
                }
                
                
            
                VStack {
                    EmailView(testFieldName: "Email")
                    
                    HStack{
                        Text("Password")
                            .font(.body).frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                            .padding(.top, 30)
                        
                        Button(action: {
                            isPasswordSecured.toggle()
                        }) {
                            Image(systemName: self.isPasswordSecured ? "eye.slash" : "eye")
                                .accentColor(.gray) .padding(.top, 30).padding(.trailing,15)
                        }
                    }
                    
                    
                    if(isPasswordSecured){
                        SecureField("", text: $password)
                            .background(Color(.white))
                            .padding(.leading, 15)
                    }else{
                        TextField("", text: $password)
                            .background(Color(.white))
                            .padding(.leading, 15)
                    }
                   
                    
                    Divider().padding(.horizontal, 15)
                    
                    Button("Forgot your password?") {
                        self.presentAlert = true
                    }.font(.system(size:17))
                        .foregroundColor(ColorCodes.signUpButtonTextColor).frame(maxWidth: .infinity, alignment: .leading) .padding(.leading, 15)
                        .padding(.top, 30)
//                        .alert("Password Reset", isPresented: $presentAlert, actions: {
//                            TextField("Email", text: $email)
//                            Button("Cancel", role: .cancel,action: {}).foregroundColor(ColorCodes.signUpButtonTextColor)
//                            Button("Submit", action: {
//
//                            }).background(ColorCodes.signUpButtonTextColor)
//                        }, message: {
//                            Text("Enter your email below")
//                        })
                   
                }
                
                Spacer()
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()

                        print("tapped!")
                    }, label: {
                        Text(Image(systemName: "arrow.left")).foregroundColor(.white) + Text("BACK").foregroundColor(.white)
                    })
                    Spacer()
                    NavigationLink("", destination: Dashboard(rootIsActive: self.$navigated), isActive: $navigated)
                    Button(action: {
                        self.navigated = true
                        
                    }, label: {
                        if(isFormValid){
                            Text("NEXT")
                                .foregroundColor(Color(.white)) + Text(Image(systemName: "arrow.right"))
                                .foregroundColor(Color(.white))
                        }else{
                            Text("LOG IN")
                                .foregroundColor(Color(.white).opacity(0.4)) + Text(Image(systemName: "arrow.right"))
                                .foregroundColor(Color.white.opacity(0.4))
                        }
                       
                    }).disabled(false)   //.disabled(!isFormValid)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .bottom))
                .frame(maxWidth: .infinity)
            }        }
        .navigationBarBackButtonHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
