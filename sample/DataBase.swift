//
//  DataBase.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 20/11/22.
//

import Foundation

final class Database {
    private let keyfavKey = "fav_key"
    
    func save(items: Set<String>){
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: keyfavKey)
    }
    
    func load() -> Set<String> {
        let array = UserDefaults.standard.array(forKey: keyfavKey) as? [String] ?? [String]()
        return Set(array)
    }
    
}
