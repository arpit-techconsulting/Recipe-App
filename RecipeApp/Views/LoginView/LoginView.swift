//
//  LoginView.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/22/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                TextField(text: $loginViewModel.userName, prompt: Text( "Username")) {
                    Text("Username")
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.top, 20)
                
                Divider()
                
                SecureField(text: $loginViewModel.password, prompt: Text( "Password")) {
                    Text("Password")
                }
                
                Divider()
            }
            Spacer()
            
            Button("")
        }
        .padding(30)
    }
}

#Preview {
    LoginView()
}
