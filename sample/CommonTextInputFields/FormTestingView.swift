//
//  FormTestingView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/03/23.
//

enum LoginFormFocusText {
    case emailField , nameField, passwordField
}
import SwiftUI


struct FormTestingView: View {
    @FocusState private var focusField : LoginFormFocusText?
    @StateObject private var viewModel = FormViewModel.shared
    @State var show = true
    var body: some View {
        NavigationView {
            Form{
                VStack{
                    CommonInputField(placeholder:Text("info@greatergoods.com"),
                                        textFieldLabel:  Text("Email"),
                                        autoCapitalization: false, emailKeyboardType: true,
                                        errorMessage: viewModel.emailErrorMessage,
                                        username: $viewModel.emailFieldValue,
                                        editingChanged: { isEditing in
                                                        if isEditing == false {
                                                            self.viewModel.emailFieldNotFocused = true} },
                                        commit: {  focusField = .nameField})
                                        .submitLabel(.next)
                                        .focused($focusField , equals: .emailField)
                                        .onTapGesture {
                                        self.viewModel.isEmailFieldTouched  = true
                                        }
                    
                    CommonInputField( placeholder:Text("Michael"),
                                         textFieldLabel:  Text("User Name"),
                                         errorMessage: viewModel.userNameErrorMessage,
                                         username: $viewModel.userNameFieldValue,
                                         editingChanged: { isEditing in
                                                if isEditing == false {
                                                    self.viewModel.userNameFieldNotFocused = true
                                                }},
                                      commit: { focusField = .passwordField} )
                                        .focused($focusField , equals: .nameField)
                                        .submitLabel(.next)
                                        .onTapGesture {
                                            self.viewModel.isuserNameFieldTouched  = true
                                        }
                  
                        CommonInputField(isSecureField: true,
                                         placeholder:Text("45*ffff@"),
                                         textFieldLabel:  Text("Password*"),
                                         errorMessage: viewModel.passwordErrorMessage,
                                         showPasswordEyeIcon: true,
                                         username: $viewModel.passwordFieldValue,
                                         editingChanged: { isEditing in
                                                    if isEditing == false {
                                                        self.viewModel.userNameFieldNotFocused = true
                                                    }},
                                         commit: { focusField = nil} )
                                         .focused($focusField , equals: .passwordField)
                                         .submitLabel(.done)
                                         .onTapGesture {
                                                self.viewModel.isPasswordFieldTouched  = true
                                          }
                }
            }.gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
            .navigationBarTitle("Login Form")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormTestingView()
    }
}

//struct ContentViews: View {
//    @State private var text: String = ""
//    @State private var isFieldValid: Bool = true
//
//    var body: some View {
//        VStack {
//            TextField("Enter your name", text: $text)
//                .padding()
//                .onChange(of: text, perform: { value in
//                    isFieldValid = !value.isEmpty
//                })
//                .foregroundColor(isFieldValid ? .black : .red)
//
//            if !isFieldValid {
//                Text("Field cannot be empty")
//                    .foregroundColor(.red)
//            }
//        }
//    }
//}
