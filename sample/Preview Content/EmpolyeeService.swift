//
//  EmpolyeeService.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 01/02/23.
//

import Foundation
import CoreData

class EmpolyeeService: ObservableObject {
    
   var viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    static let shared: EmpolyeeService = EmpolyeeService()
    @Published var empolyeeList: [ToggleResult]?
    
    init() {
        getStoredEmpolyeeList()
    }
    
    func getStoredEmpolyeeList() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToggleResult")
        let items = try! viewContext.fetch(fetchRequest) as! [ToggleResult]
        
          empolyeeList = items as! [ToggleResult]
        
    }
    
     func addEmpolyee(name: String, id: String) {
        
       
            let toggle = ToggleResult(context: viewContext)
            toggle.name = name
            toggle.id = id
            
            saveContext()
         getStoredEmpolyeeList()
        
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
    
//     func deleteEmpolyee(offsets: IndexSet) {
//
//        // self.empolyeeList?.remove(atOffsets: offsets)
//         
//         
//         for index in offsets {
//             print(index)
//             if let language = empolyeeList?[index] {
//                 viewContext.delete(language)
//             }
//saveContext()
//             }
//           
//
//    }
    
}
