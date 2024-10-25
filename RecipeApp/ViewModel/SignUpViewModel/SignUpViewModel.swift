//
//  SignUpViewModel.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/24/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var fName: String = ""
    @Published var lName: String = ""
    @Published var password: String = ""
}
