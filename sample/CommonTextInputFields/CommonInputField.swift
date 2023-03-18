//
//  CustomInputField.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/03/23.
//
import SwiftUI

struct CommonInputField: View {
    //MARK:- PROPERTIES
    @State var isSecureField = false
    var placeholder: Text
    var textFieldLabel: Text
    var fontName: String = "OpenSans-Regular"
    var fontSize: CGFloat = 18
    var fontColor: Color = Color(.lightGray)
    var foregroundColor: Color?
    var disableAutoCorrection: Bool = true
    var autoCapitalization: Bool = true
    var emailKeyboardType: Bool = false
    var errorMessage : String
    @State var showPasswordEyeIcon : Bool?
    @Binding var username: String
    var editingChanged: (Bool)->() = { _ in } //Whenever the user changes the field it turn to true.
    var commit: ()->() = { } //Similar to on submit it triggers when user hit return in keyboard
    var body: some View {
        ZStack(alignment: .leading) {
            VStack (alignment: .leading){
                Text("\(textFieldLabel)")
                    .font(.callout)
                    .foregroundColor(.black)
                Group {
                    HStack{
                        if(isSecureField){
                            SecureField("\(placeholder)", text: $username, onCommit: commit)
                        }else{
                            TextField("\(placeholder)", text: $username, onEditingChanged: editingChanged, onCommit: commit)
                        }
                        if let toggle =  showPasswordEyeIcon {
                            Image(systemName: toggle ? "eye.slash" : "eye" )
                                .accentColor(.gray)
                                .padding(.trailing, 20)
                                .onTapGesture {
                                    self.showPasswordEyeIcon!.toggle()
                                    self.isSecureField.toggle()
                                }
                        }
                    }
                }
                .frame(height: 10)
                    .keyboardType( emailKeyboardType ? .emailAddress : .default)
                    .disableAutocorrection(disableAutoCorrection)
                    .autocapitalization(autoCapitalization ? .words : .none)
                    .foregroundColor((foregroundColor != nil) ?  foregroundColor : Color.primary)
                    .textContentType(.emailAddress)
                Divider()
                    .foregroundColor(Color(.lightGray))
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(Color(.red))
                    .frame(height: 10)
            }.padding(.bottom)
        }
    }
}


