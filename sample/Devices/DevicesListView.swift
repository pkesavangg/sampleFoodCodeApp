//
//  DevicesListView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 03/02/23.
//

import SwiftUI

struct DevicesListView: View {
    
    @ObservedObject var viewModel: DevicesListService
    
    
    var body: some View {
        List {
            ForEach(viewModel.devices) { activity in
                Text(activity.name)
                 }
             }
    }
}
//
//struct DevicesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DevicesListView()
//    }
//}
