//
//  ToggleView.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 31/01/23.
//
import SwiftUI

struct Site: Identifiable {
    var id: String
    var name: String
    var isOn: Bool
}

struct formView : View{
     @EnvironmentObject var toggleService: ToggleService
    
    var body: some View{
        NavigationView {
            Form {
                Section (header: Text("Select Sites")) {
                    ForEach(self.toggleService.toggleValues!) { value in
                        HStack{
                            if(value.isOn){
                                Text("On")
                            }else{
                                Text("Off")
                            }
                            toggleButtons(value)
                        }
                    }
                }

            }
            
        }
    }
}

struct toggleButtons: View {
     @EnvironmentObject var toggleService: ToggleService
    
    @State private var state: Bool
    private let site: Site
    
    init(_ site: Site) {
        self.site = site
        self.state = site.isOn
    }
    
    var body: some View {
        HStack {
            Toggle(isOn: self.$state) {
                Text(site.name)
            }
            .onChange(of: state) { value in
                toggleService.changeValues(id: site.id, isToggleOn: value)
            }
        }
    }
}

struct SiteRow_Previews: PreviewProvider {
    static var previews: some View {
        formView().environmentObject(ToggleService())
    }
}
