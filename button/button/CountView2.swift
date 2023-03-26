//
//  CountView2.swift
//  button
//
//  Created by 안수린 on 2023/03/27.
//

import SwiftUI

struct ContentView2: View {
    @State private var count = 0
    var body: some View {
        Stepper("                        \(count)", value: $count)
            .padding(.horizontal, 30)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
