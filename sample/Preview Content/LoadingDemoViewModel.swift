//
//  LoadingDemoViewModel.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 08/02/23.
//

import Foundation
import SwiftUI


struct Comments: Codable, Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let body: String
    
}
class LoadingDemoViewModel : ObservableObject {
    
    static var shared: LoadingDemoViewModel = LoadingDemoViewModel()
    
    
    @Published  var showLoading = false
    @Published var apiComments : [Comments] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
            self.getUserComments()
                }
    }
    
    func getUserComments() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        self.showLoading = true
        URLSession.shared.dataTask(with: url) { (data, _, _) in
           
            let comments = try! JSONDecoder().decode([Comments].self, from: data!)
           
            
            DispatchQueue.main.async {
                self.showLoading = false
                self.apiComments = comments
            }
        }
        .resume()
    }
    
    
}
