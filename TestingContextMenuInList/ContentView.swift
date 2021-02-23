//
//  ContentView.swift
//  TestingContextMenuInList
//
//  Created by Wilder Lopez on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    let items : [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]
    
    var body: some View {
        List{
            ForEach(items, id: \ .self){ item in
                LazyVStack{
                    Row(name: item)
                }
            }
        }
    }
}

struct Row : View {
    let name : String
    @State var isContext = false
    var body: some View{
        Text("\(name) \(isContext ? "appear contextMenu" : "")")
            .contextMenu {
                VStack{
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }.onAppear{
                    print("appear in contextMenu")
                    isContext = true
                }.onDisappear{
                    print("disappear in contextMenu")
                    isContext = false
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
