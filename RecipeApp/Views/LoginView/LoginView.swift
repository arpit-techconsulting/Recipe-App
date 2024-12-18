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
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                    .foregroundStyle(.blue)
                
                VStack(alignment: .leading, spacing: 30) {
                    TextField(text: $loginViewModel.email, prompt: Text( "Email").foregroundStyle(.blue)) {
                        Text("Email")
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
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 2)
                        }
                    }
                }
                
                Button {
                    showSignUp = true
                } label: {
                    Text("Don't Have an Account? Sign Up")
                        .font(.subheadline)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .fontWeight(.semibold)
                        .underline()
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                
                .navigationTitle("Login")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $showSignUp) {
                    SignUpView(signUpViewModel: SignUpViewModel())
                }
                
                //                Spacer()
                
                Button {
                    loginViewModel.loginBtnClicked {success in
                        if !success {
                            showAlert = true
                        } else {
                            isLoggedIn = true
                        }
                    }
                } label: {
                    Text("Login")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 50)
                .background(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                
                .navigationDestination(isPresented: $isLoggedIn) {
                    HomeView(homeViewModel: HomeViewModel())
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"),
                          message: Text(loginViewModel.errorMessage ?? "Unknown Error"),
                          dismissButton: .default(Text("OK")))
                }
                
            }
            
            Spacer()
        }
        .padding(30)
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}
