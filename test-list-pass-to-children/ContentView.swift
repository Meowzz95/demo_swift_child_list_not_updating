//
//  ContentView.swift
//  test-list-pass-to-children
//
//  Created by Mimimi on 4/2/23.
//

import SwiftUI

@MainActor
class ContentViewModel:ObservableObject{
    @Published var aList:[Item] = []
    func load() async{
        do{
            for i in 0...9{
                try await Task.sleep(nanoseconds: 500_000_000)
                aList.append(Item(name: "item \(i)"))
                debugPrint("aList len = \(aList.count)")
            }
        }catch{
            debugPrint("error loading \(error)")
        }
        
    }
}
struct ContentView: View {
    var vm:ContentViewModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            ChildView(someList: vm.aList)
        }
        .padding()
        .task {
            await vm.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ContentViewModel())
    }
}
