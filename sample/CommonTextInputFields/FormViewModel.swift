//
//  FormViewModel.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/03/23.
//

import Foundation

class FormViewModel : ObservableObject {
    @Published var emailFieldValue = ""
    @Published var emailFieldNotFocused = false
    @Published var isEmailFieldTouched : Bool = false
    @Published var errorMsg: String = ""
    
    
    @Published var userNameFieldValue = ""
    @Published var userNameFieldNotFocused = false
    @Published var isuserNameFieldTouched : Bool = false
    @Published var userNameErrorMsg: String = ""
    
    @Published var passwordFieldValue : String = ""
    @Published var isPasswordFieldTouched : Bool = false
    
    static var shared: FormViewModel = FormViewModel()
    
    func validatingEmailTextField(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    var emailErrorMessage: String{
        if( self.emailFieldNotFocused && self.isEmailFieldTouched && self.emailFieldValue.count > 0) {
            if(!validatingEmailTextField(emailFieldValue)){
                return "Must use a valid email"
            }else{
                return ""
            }
        }
        
        if (self.emailFieldNotFocused && self.emailFieldValue.isEmpty && self.isEmailFieldTouched ) {
            return "Must not be left blank"
        }
        return ""
    }
    
    
    var userNameErrorMessage : String {
        if (self.userNameFieldNotFocused && self.userNameFieldValue.isEmpty && self.isuserNameFieldTouched ) {
            return "Must not be left blank"
        }
        return ""
    }
    
    var passwordErrorMessage : String {
        if(self.isPasswordFieldTouched &&  !self.passwordFieldValue.isEmpty && passwordFieldValue.count < 6){
            return "Password must be 6 characters long"
        }
        if ( self.passwordFieldValue.isEmpty && self.isPasswordFieldTouched ) {
            return "Must not left blank"
        }
        return  ""
    }
    
    
}

