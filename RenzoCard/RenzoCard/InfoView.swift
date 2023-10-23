//
//  InfoView.swift
//  RenzoCard
//
//  Created by Renzo on 23/10/2023.
//

import SwiftUI


struct InfoView: View {
    
    let text: String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(Color.green)
                Text(text)
            })
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Test Value", imageName: "house")
            .previewLayout(.sizeThatFits)
    }
}
