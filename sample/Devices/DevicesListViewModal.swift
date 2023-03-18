//
//  DevicesListViewModal.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 03/02/23.
//

import Foundation
import Combine

struct DevicesViewModal: Identifiable {
  var productsList: Product

  init(productsList: Product) {
      self.productsList = productsList
  }
    
    

  let id = UUID()

  var name: String {
      return productsList.name ?? ""
  }
}
