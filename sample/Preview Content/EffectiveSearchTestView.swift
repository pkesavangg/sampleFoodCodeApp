//
//  EffectiveSearchTestView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 24/02/23.
//

import SwiftUI

struct EffectiveSearchTestView: View {
    @State private var searchText = ""
    @StateObject private var vm = Json()
 
    var filteredFoodCodes: [String: [Model]]
    {
        if searchText.isEmpty {
            return Dictionary(grouping: vm.foodItems, by: {$0.category})
            //return vm.foodItems // Display all food code items if search query is empty
        } else {
            let filteredData =  vm.foodItems.filter { $0.searchString.localizedCaseInsensitiveContains(searchText) }
            return Dictionary(grouping: filteredData, by: {$0.category})
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(filteredFoodCodes.sorted{ $0.key < $1.key }, id: \.0) { (category, foodCodes) in
                        DisclosureGroup{
                            ForEach(foodCodes) { foodCode in
                                Text(foodCode.name)
                            }
                        } label: {
                            Text(category)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search")
            .navigationTitle("Food Codes")
        }
    }
}

struct EffectiveSearchTestView_Previews: PreviewProvider {
    static var previews: some View {
        EffectiveSearchTestView()
    }
}
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Search", text: $text, onCommit: {
                // Perform search action
            })
            .autocapitalization(.none)
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}
