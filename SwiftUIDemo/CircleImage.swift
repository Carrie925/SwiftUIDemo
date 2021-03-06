//
//  CircleImage.swift
//  XCode11SwiftUI
//
//  Created by dan wang on 2020/3/11.
//  Copyright © 2020 dan wang. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    @available(iOS 13.0.0, *)
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
        .overlay(
        Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        CircleImage()
    }
}
