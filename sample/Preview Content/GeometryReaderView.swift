//
//  GeometryReaderView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 08/02/23.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        NavigationView {
            ZStack{
                
                Color("primaryColor").edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    VStack {
                       VStack{
                        HStack{
                            Spacer()
                            Image("icon")
                                .resizable()
                                .frame(width: geometry.size.width > 700 ? geometry.size.width * 0.48 : geometry.size.width * 0.8, height:geometry.size.width > 700 ? geometry.size.width * 0.48 : geometry.size.width * 0.78)
                                .padding(EdgeInsets(top: geometry.size.width > 700 ? 30: 0, leading: 0, bottom: 0, trailing: geometry.size.width > 700 ? geometry.size.width * 0.12 : geometry.size.width * 0.1))
                                .aspectRatio(contentMode: .fit)

                            Spacer()
                        }

                        }
                           
                     
                    Spacer()
                        VStack(spacing: geometry.size.height *  0.03){
                            HStack{
                            Spacer()
                                Button{
                                    print("Button pressed!")
                                } label:{
                                    Text("SIGN UP")
                                        .foregroundColor(Color("primaryColor"))
                                        .clipShape(Capsule())
                                        .frame( width: geometry.size.width > 700 ?  geometry.size.width *  0.7 : geometry.size.width *  0.8, height: geometry.size.width > 700 ? geometry.size.height * 0.1 : geometry.size.height * 0.11)
                                        .background(.white).cornerRadius( geometry.size.width > 700 ? geometry.size.width * 0.8 :geometry.size.width * 0.5)
                                        .font(.system(size: geometry.size.width > 700 ? 60: 34))
                                        .minimumScaleFactor(0.5)
                                }
                                
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Button {
                                    print("Button pressed!")
                                } label: {
                                    Text("LOG IN").foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .frame( width: geometry.size.width > 700 ?  geometry.size.width *  0.7 : geometry.size.width *  0.8, height: geometry.size.width > 700 ? geometry.size.height * 0.1 : geometry.size.height * 0.11)
                                        .background(Color("secondary-color")).cornerRadius( geometry.size.width > 700 ? geometry.size.width * 0.8 :geometry.size.width * 0.5)
                                        .font(.system(size: geometry.size.width > 700 ? 60: 34))
                                        .minimumScaleFactor(0.5)
                                }
                                Spacer()
                            }
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: geometry.size.width > 700 ? geometry.size.width * 0.2 : geometry.size.width * 0.23, trailing: 0))
                            
                       
                        
                        Spacer()
                        
                        VStack{
                            HStack{
                                Text("Version 2.0.0 |")
                                Button {
                                    
                                } label: {
                                      Text("PRIVACY POLICY")
                                }
                            }
                           
                            Button {
                                
                            } label: {
                                    Text("QUESTIONS?")
                            }
                        }.frame(width: geometry.size.width > 700 ?  geometry.size.width *  0.8 : geometry.size.width *  0.9)
                            .minimumScaleFactor(0.5)
                            .foregroundColor(.white)
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .navigationBarHidden(true)
                            .padding()
                        
                    }
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
