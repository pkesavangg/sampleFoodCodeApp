//
//  ProductService.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/02/23.
//

import Foundation

struct Product : Identifiable, Equatable{
    var id = UUID()
    var name: String
}

class ProductService: ObservableObject{
    
    @Published var productList = [Product( name: "Bike"), Product(name: "Car"), Product(name: "Van")]
    
  static let shared: ProductService = ProductService()
    
    //@Published var _shared = ProductService.shared
    
    @Published var name = "Kesavan"
    
    func addNewProduct(productName: String) {
        productList.append( Product(name: "Flight"))
        //updateDevicesList()
      
        
    }
    
    func updateDevicesList(){
        self.productList = Array.init(self.productList)
    
    }
    
}




