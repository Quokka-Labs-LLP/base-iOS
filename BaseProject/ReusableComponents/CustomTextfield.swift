//
//  CustomTextfield.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//
import SwiftUI

struct CustomTextfield: View {
    
    //MARK: - Properties
    var imageName : String = ""
    var placeholderText : String = ""
   @Binding var inputString : String
    
    //MARK: - View Builder
    var body: some View {
        HStack(content: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 66)
                .foregroundColor(.white)
                .padding(.leading,-15)
                .padding(.trailing,40)
            TextField("",text: $inputString,prompt: Text(placeholderText).foregroundColor(.white)).foregroundColor(.white)
        }).padding()
            .frame(width: 320,height: 65)
        .background{
            RoundedRectangle(cornerRadius: 32)
                .strokeBorder(.white)
        }
    }
}

//MARK: - Previews
struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(inputString: .constant(""))
    }
}
