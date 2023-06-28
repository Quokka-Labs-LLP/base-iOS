//
//  RoundCornerShape.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import SwiftUI

struct RoundCornerShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundCornerShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundCornerShape(radius: 200, corners: [.topRight, .bottomRight])
            .padding()
            .frame(width: 400, height: 400)

    }
}
