//
//  ProductDataListView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/03/23.
//

import SwiftUI

struct ProductDataListView: View {
    @StateObject var viewModel = DataService()
    var body: some View {
        NavigationView {
           Text("Product data list view")
        }
    }
}

struct ProductDataListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDataListView()
    }
}
