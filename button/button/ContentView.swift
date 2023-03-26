//
//  ContentView.swift
//  button
//
//  Created by 안수린 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0
    
    var body: some View {
        HStack {
            
            Button(action: {
                number = number-1
                print("minus 1")
            }, label: {
                Text("-1")
                    .foregroundColor(.primary)
                    .padding(20)
                    .background(Color.white)
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    .padding()
            })
            
           Text("\(number)")
                .frame(width: 30.0)
            
            Button(action: {
                number = number+1
                print("plus 1")
            }, label: {
                Text("+1")
                    .foregroundColor(.primary)
                    .padding(20)
                    .background(Color.white)
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    .padding()
            })
        }
    }
}

// Content View를 보여주는 코드
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


