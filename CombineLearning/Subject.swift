//
//  Subject.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 11/03/23.
//

import Foundation
import Combine
//import RxSwift

class Subject {
    
    func passThroughSubject(){
        
        //PassthroughSubject: This subject does not buffer any values, and only emits values to subscribers that subscribe to it after a value has been emitted. This subject is useful when you need to pass values between two components that are not directly connected.
        let subject = PassthroughSubject<String, Never>()

        let subscription = subject.sink { value in
            print("Received value: \(value)")
        }

        subject.send("Hello, world!")
    }
    
    func currentValueSubject() {
   // CurrentValueSubject: This subject is similar to PassthroughSubject, but it also has a current value that is maintained and can be accessed by subscribers at any time.
        
        let subject = CurrentValueSubject<String, Never>("Initial value")

        let subscription1 = subject.sink { value in
            print("Received value from subscription 1: \(value)")
        }

        let subscription2 = subject.sink { value in
            print("Received value from subscription 2: \(value)")
        }

        subject.send("New value")
        print("Current value: \(subject.value)")
        
        
    }
    
    
    func behaviourSubject() {
    //BehaviorSubject: This subject is similar to CurrentValueSubject, but it also replays the latest value to new subscribers when they first subscribe.
        
//        let subject = BehaviorSubject<String>(value: "Initial value")
//
//        let subscription1 = subject.sink { value in
//            print("Received value from subscription 1: \(value)")
//        }
//
//        subject.send("New value")
//
//        let subscription2 = subject.sink { value in
//            print("Received value from subscription 2: \(value)")
//        }
//
//        print("Current value: \(subject.value)")
//
        
    }
    
    func replaysSubject() {
    //ReplaySubject: This subject buffers a specified number of values and replays them to new subscribers when they first subscribe.
        
//        let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//        subject.send("Value 1")
//        subject.send("Value 2")
//        subject.send("Value 3")
//
//        let subscription1 = subject.sink { value in
//            print("Received value from subscription 1: \(value)")
//        }
//
//        let subscription2 = subject.sink { value in
//            print("Received value from subscription 2: \(value)")
//        }
//
//        print("Current values: \(subject.replayAll())")
        
    }
    
}
