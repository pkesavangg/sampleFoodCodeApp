//
//  Subscribers.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 11/03/23.
//

import Foundation
import Combine

class Subscribers {
    var value: String = ""
    func map(){
        //Map - transforms the values emitted by a publisher using a provided closure.
        let publisher = Just(4)
        let cancellable = publisher
            .map { $0 * 2 }
            .sink { value in
                print(value)
            }
        // Output: "8"
    }
    
    func combineLatest(){
        
        //CombineLatest - receives values from multiple publishers and emits a combined value each time any of the publishers emit a new value.
//        let publisher1 = Just("Hello")
//        let publisher2 = Just("world!")
//        let publisher = Publishers.CombineLatest(publisher1, publisher2)
//        let cancellable = publisher.sink { value in
//            print("\(value.0) \(value.1)")
//        }
        // Output: "Hello world!"]]
    }
    
    func assign(){
        //Assign - receives values from a publisher and assigns them to a property of an object.
        class MyObject {
            var value: String = ""
        }

        let object = MyObject()
        let publisher = Just("Hello, world!")
        let cancellable = publisher.assign(to: \.value, on: object)
        print(object.value)
        // Output: "Hello, world!"
    }
    
    func sink(){
        //Sink - receives values from a publisher and performs a side effect.
        let publisher = Just("Hello, world!")
        let cancellable = publisher.sink { value in
            print(value)
        }
        // Output: "Hello, world!"
    }
    
}
