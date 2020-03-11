//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by dan wang on 2020/3/11.
//  Copyright © 2020 dan wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
                MapView()
                    .edgesIgnoringSafeArea(.top)

                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)

                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    HStack(alignment: .top) {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                }.padding()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
