//
//  ContentView.swift
//  RenzoCard
//
//  Created by Renzo on 23/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.76, green: 0.88, blue: 0.77).edgesIgnoringSafeArea(.all)
            VStack {
                Image("renzo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Renzo Ventura")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("Senior Software Engineer")
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+61 123 456 789", imageName: "phone.fill")
                InfoView(text: "renzo@gmail.com", imageName: "mail.fill")
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
