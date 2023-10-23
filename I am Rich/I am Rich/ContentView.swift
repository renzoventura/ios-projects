//
//  ContentView.swift
//  I am Rich
//
//  Created by Renzo on 23/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.accentColor)
                Text("I am a rich person with this app!").font(.system(size: 50)).fontWeight(.bold)
                    .foregroundColor(Color.white)
                
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
