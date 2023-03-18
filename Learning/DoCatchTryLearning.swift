//
//  DoCatchTryLearning.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/03/23.
//

import SwiftUI

class DoTryCatchLearningDataLoader {
    var isActive: Bool = true
    
    func getTitle() throws -> String {
//        if(isActive){
//            return "Process..."
//        }
        throw URLError(.badURL)
    }
    
    func getTitle2() throws -> String {
        if(isActive){
            return "Process..."
        }
        throw URLError(.badURL)
    }
}

class DoTryCatchLearningViewModel: ObservableObject {
    @Published var text: String = "Start"
    let dataService = DoTryCatchLearningDataLoader()
    
    func fetchText(){
        do {
            let value = try? dataService.getTitle()
            if let textValue = value {
                self.text = textValue
            }
            let val = try dataService.getTitle2()
            self.text = val
        } catch let error {
            self.text = error.localizedDescription
        }
        
    }
}


struct DoCatchTryLearning: View {
    @StateObject var viewModel = DoTryCatchLearningViewModel()
    var body: some View {
        VStack{
            Text(viewModel.text)
                .font(.headline)
                .frame(width: 150, height: 100)
                .background(Color(.gray))
                .cornerRadius(10)
                .onTapGesture {
                    viewModel.fetchText()
                }
            Button(action: {
                // Perform action
            }) {
                Text("Tap me")
            }
            .accessibility(label: Text("Tap me button"))
            .accessibility(value: Text("Double tap to perform action"))
        }
        
    }
}

struct DoCatchTryLearning_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryLearning()
    }
}
