//
//  AlertViewDemo.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 09/02/23.
//

import SwiftUI

struct AlertViewDemo: View {
    @State var firstNameFieldValue = ""
    @State var lastNameFieldValue = ""
    @State var showForgotPasswordAlert = false
    @State var alertBoxTextField = ""
    
    init(){
      
    }
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section {
                        TextField("FirstName*", text: $firstNameFieldValue).autocorrectionDisabled(true)
                    }
                    
                    Section {
                        TextField("LastName*", text: $lastNameFieldValue)
                    }
                    
                    Button {
                        self.showForgotPasswordAlert = true
                        self.alertBoxTextField = self.firstNameFieldValue
                        
                        
                    } label: {
                        Text("Forgot Password?").foregroundColor(.green)
                    }
                    
                    
                }.navigationTitle("Login Page")
               
                if(showForgotPasswordAlert){
                    CustomAlert(showForgotPasswordAlert: $showForgotPasswordAlert, alertBoxTextField: self.firstNameFieldValue, titleText: "Password Reset",
                    bodyText: "Enter your name below.", textFieldPlaceHolder: "FirstName")
                    
                }
                
            }
        }
    }
}

struct CustomAlert: View {
    @Binding var showForgotPasswordAlert: Bool
    @State var alertBoxTextField = ""
    var titleText = ""
    var bodyText = ""
    var textFieldPlaceHolder = ""
    
    var body: some View {
        if(showForgotPasswordAlert){
            Text("").alert(Text(titleText), isPresented: $showForgotPasswordAlert, actions: {
                 
                 TextField(textFieldPlaceHolder, text: $alertBoxTextField).accentColor(.blue)
                 Button("Cancel", action: {})
                 Button("Submit",action: {})
             },message: {
                 Text(bodyText).font(.largeTitle)
             })
        }
        
            
        
       
    }
}

struct AlertViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        AlertViewDemo()
    }
}
