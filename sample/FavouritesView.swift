
import SwiftUI

struct FavouritesView: View {
    @StateObject private var vm = Json();
    @State var dashBoardViewNavigated = false;
    var body: some View {
        
        VStack {
            ZStack{
                Text("Testing").foregroundColor(.white).font(.callout).navigationTitle("Favourites").navigationBarTitleDisplayMode(.inline).font(.title)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .top))
                    .frame(maxWidth: .infinity)
                HStack{
                    Button {
                        self.dashBoardViewNavigated = true
                        print("Settings Clicked")
                    } label: {
                        Text(Image(systemName: "arrow.left")).foregroundColor(.white).padding(.leading, 20)
                    }
                    
                    Spacer()
                }.padding(.bottom,20)
                
            }
            
            NavigationLink("", destination: Dashboard(rootIsActive: self.$dashBoardViewNavigated), isActive: $dashBoardViewNavigated)
            
            NavigationView {
                List{
                    ForEach(vm.sortFavs() , id: \.self) { key in
                        HStack{
                            Image(systemName: vm.contains(key) ? "star.fill" : "star")
                                .foregroundColor(.green)
                                .padding(.trailing,10)
                                .onTapGesture {
                                    vm.toggleFav(item: key)
                                }
                            Text(key.name)
                            Spacer()
                            Text(key.code)
                        }
                    }
                }
                
            }.navigationBarBackButtonHidden(true).navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
