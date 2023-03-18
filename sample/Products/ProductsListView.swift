//
//  ProductsListView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/02/23.
//

import SwiftUI

struct ProductsListView: View {
    @StateObject private var productListViewModal = ProductListViewModal()
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Product Lists")) {
                    ForEach(productListViewModal.productList) { elements in
                        Text(elements.name)
                    }
                }
                Button {
                    productListViewModal.addProduct(productName: "Mobile")
                } label: {
                    Text("Add Product")
                }
            }.navigationTitle("Products").navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
}




struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView()
    }
}
