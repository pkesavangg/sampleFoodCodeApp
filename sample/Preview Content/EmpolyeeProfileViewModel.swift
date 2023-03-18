//
//  EmpolyeeProfileViewMode;.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 01/02/23.
//

import Foundation
import SwiftUI

final class EmpolyeeProfileViewModal : ObservableObject{
    
    @ObservedObject var empolyeeService = EmpolyeeService.shared

    var employees: [ToggleResult] {
        return empolyeeService.empolyeeList ?? []
    }
    
    
    func addNewEmpolyee(empolyeeName: String, empolyeeId: String){
        empolyeeService.addEmpolyee(name: empolyeeName, id: empolyeeId)
    }
    
//    func deleteEmpolyee(offsets: IndexSet){
//        empolyeeService.deleteEmpolyee(offsets: offsets)
//    }
    
}
