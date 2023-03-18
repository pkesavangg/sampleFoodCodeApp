//
//  ProductListViewModal.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/02/23.
//

import Foundation
import SwiftUI
import Combine


class ProductListViewModal: ObservableObject {
    
    var productService = ProductService.shared
    var cancellable: AnyCancellable?
    @Published var productList = [Product]()
    init(){
        productList = productService.productList
        cancellable = productService.$productList.sink { newValue in
                self.productList = newValue
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addProduct(productName: String){
        self.productService.addNewProduct(productName: "Mobile")
    }

}




