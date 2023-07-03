//
//  LoginViewModel.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 08/06/23.
//

import Foundation
import SwiftUI

/*
     -ViewModel calls will always Confirm to ObservableObject
     -Call API's using your network classes.
     -Implement you app logic in this class.

 class LoginViewModel: ObservableObject {
     @Published var data: DataModel?


     func fetchData() {
         networkHandler.getData { result in
             DispatchQueue.main.async {
                 switch result {
                 case .success(let data):
                     self.data = data
                 case .failure(let error):
                     // Handle the error case, e.g., show an error message
                     print("Error: \(error.localizedDescription)")
                 }
             }
         }
     }

     func saveData(data: DataModel) {
        networkHandler.saveData(data: data) { result in
             DispatchQueue.main.async {
                 switch result {
                 case .success:
                     // Data saved successfully, perform any additional actions if needed
                     break
                 case .failure(let error):
                     // Handle the error case, e.g., show an error message
                     print("Error: \(error.localizedDescription)")
                 }
             }
         }
     }

     //View Logic
     func updateLoginView() {
        Code here...
     }

     //Routing logic
     func moveToNextScreen() {
        Code here...
     }
 }
 */
