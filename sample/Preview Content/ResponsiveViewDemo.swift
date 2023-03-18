//
//  ResponsiveViewDemo.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 08/02/23.
//
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
import SwiftUI

struct ResponsiveViewDemo: View {
    var body: some View {
        NavigationView {
            ZStack{
                
                Color("primaryColor").edgesIgnoringSafeArea(.all)
                VStack {
                   
                    Image("icon").resizable().frame(width: UIScreen.screenSize.width * 0.75,height: UIScreen.screenSize.width * 0.75)
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 0, leading: UIScreen.screenSize.width * 0.10, bottom: 0, trailing: UIScreen.screenSize.width * 0.2)).minimumScaleFactor(0.5)
                        
                   Spacer()
                   
                    VStack(spacing: UIScreen.screenSize.height * 0.02){
                        Button("SIGN UP") {
                            //self.signUpNavigated = true
                            print("Button pressed!")
                        }
                        .foregroundColor(Color("primaryColor"))
                        .clipShape(Capsule())
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: UIScreen.screenSize.width * 0.7, minHeight: 20, maxHeight: UIScreen.screenSize.height * 0.1)
                        //.frame(width: UIScreen.screenSize.width * 0.7, height: UIScreen.screenSize.height * 0.1)
                        .background(.white).cornerRadius(UIScreen.screenSize.width * 0.8)
                        .font(.system(size: UIScreen.screenSize.width * 0.11))
                        .minimumScaleFactor(0.5)
                        
                        
                        
                        Button("LOG IN") {
                            
                            print("Log In pressed!")
                        }
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                        .frame(width: UIScreen.screenSize.width * 0.7, height: UIScreen.screenSize.height * 0.1)
                        .background(Color("secondary-color")).cornerRadius(UIScreen.screenSize.width * 0.8)
                        .font(.system(size: UIScreen.screenSize.width * 0.1))
                        .minimumScaleFactor(0.5).padding(.trailing).padding(.leading)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: UIScreen.screenSize.width * 0.2, trailing: 0))
                    
                    Spacer()
                    Button("Version 2.0.0-dev | PRIVACY POLICY QUESTIONS ?") {
                        
                    }.frame(width: 300)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .navigationBarHidden(true)
                        .padding()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        }
}

struct ResponsiveViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ResponsiveViewDemo()
    }
}
