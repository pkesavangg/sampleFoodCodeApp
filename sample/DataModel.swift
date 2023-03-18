//
//  DataModel.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 19/11/22.
//

import Foundation

    



struct Model: Codable, Identifiable, Hashable {
    enum CodingKeys : CodingKey {
        case name
        case code
        case category
        case searchString
        case favorite
    }
    var id = UUID ()
    var name: String
    var code: String
    var category: String
    var searchString: String
    var favorite: Bool?
}

extension Array {
    func unique<T: Hashable>(map : ((Element) -> (T))) -> [Element]{
        var set  = Set<T>()
        var arrayOrdered = [Element]()
        
        for value in self{
            if !set.contains(map(value)){
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        return arrayOrdered
    }
}


class Json : ObservableObject{
    
    @Published var foodItems = [Model]()
    private var db = Database()
    
   
    
    
    @Published var listValues = [String : [Model]]()
    
    @Published var favItems = [Model]()
    @Published var items = [Model]()
    @Published var showingFavs = false
    @Published var savedItems : Set<String> = []
    
    
    
    var favouritesItems : [Model] {
        return (foodItems.filter{
            savedItems.contains($0.code)
        })
    }
    
    
    var filteredItems: [Model]{
        return foodItems
    }
    
    
    func contains(_ item: Model) -> Bool{
        savedItems.contains(item.code)
    }
    
    func sortFavs() -> [Model]{
        var values  = [Model]()
        for item in foodItems {
            if(savedItems.contains(item.code)){
                values.append(item)
            }
        }
        return values.unique(){$0.code ?? ""}
    }
    
    func toggleFav(item: Model){
        if(contains(item)){
            savedItems.remove(item.code)
        } else {
            savedItems.insert(item.code)
        }
        db.save(items: savedItems)
    }
    
    
    init() {
        self.loadData()
        savedItems = db.load()
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
                    }
                }else {
                    print("No Data ")
                }
            }catch{
                
            }
            
        }
        dataTask.resume()
    }
    
}

