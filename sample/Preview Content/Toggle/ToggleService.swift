//
//  ToggleService.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 31/01/23.
//

import Foundation

class ToggleService :  ObservableObject {
    
    static let shared: ToggleService = ToggleService()
    
    @Published var toggleValues :  [Site]?
    
    
    init(){
        toggleValues = [Site(id: "0", name: "First", isOn: true), Site(id: "1", name: "Second", isOn: true), Site(id: "2", name: "Third", isOn: false), Site(id: "3", name: "Fourth", isOn: false), Site(id: "4", name: "Fifth", isOn: true), Site(id: "5", name: "Sixth", isOn: true), Site(id: "6", name: "Seventh", isOn: true)]
    }
    
    func changeValues(id: String, isToggleOn: Bool){
        if let index = toggleValues?.firstIndex(where: {$0.id == id}) {
            toggleValues?[index].isOn = isToggleOn
        }
    }
    
    
}
