//
//  UrlView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 21/11/22.
//


import SwiftUI
import Foundation
import WebKit

struct UrlView: View{
    
    let urlValue : String?
    
    var body: some View {
      WebView(urlString: urlValue)
    }
}
