//
//  TestingView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 01/02/23.
//

import SwiftUI


struct EmpolyeeModal {
    var name: String
    var id: String
}




struct TestingViews: View {
    @State var id: String = ""
    @State var name: String = ""
    //@Environment(\.managedObjectContext) private var viewContext
    
    
    @StateObject private var viewModel = EmpolyeeProfileViewModal()
    //@FetchRequest(entity: ToggleResult.entity(), sortDescriptors: [])
   // private var empolyeeList: FetchedResults<ToggleResult>
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    TextField("Empolyee name", text: $name)
                    TextField("Empolyee id", text: $id)
                }.padding()
                
                
                HStack {
                    Spacer()
                    Button("Add") {
                        addEmpolyee()
                        name = ""
                        id = ""
                    }
                    Spacer()
                    Button("Clear") {
                        name = ""
                        id = ""
                    }
                   
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    
                    ForEach(viewModel.employees) { value in
                        HStack {
                            HStack{
                                Text("Id:").fontWeight(.bold)
                                Text(value.id ?? "Not found")
                            }
                            
                            Spacer()
                            Text(value.name ?? "Not found")
                        }
                    }.onDelete(perform: deleteEmpolyee)
                }
                .navigationTitle("Empolyee Database")
            }
           
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    
    private func addEmpolyee() {
        viewModel.addNewEmpolyee(empolyeeName: name, empolyeeId: id)
    }
    
    
    
    private func deleteEmpolyee(offsets: IndexSet) {
        //viewModel.deleteEmpolyee(offsets: offsets)
    }
}

//struct TestingViews_Previews: PreviewProvider {
//    static var previews: some View {
//        TestingViews()
//    }
//}
