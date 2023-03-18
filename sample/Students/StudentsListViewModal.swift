//
//  StudentsListViewModal.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/02/23.
//

import Foundation
import SwiftUI
import Combine


final class StudentViewModal : ObservableObject {
    
    @ObservedObject var studentsService = StudentsService.shared
    
    static var shared: StudentViewModal = StudentViewModal()
    
    @Published  var studentsList  = [String]()
    
   
    
    init(){
        self.populateList()
     
    }
    
    func addName(){
        DispatchQueue.main.async {
            self.studentsService.addStudentName(studentName: "Kavin")
            
           // self.st
            //self.populateList()
        }
    }
    
    
    func removeName(){
        DispatchQueue.main.async {
            self.studentsService.removeStudent()
            self.populateList()
        }
    }
    
    func populateList(){
        studentsService.getStudentsList { elements in
            DispatchQueue.main.async {
                self.studentsList = elements ?? []
            }
        }
    }
    
    
    
}
