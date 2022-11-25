//
//  SettingsView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 22/11/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var shouldPopToRootView : Bool
    var body: some View {
        NavigationView {
            Button {
                print("Logout pressed")
                self.shouldPopToRootView = false
            } label: {
                Text("Log out")
            }

        }
    }
}


