//
//  DemoService.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 06/02/23.
//

import Foundation


class DemoService {
    
    var names = ["Kesavan", "Akash", "Abishek", "Guna", "John", "Jack"]
    
    func fetch() -> [String] {
        return names
    }
    
    func remove(){
        names.removeLast() 
    }
}
