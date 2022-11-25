//
//  TestingView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/11/22.
//

import SwiftUI
struct TestingView: View {
    
    @ObservedObject private var vm = TestingData()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    
                    ForEach(vm.foodList) { item in
                        DisclosureGroup{
                            if let subList = item.subMenuItems {
                                ForEach(subList) { val in
                                    HStack{
                                        HStack{
                                            
                                            Text(val.name)
                                        }
                                        Spacer()
                                        Text(val.code)
                                    }
                                }
                            }
                            
                            
                        } label: {
                            ZStack{
                                HStack{
                                    Text(item.name).padding(.trailing, 10)
                                    Text("\(item.subMenuItems?.count ?? 0)")
                                }
                                
                            }
                        }
                        
                    }
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}





//extension UINavigationBarAppearance {
//    func setColor(title: UIColor? = nil, background: UIColor? = nil) {
//        configureWithTransparentBackground()
//        if let titleColor = title {
//            largeTitleTextAttributes = [.foregroundColor: titleColor]
//            titleTextAttributes = [.foregroundColor: titleColor]
//        }
//        backgroundColor = background
//        UINavigationBar.appearance().scrollEdgeAppearance = self
//        UINavigationBar.appearance().standardAppearance = self
//    }
//}

//struct TestingView: View {
//    @State var searchText = ""
//    var body: some View {
//        NavigationView {
//
//
//
//            Text("").padding()
//                .toolbar {
//
//                        ToolbarItemGroup(placement: .navigationBarLeading) {
//                            Button {
//                                print("pressed")
//                            } label: {
//                                Text("button")
//                            }
//                        }
//
//                    ToolbarItemGroup(placement: .navigation) {
//                        Button {
//                            print("pressed")
//                        } label: {
//                            Text("button")
//                        }.padding(.leading, 316)
//                    }
//
//                        ToolbarItemGroup(placement: .navigationBarTrailing) {
//                            Button {
//                                print("pressed")
//                            } label: {
//                                Text("button")
//                            }
//                        }
//
//
//                    }
//        }.navigationViewStyle(StackNavigationViewStyle()).onAppear {
//            UINavigationBarAppearance()
//                .setColor(title: .white, background: UIColor(ColorCodes.signUpButtonTextColor))
//        }
//    }
//
//}
import SwiftUI
import Foundation




struct FoodCodeCategories: Identifiable {
    var id = UUID()
    var name: String
    var subMenuItems: [Model]?
}

class TestingData  : ObservableObject{
    @Published var foodItems = [Model]()
    private var db = Database()
    @Published var foodList =  [FoodCodeCategories]()
    
    @Published var listValues = [String : [Model]]()
    
    @Published var favItems = [Model]()
    @Published var items = [Model]()
    @Published var showingFavs = false
    @Published var savedItems : Set<String> = []
    
    
    init(){
        self.loadData()
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "items", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            // print(data)
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([Model].self, from: data)
                    DispatchQueue.main.sync {
                        self.foodItems = json
                        self.listValues =  Dictionary(grouping: self.foodItems, by: { $0.category })
                        self.arrangeData(values: json)
                    }
                }else {
                    print("No Data ")
                }
            }catch{
                
            }
            
        }
        dataTask.resume()
    }
    
    
    func arrangeData(values : [Model]){
        for item in values{
            let modelValue =  foodItems.filter({ element in
                element.category == item.category
            })
            
            foodList.append(FoodCodeCategories(name: item.category, subMenuItems: modelValue))
        }
        foodList = foodList.unique(){$0.name ?? ""}
    }
    
}




struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
