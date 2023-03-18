//
//  Schedulers.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 11/03/23.
//

import Foundation
import Combine

class schedulers {
    func dispatchQueue(){
        //DispatchQueue: This scheduler executes work on a specific dispatch queue, such as the main queue or a custom queue.
        
        let publisher = Just("Hello, world!")
            .delay(for: .seconds(1), scheduler: DispatchQueue.global())
            .receive(on: DispatchQueue.main)

        let subscription = publisher.sink { value in
            print(value)
        }
        //In this example, the delay operator delays the emission of the "Hello, world!" value by one second on a global dispatch queue, and the receive operator switches to the main dispatch queue to receive the value and print it.
    }
    
    func runloop(){
        //RunLoop: This scheduler executes work on the current run loop.
        let publisher = Just("Hello, world!")
            .delay(for: .seconds(1), scheduler: RunLoop.main)

        let subscription = publisher.sink { value in
            print(value)
        }
        //n this example, the delay operator delays the emission of the "Hello, world!" value by one second on the main run loop, and the value is printed on the same run loop.
    }
    
    func operationQueue(){
        //operationQueue: This scheduler executes work on a specific operation queue.
//        let queue = OperationQueue()
//        queue.maxConcurrentOperationCount = 1
//
//        let publisher = Just("Hello, world!")
//            .delay(for: .seconds(1), scheduler: OperationQueueScheduler(queue: queue))
//
//        let subscription = publisher.sink { value in
//            print(value)
//        }
        //In this example, the delay operator delays the emission of the "Hello, world!" value by one second on a custom operation queue with a maximum concurrent operation count of one, and the value is printed on the same queue.
    }
    
    func immediateSchedulers(){
        //ImmediateScheduler: This scheduler executes work immediately on the current thread.
        let publisher = Just("Hello, world!")
            .subscribe(on: ImmediateScheduler.shared)

        let subscription = publisher.sink { value in
            print(value)
        }
       // In this example, the subscribe operator subscribes to the "Hello, world!" publisher on the current thread, and the value is printed on the same thread.
    }
    
    
    
}
