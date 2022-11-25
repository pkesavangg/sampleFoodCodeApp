

import SwiftUI

struct Dashboard: View {
    @Binding var rootIsActive : Bool
    @StateObject private var vm = Json()
    @State var FavouritesViewNavigated = false
    @State var show = false
    @State private var searchText = ""
   
    var searchResults: [Model] {
        if searchText.isEmpty {
            return vm.filteredItems
        } else {
            return vm.filteredItems.filter { $0.searchString.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var dictValues : [String : [Model]]{
        return Dictionary(grouping:searchResults, by: { $0.category })
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {

                
                ZStack{
                    Text("")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(ColorCodes.signUpButtonTextColor.ignoresSafeArea(edges: .top))
                        .frame(maxWidth: .infinity)
                    HStack{
                        Button {
                            print("Settings Clicked")
                        } label: {
                            Text(Image(systemName: "gear")).foregroundColor(.black).padding(.leading, 20)
                        }
                        
                        Spacer()
                        
                      Text("").searchable(text: $searchText).padding(.leading, 40)
                        
                        Spacer()
                        
                        Button {
                            self.FavouritesViewNavigated = true
                        } label: {
                            Text(Image(systemName: "star.fill")).foregroundColor(.black).padding(.trailing, 20)
                        }
                    }.padding(.bottom,20)
                    
                }
                
                
                NavigationLink("", destination: FavouritesView(), isActive: $FavouritesViewNavigated)
                
                
                List{
                    ForEach(dictValues.keys.sorted(), id: \.self) { key in
                        DisclosureGroup{
                                ForEach(dictValues[key]!) { val in
                                    HStack{
                                        HStack{
                                            Image(systemName: vm.contains(val) ? "star.fill" : "star")
                                                .foregroundColor(.green)
                                                .onTapGesture {
                                                     vm.toggleFav(item: val)
                                                  }
                                            Text(val.name)
                                        }
                                        Spacer()
                                        Text(val.code)
                                    }
                                }
                        } label: {
                            ZStack{
                                HStack{
                                    Text(key).padding(.trailing, 10)
                                    Text("\(dictValues[key]?.count ?? 0)")
                                }
                                
                            }
                        }
                       
                    }
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
}
