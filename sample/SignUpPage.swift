//
//  SignUpPage.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 13/11/22.
//

import SwiftUI

var data = ["Amazon (Model #451)" , "Bed, Bath, & Beyond/Target (Model #450)"]

struct SignUpPage: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var selected = ""
    @State var show = false
    @State var navigated = false
    @Environment(\.presentationMode) var presentationMode

    var  isFormValid : Bool {
        !firstName.isEmpty && !lastName.isEmpty
    }
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .top))
                    .frame(maxWidth: .infinity)
                
                VStack {
                    Text("First Name*")
                        .font(.body).frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.top, 50)
                    
                    TextField("", text: $firstName)
                        .background(Color(.white))
                        .padding(.leading, 15)
                    
                    Divider().padding(.horizontal, 15)
                    
                    Text("Last Name*").font(.body).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 15)
                        .padding(.top, 30)
                    TextField("", text: $lastName)
                        .background(Color(.white))
                        .padding(.leading, 15)
                    
                    Divider().padding(.horizontal, 15)
                    checkBox(selected: self.$selected, show: self.$show)
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
                    NavigationLink("", destination: SignUpPage2(), isActive: $navigated)
                    Button(action: {
                        self.navigated = true
                        print(lastName, firstName, selected)
                    }, label: {
                        if(isFormValid){
                            Text("NEXT")
                                .foregroundColor(Color(.white)) + Text(Image(systemName: "arrow.right"))
                                .foregroundColor(Color(.white))
                        }else{
                            Text("NEXT")
                                .foregroundColor(Color(.white).opacity(0.4)) + Text(Image(systemName: "arrow.right"))
                                .foregroundColor(Color.white.opacity(0.4))
                        }
                       
                    }).disabled(false)   //.disabled(!isFormValid)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .bottom))
                .frame(maxWidth: .infinity)
                
                
            }
        }
        .navigationBarBackButtonHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
}





//

struct checkBox: View{
    @Binding var selected : String
    @Binding var show: Bool
    
    var body: some View{
        
        VStack (alignment: .leading, spacing: 20){
            Text("Where did you buy your scale? (optional)")
                .font(.body)
                .padding(.top)
                .foregroundColor(.black)
            
            ForEach(data,id:\.self){ i in
                Button {
                    self.selected = i
                } label: {
                    HStack{
                        Text(i).font(.caption2)
                        Spacer()
                        if self.selected == i {
                            Text(Image(systemName: "checkmark"))
                                .foregroundColor(ColorCodes.signUpButtonTextColor)
                                .padding(.trailing, 15)
                        }
                    }.foregroundColor(.black)
                      .padding(.top)
                }
                Divider()
            }
        }.padding(.vertical)
            .padding(.horizontal,18)
            
    }
}


struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage().previewDevice("iPhone 12")
    }
}
