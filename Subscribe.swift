//
//  Subscribe.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 22/02/23.
//

import Foundation
import Combine

class MyClass {
    var cancellable: AnyCancellable?
    @Published var myProperty: String = ""
    init() {
        cancellable = $myProperty.sink { newValue in
            print("myProperty changed to: \(newValue)")
        }
    }
}







