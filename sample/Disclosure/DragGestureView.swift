//
//  DragGestureView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 21/02/23.
//

import SwiftUI

struct DragGestureView: View {
    @State private var offset = CGSize.zero
       @State private var isDragging = false

       var body: some View {
           Rectangle()
               .fill(Color.blue)
               .frame(width: 100, height: 100)
               .offset(x: offset.width, y: 0)
               .gesture(
                   DragGesture()
                       .onChanged { gesture in
                           self.offset.width = gesture.translation.width
                           self.isDragging = true
                       }
                       .onEnded { gesture in
                           withAnimation {
                               self.offset.width = 0
                               self.isDragging = false
                           }
                       }
               )
       }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
