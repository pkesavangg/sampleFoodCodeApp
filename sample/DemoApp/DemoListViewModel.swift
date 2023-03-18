//
//  DemoListViewModel.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 06/02/23.
//

import Foundation


final class DemoListViewModal: ObservableObject {

    
      
    
    var names: [String] = DemoService().names {
        
           didSet {
               self.getValues()
           }
    }
    
    
    func updateName(){
        DemoService().remove()
    }
    
    func getValues(){
        print("get Values")
    }
}
