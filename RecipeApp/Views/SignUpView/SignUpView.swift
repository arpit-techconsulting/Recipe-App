//
//  SignUpView.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/24/24.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    @State var showPassword: Bool = false
    @State var showLogin: Bool = false
    @State var isSignedUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack(alignment: .leading) {
                    TextField(text: $signUpViewModel.fName, prompt: Text("First Name").foregroundStyle(.blue)) {
                        Text("First Name")
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding(10)
                    
                    TextField(text: $signUpViewModel.lName, prompt: Text("Last Name").foregroundStyle(.blue)) {
                        Text("Last Name")
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding(10)
                    
                    TextField(text: $signUpViewModel.userName, prompt: Text("Username").foregroundStyle(.blue)) {
                        Text("Username")
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding(10)
                    
                    HStack {
                        
                        TextField(text: $signUpViewModel.password, prompt: Text("Password").foregroundStyle(.red)) {
                            Text("Password")
                        }
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 2)
                        }
                        .padding(10)
                        
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
                    .padding(.trailing, 10)
                    
                    TextField(text: $signUpViewModel.password, prompt: Text("Retype Password").foregroundStyle(.red)) {
                        Text("Password")
                    }
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 2)
                    }
                    .padding(10)
                }
                
                Button {
                    showLogin = true
                } label: {
                    Text("Already Have an Account? Login")
                        .font(.subheadline)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .underline()
                }
                
                .navigationTitle("Sign Up")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $showLogin) {
                    LoginView(loginViewModel: LoginViewModel())
                }
                
                Spacer()
                
                Button {
                    signUpViewModel.signUpBtnClicked()
                    isSignedUp = true
                } label: {
                    Text("Sign Up")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding()
                
                .navigationDestination(isPresented: $isSignedUp) {
                    HomeView(homeViewModel: HomeViewModel())
                }
            }
        }
    }
}

#Preview {
    SignUpView(signUpViewModel: SignUpViewModel())
}
