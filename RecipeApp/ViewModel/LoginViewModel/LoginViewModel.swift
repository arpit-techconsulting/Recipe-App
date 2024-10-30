//
//  LoginViewModel.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/22/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func loginBtnClicked() {
        print(email, password)
//        print("Login Button clicked")
    }
}
