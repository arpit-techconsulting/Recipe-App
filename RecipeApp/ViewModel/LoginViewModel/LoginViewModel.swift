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
    @Published var errorMessage: String?
    
    func loginBtnClicked(completion: @escaping (Bool) -> Void) {
//        print(email, password)
//        print("Login Button clicked")
        
        if email.isEmpty || password.isEmpty {
            errorMessage = "Fields cannot be empty"
            completion(false)
            return
        }
        
        completion(true)
    }
}
