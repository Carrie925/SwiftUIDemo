//
//  LoginSceneView.swift
//  SwiftUIDemo
//
//  Created by dan wang on 2020/3/11.
//  Copyright © 2020 dan wang. All rights reserved.
//

import SwiftUI

struct LoginSceneView: View {

    @ObservedObject private var viewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 22) {
                UIKitTextField(text: $viewModel.email, onEditingChanged: { (txt) in
                    
                }, onEditingBegin: {
                    
                }, onEditingEnd: {
                    
                }, onReturnKeyPressed: { () -> Bool in
                    return true
                    })
                    .border(Color.black, width: 1)
                    .padding()
                
                SecureField("Password", text: $viewModel.password)
                    .border(Color.black, width: 1)
                    .foregroundColor(Color.black)
                    .padding()
                
                Button(action: {
                    print("Logon button clicked")
                }) {
                    Text("LOGIN")
                }
                .disabled(!viewModel.isButtonEnabled)
                .foregroundColor(Color.blue)
            }
            .padding(.vertical, 40)
        }
    }
}

struct LoginSceneView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSceneView()
    }
}
