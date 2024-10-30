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
    @Published var errorMessage: String?
    
    private var db = Firestore.firestore()
    
    func signUpBtnClicked(completion: @escaping (Bool) -> Void) {
        
        if email.isEmpty || fName.isEmpty || password.isEmpty || retypePassword.isEmpty {
            errorMessage = "Fields cannot be empty"
            completion(false)
            return
        }
        
        guard password == retypePassword else {
            errorMessage = "Password does not match"
            completion(false)
            return
        }
        
        db.collection("users").whereField("email", isEqualTo: email).getDocuments {[weak self] (query, error) in
            if let error {
                self?.errorMessage = "Error in checking email: \(error.localizedDescription)"
                completion(false)
                return
            }
            
            if let document = query?.documents, !document.isEmpty {
                self?.errorMessage = "This email ID is already registered."
                completion(false)
            } else {
                self?.addUserToDatabase()
                completion(true)
            }
        }
        
        errorMessage = nil
    }
    
    private func addUserToDatabase() {
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
