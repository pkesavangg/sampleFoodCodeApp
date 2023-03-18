//
//  ActionSheetSample.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 07/02/23.
//

import SwiftUI

struct ActionSheetSample: View {
    @State var showActionSheet = false // 1
       @State var coffeeConsumptionTime = "" // 2
       var body: some View {
           Text(coffeeConsumptionTime)
           Button {
               self.showActionSheet = true // 3
           } label: {
               Text("Show action sheet")
           }
               .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("When do you usually consume your coffee?"), message: nil, buttons: [ // 4
                   .default(Text("Morning"), action: { // 5
                       self.coffeeConsumptionTime = "Morning"
                   }),
                   .default(Text("Afternoon"), action: {
                       self.coffeeConsumptionTime = "Afternoon"
                   }),
                   .default(Text("I dont lol"), action: {
                       self.coffeeConsumptionTime = ""
                   }),
                   .cancel() // 6
                ]
                )
               }
       }
}

struct ActionSheetSample_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetSample()
    }
}
