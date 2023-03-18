//
//  StudentsService.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/02/23.
//

import Foundation

class StudentsService: ObservableObject{
    @Published  var studentsList = [ "Kesavan" , "Mahesh", "Ramesh", "Vikram", "Vinayagam", "John", "Michael", "Yogesh", "Kannan"]
    
    static var shared: StudentsService = StudentsService()
    
    init(){
        
    }
    
    
    func getStudentsList(completion: @escaping ([String]?) -> ()){
        if(studentsList.count > 0){
            completion(self.studentsList)
        }else{
            completion(nil)
        }
    }
    
    
    func addStudentName(studentName: String){
        studentsList.append(studentName)
    }
    
    func deleteStudentName(studentName: String){
        studentsList.firstIndex(where: {$0 == studentName})
    }
    
    func removeStudent(){
        studentsList.removeLast()
    }
    
}
