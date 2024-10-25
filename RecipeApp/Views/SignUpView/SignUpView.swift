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
                        .border(.red)
                        
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
            }
        }
    }
}

#Preview {
    SignUpView(signUpViewModel: SignUpViewModel())
}
