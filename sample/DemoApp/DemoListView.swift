//
//  DemoListView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 06/02/23.
//

import SwiftUI

struct DemoListView: View {
    
    @StateObject private var vm = DemoListViewModal()
    
    var body: some View {
        List{
            ForEach(vm.names, id: \.self) { name in
                Text(name)
            }
            Button("Remove") {
               vm.updateName()
            }
        }.task {
//            self.vm.getRandomNames()
        }
    }
}

struct DemoListView_Previews: PreviewProvider {
    static var previews: some View {
        DemoListView()
    }
}
