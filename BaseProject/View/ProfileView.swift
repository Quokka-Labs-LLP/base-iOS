//
//  ProfileView.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 23/06/23.
//

import SwiftUI

struct ProfileView: View {
    let  networkService = UserListViewModel(networkManager: NetworkManager())

    @State var isPresented: Bool = false
    var body: some View {

        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .shadow(radius: 5)
        Spacer()
            .frame(height: 20)
        Text("Hello John")
            .foregroundColor(.gray)

        Text("john@gmail.com")
            .foregroundColor(.black)
        List() {
                Text("Api Logs")
                .foregroundColor(.blue).onTapGesture(perform: {
                    isPresented = true
                })

        }
        .fullScreenCover(isPresented: $isPresented, content: ApiLogsView.init)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
