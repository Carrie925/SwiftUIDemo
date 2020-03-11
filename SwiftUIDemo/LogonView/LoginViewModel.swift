//
//  LoginViewModel.swift
//  SwiftUIDemo
//
//  Created by dan wang on 2020/3/11.
//  Copyright © 2020 dan wang. All rights reserved.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email = "wdan925@163.com"
    @Published var password = "123456"
    @Published var isFirstResponder = false

    var isButtonEnabled: Bool { !email.isEmpty && !password.isEmpty }

}
