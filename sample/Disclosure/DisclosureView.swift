//
//  DisclosureView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/02/23.
//

import SwiftUI



struct FoodCodeDataModel: Codable, Identifiable, Hashable {
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


struct DisclosureView: View {
    let items = ["Item 1": [0,1,2,3,4,5,6,7,8], "Item 2": [0,1,2,3,4,5,6,7,8], "Item 3": [0,1,2,3,4,5,6,7,8]]
    @State private var expandedItem: String?
    
    var body: some View {
        
        VStack{
            List {
                ForEach(items.keys.sorted(), id: \.self) { element in
                    Section(header: HStack{
                        Text(element)
                        Spacer()
                        Image(systemName:  expandedItem == element ? "arrow.up" : "arrow.down" )
                    }, content: {
                        if expandedItem == element {
                            ForEach( items[element]!, id:\.self) { value in
                                Text("\(value)").listRowBackground(  value % 2 == 0 ?  Color(.blue) : Color(.green) )
                            }
                        }
                    })
                    .onTapGesture {
                        if expandedItem == element {
                            expandedItem = nil
                        } else {
                            expandedItem = element
                        }
                    }
                }
            }
        }
        
    }
}

struct DisclosureView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureView()
    }
}

struct CustomDisclosureGroupStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration.label
                .font(.headline)
            
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .onTapGesture {
                    withAnimation {
                        if #available(iOS 16.0, *) {
                            configuration.isExpanded.toggle()
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                }
            if configuration.isExpanded {
                configuration.content
                    .padding(.top, 8)
                
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct CustomRowView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        
        .contentShape(Rectangle())
    }
}
