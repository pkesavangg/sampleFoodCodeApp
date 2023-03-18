//
//  MultiThreading.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/03/23.
//

import Foundation
    

class DataService: ObservableObject {
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        // Perform a time-consuming task on a global queue
        DispatchQueue.global(qos: .background).async {
            // Do some time-consuming work here, like downloading a large file or processing a lot of data.
            print("check: \(Thread.isMainThread)")  //False
            print("check: \(Thread.current)")   //True
            DispatchQueue.main.async {
                // Update the UI on the main thread
                print("check: \(Thread.isMainThread)") //False
                print("check: \(Thread.current)")   //True
            }
        }
    }
    
}
