//
//  StateObjectExampleView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 04/02/23.
//

import SwiftUI

class Stuff: ObservableObject {
    @Published var text = "Not Updated"
    @Published var buttonText = "Update"
    @Published var counter = 0
    static let shared: Stuff = Stuff()
    func changeText(){
        Task{
            sleep(3)
            DispatchQueue.main.async {
                self.text = "Text Changed"
                self.buttonText = "Reset"
            }
        }
    }
}



struct StateObjectExampleView: View {
    
    @ObservedObject var stuff = Stuff()
    var body: some View {
        VStack{
            Text(stuff.text)
            Text("\(stuff.counter)")
            Button {
                stuff.changeText()
            } label: {
                Text("\(stuff.buttonText)")
            }

        }
        ExtraView(stuff: stuff)
    }
}

struct ExtraView: View{
    @ObservedObject var stuff = Stuff()
    var body: some View{
        Button {
            stuff.counter += 1
        } label: {
            Text("Counter value: \(stuff.counter)  \(stuff.buttonText)")
        }

    }
}

struct AnotherView: View{
    @ObservedObject var stateStuff = Stuff()
    var body: some View{
        Button {
            stateStuff.counter += 1
        } label: {
            Text("Counter value: \(stateStuff.counter)  \(stateStuff.buttonText)")
        }

    }
}


struct StateObjectExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectExampleView()
    }
}
