//
//  ContentView.swift
//  CraveFree
//
//  Created by Kasia Rivers on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("tapCount") private var tapCount = 0
    @State private var showAlert = false
    
    let gradient = LinearGradient(stops: [
        .init(color: Color.lilac, location: 0),
        .init(color: Color.bloo, location: 0.3),
        .init(color: Color.froth, location: 0.9)],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    let gradientTwo = LinearGradient(stops: [
        .init(color: Color.lilac, location: 0),
        .init(color: Color.bloo, location: 0.3),
        .init(color: Color.froth, location: 0.9)],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing)
    
    
    var body: some View {
        ZStack {
            Color(Color.lite)
                .ignoresSafeArea()
            VStack{
                
                HStack {
                    Text(Date.now, format: .dateTime.weekday(.wide).day().month())
                        .frame(minWidth: 300, alignment: .leading)
                        .foregroundStyle(.black)
                        .font(.custom("Asap-Regular", size: 20))
                        .padding(.leading, 32)
                    Spacer()
                }
               
                Spacer()
                    .frame(height: 75)
    //Circles & button ZStack:
                ZStack{
                    
                    Circle()
                        .stroke(LinearGradient(stops: [
                            .init(color: Color.purble, location: 0),
                            .init(color: Color.lilac, location: 0.25),
                            .init(color: Color.bloo, location: 0.33),
                            .init(color: Color.froth, location: 0.8)],
                                                      startPoint: .top,
                                                      endPoint: .bottom), lineWidth: 50)
                        .stroke(Color.white, lineWidth: 30)
                        .frame(maxWidth: 275, maxHeight: 275)
                    
                    Circle()
                        .foregroundStyle(Color.lite)
                        .frame(maxWidth: 245, maxHeight: 245)
                    
//                    Circle()
//                        .fill(gradient)
//                        .frame(maxWidth: 180, maxHeight: 180)
//                        .shadow(color: Color.shadow, radius: 4, x: 2, y: 4)
                    
                    
                    Button(action: {
                        tapCount += 1
                        
                    }, label: {
                        Text("\(tapCount)")
                            .contentTransition(.numericText())
                            .frame(width: 200, height: 200)
                            .foregroundStyle(.white.shadow(.inner(color: Color.shadow, radius: 1, y: 1)))
                            .font(.custom("Asap-Bold", size: 85))
                            .background(gradient)
                            .clipShape(Circle())
                            .shadow(color: Color.shadow, radius: 4, x: 2, y: 4)
        
                    })
                    
                }

                
                Spacer()
                    .frame(height: 75)
                
                HStack {
                    Spacer()
                    Text("DO BETTER")
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    .font(.custom("Asap-Regular", size: 35))
                    Spacer()
                    
                }
                Spacer()
                    .frame(maxHeight: 150)
                
                // RESET BUTTON
                
                Button(action: {
        
                    showAlert = true
                    
                }, label: {
                    Text("RESET COUNTER")
                        .font(.custom("Asap-Regular", size: 15))
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                        .background(Color.white)
                        .cornerRadius(17)
                        .foregroundStyle(.black)
                        .shadow(color: Color.shadow, radius: 4, x: 4, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(gradientTwo, lineWidth: 8)
                        )
                })
                .frame(alignment: .bottom)
                .alert("Are you sure you want to reset?", isPresented: $showAlert) {
                    Button("Reset", role: .destructive) {
        
                        tapCount = 0
                        
                    }
                    Button("Cancel", role: .cancel) {}
                }
            }
            .frame(alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
