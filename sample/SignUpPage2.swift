//
//  SignUpPage2.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 16/11/22.
//

import SwiftUI

struct SignUpPage2: View {
    @Environment(\.presentationMode) var presentationMode

    @State var password = ""
    @State var confirmPassword = ""
    @State var selected = ""
    @State var show = false
    @State var navigated = false
    @State var checkState: Bool = true

    @State private var emailString  : String = ""
    @State private var textEmail    : String = ""
    @State private var isEmailValid : Bool   = true
    @State private var isPasswordSecured: Bool = true
    @State private var isConfirmPasswordSecured: Bool = true
    var  isFormValid : Bool {
        isEmailValid && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword
    }
    
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                Text("")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .top))
                    .frame(maxWidth: .infinity)
                
                VStack{
                    
                    EmailView(testFieldName: "Email*")
                    
                    HStack{
                        Text("Password*")
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
                    
                    HStack{
                        Text("Confirm Password*")
                            .font(.body).frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                            .padding(.top, 30)
                        
                        Button(action: {
                            isConfirmPasswordSecured.toggle()
                        }) {
                            Image(systemName: self.isConfirmPasswordSecured ? "eye.slash" : "eye")
                                .accentColor(.gray) .padding(.top, 30).padding(.trailing,15)
                        }
                    }
                    
                    
                    
                    
                    if(isConfirmPasswordSecured){
                        SecureField("", text: $confirmPassword)
                            .background(Color(.white))
                            .padding(.leading, 15)
                    }else{
                        TextField("", text: $confirmPassword)
                            .background(Color(.white))
                            .padding(.leading, 15)
                    }
                    
                    Divider().padding(.horizontal, 15)
                    
                    
                   
                }
                Button(action:
                            {
                                //1. Save state
                                self.checkState = !self.checkState
                                print("State : \(self.checkState)")
                                
                                
                        }) {
                            HStack(alignment: .top, spacing: 10) {
                               
                                        //2. Will update according to state
                                ZStack{
                                    Circle()
                                             .fill(self.checkState ? Color.green : Color.white)
                                             .frame(width:20, height:20, alignment: .center)
                                             .cornerRadius(5)
                                    Text(Image(systemName: "checkmark")).font(.system(size: 10))
                                    if(!self.checkState){
                                        Circle().stroke(Color.gray, lineWidth: 1).frame(width: 23, height: 23)
                                    }
                                }
                                Text("Opt-in to Greater Goods Deals").foregroundColor(.black)
                            }
                        }.font(.body).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 15).padding(.top, 30)
                        .foregroundColor(Color.white)
                Spacer()
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text(Image(systemName: "arrow.left")).foregroundColor(.white) + Text("BACK").foregroundColor(.white)
                    })
                    Spacer()
                    NavigationLink("", destination: Dashboard(rootIsActive: self.$navigated), isActive: $navigated)
                    Button(action: {
                        self.navigated = true
                    }, label: {
                        if(isFormValid){
                            Text("SIGN UP")
                                .foregroundColor(Color(.white)) + Text(Image(systemName: "arrow.right"))
                                .foregroundColor(Color(.white))
                        }else{
                            Text("SIGN UP")
                                .foregroundColor(Color(.white).opacity(0.4)) + Text(Image(systemName: "arrow.right"))
                                .foregroundColor(Color.white.opacity(0.4))
                        }
                        
                    }).disabled(!isFormValid)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .bottom))
                .frame(maxWidth: .infinity)
            }
            
        }.navigationBarBackButtonHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SignUpPage2_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage2()
    }
}
