////
////  Alert.swift
////  sample
////
////  Created by Kesavan Panchabakesan on 03/03/23.
////
//import SwiftUI
//struct CommonAlert: View {
//    let title: String
//       let message: String
//       let dismissButtonTitle: String
//       
//       @Binding var isPresented: Bool
//       
//       var body: some View {
//           VStack{
//               Group {
//                   if isPresented {
//                       Alert(title: Text(title), message: Text(message), dismissButton: .default(Text(dismissButtonTitle)) {
//                           isPresented = false
//                       })
//                   }
//               }
//               .onAppear {
//                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                       isPresented = true
//                   }
//               }
//           }
//          
//       }
//   }
//struct AlertTestingView: View {
//    @State private var showAlert = false
//    
//    var body: some View {
//        Button("Show alert") {
//            showAlert = true
//        }
//        .alert(isPresented: $showAlert) {
//            CommonAlert(title: "Alert Title", message: "Alert Message", dismissButtonTitle: "OK", isPresented: $showAlert)
//        }
//    }
//}
