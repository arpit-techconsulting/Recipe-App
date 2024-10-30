//
//  SignUpViewModel.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/24/24.
//

import Foundation
import FirebaseFirestore

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fName: String = ""
    @Published var lName: String = ""
    @Published var password: String = ""
    @Published var retypePassword: String = ""
    
    private var db = Firestore.firestore()
    
    func signUpBtnClicked() {
//        print("Sign Up button clicked")
        let userData: [String: Any] = [
            "email": email,
            "firstName": fName,
            "lastName": lName,
            "password": password
        ]
        
        db.collection("users").addDocument(data: userData) {error in
            if let error {
                print("Error adding document: \(error)")
            } else {
                print("Successfully added data to Firebase database")
            }
        }
    }
}
