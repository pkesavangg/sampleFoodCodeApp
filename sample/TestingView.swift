import SwiftUI
import Foundation

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

func setNavigationBarBackgroundColor(backgroundColor: UIColor, titleColor: UIColor){
   
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
}

struct NavigationColorTestView: View {
    


        init() {
            setNavigationBarBackgroundColor(backgroundColor: .systemGreen, titleColor: .white)
            
            
            
        }
    var body: some View {
        NavigationView {
            
                Text("Don't use .appearance()!")
            
            .navigationBarTitle("LOG IN", displayMode: .inline) .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Text(Image(systemName: "arrow.left")).foregroundColor(.white)
                    }

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text(Image(systemName: "arrow.right")).foregroundColor(.white)
                    }

                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Text(Image(systemName: "arrow.left")).foregroundColor(.red)
                    }

                }
            }
            
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NavigationColorTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationColorTestView()
    }
}
