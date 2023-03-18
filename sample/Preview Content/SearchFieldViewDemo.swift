//
//  SearchFieldViewDemo.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 09/02/23.
//

import SwiftUI

struct SearchFieldViewDemo: View {
    @Environment(\.dismiss) private var dismiss
        @Environment(\.dismissSearch) private var dismissSearch
    @State private var searchText = ""
    init(){
        setNavigationBarBackgroundColor(backgroundColor:UIColor( Color("primary-color")), titleColor: .white)
    }
        var body: some View {
            NavigationView {
                
                VStack{
                    Text("Searching for \(searchText)")
                    Button(action: {
                        dismiss()
                        dismissSearch()
                    }, label: {
                        Text("Dismiss")
                    })
                        .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                
                            } label: {
                               
                                Text(Image(systemName: "star.fill")).foregroundColor(.white)
                            }

                        }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                
                            } label: {
                                Text(Image(systemName: "gearshape.fill")).foregroundColor(.white)
                            }

                        }
                        
                    }
                        
                }
                }
                
            .searchable(text: $searchText, prompt: "Search").simultaneousGesture(DragGesture().onChanged({ _ in
                dismissSearch()
            }))
        }
}

struct SearchFieldViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        SearchFieldViewDemo()
    }
}


struct SearchView: View {
    let search: String

    @Environment(\.isSearching) var isSearching         // this is never true
    @Environment(\.dismissSearch) var dismissSearch     // calling dismissSearch() has not effect

    var body: some View {
        VStack {
            List {
                if search.isEmpty {
                    ForEach(1 ..< 50){
                        Text("Number \($0)")
                    }
                } else {
                    ForEach(1 ..< 50) {
                        Text("Search Result \($0)")
                    }
                }
            }
            // this always display as "IS NOT SEARCHING"
            // pushing it do not dismiss search!
            Button {
                dismissSearch()
            }
            label: {
                Text("Dismiss Search \(isSearching ? "is searching" : "IS NOT SEARCHING")")
            }
        }
    }
}
struct SearchFieldViewDemo2: View {
    @State private var search = ""

    var body: some View {
        NavigationView {
            SearchView(search: search)
                .navigationTitle("Testing Testing")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $search)
        }
    }
}
struct SearchFieldViewDemo3: View {
    @State var searchText = ""

    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch

    var body: some View {
        NavigationView {
           
            VStack(alignment: .center) {
                Text(isSearching ? "Searching" : "Not Searching")
            }
            .searchable(text: $searchText, placement: .toolbar)
            .onSubmit(of: .search) {
                dismissSearch()
                print(searchText)
            }
        }
    }
}
