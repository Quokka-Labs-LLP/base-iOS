//
//  ProfileView.swift
//  BaseProject
//
//  Created by Jyoti Mishra on 23/06/23.
//

import SwiftUI
//import CocoaDebug

struct ProfileView: View {
    // MARK: - Properties
    @EnvironmentObject var settings: UserSettings

    @State var isPresented: Bool = false
    @Binding var urlString: URL
    // MARK: - Body
    var body: some View {
        VStack {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(50)
            .shadow(radius: 5)
        Spacer()
            .frame(height: 20)

        Text(LocalizationConstant.Common.helloText.localized(settings.lang))
            .foregroundColor(.gray)
        Text("john@gmail.com")
            .foregroundColor(.black)
            .contextMenu {
                Button {
                    print("Change email")
                } label: {
                    Label("Change email", systemImage: "globe")
                }

                Button {
                    print("Edit email")
                } label: {
                    Label("Edit email", systemImage: "location.circle")
                }
            }
        List {
            Text(LocalizationConstant.Common.apiLogs.localized(settings.lang))
                .foregroundColor(.black)
                .onTapGesture(perform: {
                    isPresented = true
                })
            DropdownView()
        }
        .shadow(radius: 10)
        }
        .background(AsyncImage(url: urlString) { image in
                            image
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)

                        } placeholder: {
                            Image(systemName: "photo")
                                .imageScale(.large)
                                .frame(width: 110, height: 110)

                        })
    }}

struct ProfileView_Previews: PreviewProvider {
    @State static var url = URL(string: "")!
    static var previews: some View {
        ProfileView(urlString: $url)
    }
}
