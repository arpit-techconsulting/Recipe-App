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
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                
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
                    
                    TextField(text: $signUpViewModel.email, prompt: Text("Email").foregroundStyle(.blue)) {
                        Text("Email")
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
                        
                        Group {
                            
                            if showPassword {
                                TextField(text: $signUpViewModel.password, prompt: Text("Password").foregroundStyle(.red)) {
                                    Text("Password")
                                }
                            } else {
                                SecureField(text: $signUpViewModel.password, prompt: Text("Password").foregroundStyle(.red)) {
                                    Text("Password")
                                }
                            }
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
                    
                    SecureField(text: $signUpViewModel.retypePassword, prompt: Text("Retype Password").foregroundStyle(.red)) {
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
                        .fontWeight(.semibold)
                        .underline()
                }
                
                .navigationTitle("Sign Up")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $showLogin) {
                    LoginView(loginViewModel: LoginViewModel())
                }
                
                Spacer()
                
                Button {
                    signUpViewModel.signUpBtnClicked {success in
                        if success {
                            isSignedUp = true
                        } else {
                            showAlert = true
                        }
                    }
                    
                } label: {
                    Text("Sign Up")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 50)
                .background(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding()
                
                .navigationDestination(isPresented: $isSignedUp) {
                    HomeView(homeViewModel: HomeViewModel())
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"),
                          message: Text(signUpViewModel.errorMessage ?? "Unknown Error"),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

#Preview {
    SignUpView(signUpViewModel: SignUpViewModel())
}
