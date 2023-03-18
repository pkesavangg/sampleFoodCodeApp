//
//  CombineFeatures.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 11/03/23.
//

enum MyError: Error {
    case genericError
}

import Foundation
import Combine
class Publishers {
    //Just - emits a single value and then finishes.
    let publisher = Just("Hello, world!")
    
    func just(){
        publisher.sink { value in
            print(value)
        }
        // Output: "Hello, world!"
    }
    
    
    //Future - emits a single value or error at some point in the future.
    let publisher2 = Future<Int, MyError> { promise in
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let success = Bool.random()
            if success {
                promise(.success(42))
            } else {
                promise(.failure(MyError.genericError))
            }
        }
    }
    
    func future(){
        publisher2.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Finished")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }, receiveValue: { value in
            print("Value: \(value)")
        })
        // Output: Either "Value: 42" or "Error: genericError"
    }
   
    
    //Timer - emits a value after a specified interval.
    
    func timer(){
        let publisher = Timer.publish(every: 1.0, on: .main, in: .default)
        let cancellable = publisher.connect()
        publisher.sink { value in
            print("Tick")
        }
        // Output: "Tick" every second
    }
    
    //URLSession.DataTaskPublisher - emits a stream of data events from a URL session data task.
    func dataTask(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
        publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Finished \(completion)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }, receiveValue: { data, response in
            print("Data: \(data)")
        })
    }
}
