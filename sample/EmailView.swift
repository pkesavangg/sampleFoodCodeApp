//
//  EmailView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 16/11/22.
//

import SwiftUI

struct EmailView: View {
    @State private var emailString  : String = ""
    @State private var textEmail    : String = ""
    @State private var isEmailValid : Bool   = true
    
    var testFieldName : String
    
    var body: some View {
        Text(testFieldName)
            .font(.body).frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
            .padding(.top, 50)
        
        TextField("", text: $textEmail, onEditingChanged: { (isChanged) in
            if !isChanged {
                if self.textFieldValidatorEmail(self.textEmail) {
                    self.isEmailValid = true
                } else {
                    self.isEmailValid = false
                    self.textEmail = ""
                }
            }
        })
        
        .background(Color(.white))
        .padding(.leading, 15)
        Divider().padding(.horizontal, 15)
        
        if !self.isEmailValid {
            Text("Must use a valid email").font(.body).frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .foregroundColor(Color.red)
        }
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        //        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView(testFieldName: "Email*")
    }
}
