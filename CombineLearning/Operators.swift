//
//  Operators.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 11/03/23.
//

import Foundation
import Combine

                        
class Operators {
    
    func map(){
        //map - transforms the output of a publisher using a closure.
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher

        let mappedPublisher = publisher.map { $0 * 2 }
        mappedPublisher.sink { value in
            print(value)
        }
        // Output: 2, 4, 6, 8, 10
    }
    
    
    func filter(){
        //filter - filters the output of a publisher using a closure.
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher

        let filteredPublisher = publisher.filter { $0 % 2 == 0 }
        filteredPublisher.sink { value in
            print(value)
        }
        // Output: 2, 4
    }
    
    func flatMap(){
        //flatMap - transforms the output of a publisher into a new publisher.
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher

        let flatMapPublisher = publisher.flatMap { value in
            Just(value * 2)
        }
        flatMapPublisher.sink { value in
            print(value)
        }
        // Output: 2, 4, 6, 8, 10
    }
    
    
    func zip(){
        //zip - combines the output of multiple publishers into a tuple.
        let numbers = [1, 2, 3, 4, 5]
        let publisher1 = numbers.publisher
        let publisher2 = ["A", "B", "C", "D", "E"].publisher

        let zippedPublisher = publisher1.zip(publisher2)
        zippedPublisher.sink { value in
            print(value)
        }
        // Output: (1, "A"), (2, "B"), (3, "C"), (4, "D"), (5, "E")
    }
    func merge(){
        //merge - combines the output of multiple publishers into a single stream.
//        let numbers1 = [1, 2, 3]
//        let numbers2 = [4, 5, 6]
//        let publisher1 = numbers1.publisher
//        let publisher2 = numbers2.publisher
//
//        let mergedPublisher = Publishers.Merge(publisher1, publisher2)
//        mergedPublisher.sink { value in
//            print(value)
//        }
        // Output: 1, 2, 3, 4, 5, 6
    }
    
}
