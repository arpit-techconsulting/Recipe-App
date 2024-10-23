//
//  LoginViewModel.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/22/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
}
