//
//  CustomAlert.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct CustomAlert: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Text("Hello,SILive")
            Text("I am a custom alert")
        })
        .frame(width: UIConstants.screenWidth - 200, height: UIConstants.screenWidth - 200, alignment: .center)
        .background(Color.red)
        
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert()
    }
}


struct VlCustomAlert: View {
    var onTap: (Bool) -> Void
    var actionBtnTitle = "Leave Room"
    var title: String? = "Confirm you want to leave the room"
    var subTitle: String? = "Leaving the interview room may affect the schedule of any candidates currently in the lobby."
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                CustomLabel(title: title ?? "",
                            fontSize: 16,
                            weight: .medium,
                            titleColor: AppColor.white.value).padding(.leading, 15)
                Spacer()
            }.frame(width: UIConstants.screenWidth * 0.85, height: 50).background(AppColor.primaryAppColor.value)
            
            CustomLabel(title: subTitle ?? "",
                        fontSize: 16,
                        weight: .medium,
                        titleColor: AppColor.primaryAppColor.value)
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            
            HStack(spacing: 20){
                Spacer()
                Button(action: {
                    onTap(false)
                }, label: {
                    CustomLabel(title: "Cancel",
                                fontSize: 14,
                                weight: .medium,
                                titleColor: AppColor.primaryAppColor.value)
                    .frame(height: 40).padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    .background(Rectangle().fill(Color.clear).cornerRadius(15))
                    .border(AppColor.primaryAppColor.value, width: 1)
                })
                
                Button(action: {
                    onTap(true)
                }, label: {
                    CustomLabel(title: actionBtnTitle,
                                fontSize: 14,
                                weight: .medium,
                                titleColor: AppColor.white.value)
                    .frame(height: 40).padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    .background(Rectangle().fill(AppColor.primaryAppColor.value).cornerRadius(15))
                   
                })
            }.padding(10)
        }
        .frame(width: UIConstants.screenWidth * 0.85)
        .background(Rectangle().fill(Color.white).shadow(radius: 3))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
