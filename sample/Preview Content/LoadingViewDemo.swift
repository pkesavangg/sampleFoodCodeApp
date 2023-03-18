//
//  LoadingViewDemo.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 08/02/23.
//

import SwiftUI

struct LoadingViewDemo: View {
    @StateObject var loadingDemoViewModel = LoadingDemoViewModel.shared
    var showLoader = false
    var body: some View {
        LoadingView(isShowing: .constant(loadingDemoViewModel.showLoading), loaderMessage: .constant("Logging In")) {
            NavigationView {
                List {
                    ForEach(loadingDemoViewModel.apiComments, id: \.id) { element in
                        ListCell(listItem: element)
                    }
                }.navigationTitle("List")
            }
        }
    }
}

struct ListCell : View {
    let listItem: Comments
    var body: some View {
        Text(listItem.email)
    }
}


struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    @Binding var loaderMessage: String
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    HStack(spacing: 15){
                        ActivityIndicator(isAnimating: .constant(true), style: .medium)
                        Text("\(loaderMessage)").fontWeight(.medium)
                    }
                   
                }
                .frame(width: geometry.size.width / 2.5,
                       height: geometry.size.height / 11)
                .background(Color(.white))
                .foregroundColor(Color.primary)
                .cornerRadius(8)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }

}
struct LoadingViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewDemo()
    }
}

//struct LoadingView: View {
//    var body: some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.gray)
//                .frame(width: 200, height: 70)
//            HStack{
//                ProgressView()
//                // and if you want to be explicit / future-proof...
//                    .progressViewStyle(CircularProgressViewStyle())
//                Text(" Loading...").foregroundColor(.white)
//            }
//
//        }
//
//
//
//    }
//}
