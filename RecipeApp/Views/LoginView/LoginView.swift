//
//  LoginView.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/22/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State var showPassword: Bool = false
    @State var isLoggedIn: Bool = false
    @State var showSignUp: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 30) {
                    TextField(text: $loginViewModel.userName, prompt: Text( "Username").foregroundStyle(.blue)) {
                        Text("Username")
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    
                    HStack {
                        
                        Group {
                            if showPassword {
                                TextField(text: $loginViewModel.password, prompt: Text("Password").foregroundStyle(.red)) {
                                    Text("Password")
                                }
                            } else {
                                SecureField(text: $loginViewModel.password, prompt: Text( "Password").foregroundStyle(.red)) {
                                    Text("Password")
                                }
                            }
                        }
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 2)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye" : "eye.slash")
                                .foregroundStyle(.red)
                        }
                        .padding(10)
                        .border(.red)
                    }
                }
                
                Button {
                    showSignUp = true
                } label: {
                    Text("Don't Have an Account? Sign Up")
                        .font(.subheadline)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .underline()
                }
                .padding(.top, 10)
                
                NavigationLink(destination: SignUpView(signUpViewModel: SignUpViewModel()), isActive: $showSignUp) {
                    EmptyView()
                }
                
                Spacer()
                
                Button {
                    loginViewModel.loginBtnClicked()
                    isLoggedIn = true
                } label: {
                    Text("Login")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                //            .frame(maxWidth: 300)
                .frame(height: 50)
                .background(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                
                NavigationLink(destination: HomeView(homeViewModel: HomeViewModel()), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding(30)
        }
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}
