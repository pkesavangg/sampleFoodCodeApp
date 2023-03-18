//
//  StudentsListView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 02/02/23.
//

import SwiftUI



struct StudentsListView: View {
    
    @ObservedObject var studentsListViewModal = StudentViewModal.shared
    
    var body: some View {
        
        
        
        Form {
            List {
                ForEach(studentsListViewModal.studentsList, id: \.self ) { values in
                    Text(values)
                }
            }

            HStack{
                Button("Add") {
                    studentsListViewModal.addName()
                }.accentColor(.yellow)
                
                
                Button {
                    
                } label: {
                    Text("Testomg") + Text(Image(systemName: "arrow.right"))
                }.disabled(true)


            }

            Button("Remove") {
                studentsListViewModal.removeName()
            }.accentColor(.red).disabled(true)
        }

        DeletingView()
        
    }
    
    func delete(offsets: IndexSet){
        
    }
}



struct DeletingView: View{
    @ObservedObject var studentsListViewModal = StudentViewModal.shared
    var body: some View {
        Button("Remove") {
            studentsListViewModal.removeName()
        }.accentColor(.red)
    }
}

struct StudentsListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentsListView()
    }
}
