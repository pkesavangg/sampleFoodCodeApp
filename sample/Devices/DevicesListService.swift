//
//  DevicesListService.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 03/02/23.
//

import Foundation

class DevicesListService:  ObservableObject {
    @Published var devices = [DevicesViewModal]()
    
     init() {
        let devices = [Product(name: "Mobile"), Product(name: "TV"), Product(name: "HeadPhone")] as? [Product] ?? []
        self.devices = devices.map(DevicesViewModal.init)
    }
    
    
}
