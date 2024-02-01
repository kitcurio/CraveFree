//
//  Onboarding.swift
//  CraveFree
//
//  Created by Kasia Rivers on 2/1/24.
//

import SwiftUI


struct Onboarding: View {
    let gradient = LinearGradient(stops: [
        .init(color: Color.purble, location: 0),
        .init(color: Color.lilac, location: 0.25),
        .init(color: Color.bloo, location: 0.33),
        .init(color: Color.froth, location: 0.8)],
                                  startPoint: .top,
                                  endPoint: .bottom)
    var body: some View {
        ZStack {
            Image("newgradient")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Welcome to CraveFree")
            }
            
            
        }
        
    }
}

#Preview {
    Onboarding()
}
