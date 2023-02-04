//
//  ChildView.swift
//  test-list-pass-to-children
//
//  Created by Mimimi on 4/2/23.
//

import SwiftUI

struct ChildView: View {
    var someList:[Item]
    var body: some View {
        if someList.count>2{
            Text("count>2 count = \(someList.count)")
        }else{
            Text("HAHA count = \(someList.count)")
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView(someList: [Item(name: "1")])
    }
}
