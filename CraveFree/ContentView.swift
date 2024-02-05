//
//  ContentView.swift
//  CraveFree
//
//  Created by Kasia Rivers on 1/31/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("tapCount", store: UserDefaults(suiteName: "group.academy.CraveFree")) var tapCount = 0
    @State private var showAlert = false
    @State private var pressed = false
    
//    @State private var showAlert = false
    @State private var antiMantra = ""
    
    let antiMantraList = [
            "DO BETTER",
            "YOU DON'T NEED IT",
            "GET IT TOGETHER",
            "YOU CAN GET LUNG CANCER BY THE WAY",
            "GO FOR A WALK",
            "CHEW ON SOMETHING",
            "GO BUY A FIDGET TOY",
            "YOU'RE SAVING $$$",
            "FIRST WEEK IS THE HARDEST",
            "NICOTINE CAUSES ANXIETY"
        ]
    
    private func generateAntiMantra() {
         antiMantra = antiMantraList.randomElement() ?? ""
     }
    
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
            Color(Color.background)
                .ignoresSafeArea()
            VStack{
                Spacer()
                    .frame(height: 50)
                HStack {
                    Text(Date.now, format: .dateTime.weekday(.wide).day().month())
                        .frame(minWidth: 300, alignment: .leading)
//                        .foregroundStyle(.black)
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
                                                      endPoint: .bottom), lineWidth: 55)
                        .stroke(Color.neutral, lineWidth: 35)
                        .frame(maxWidth: 275, maxHeight: 275)
                    
                    Circle()
                        .foregroundStyle(Color.background)
                        .frame(maxWidth: 245, maxHeight: 245)
                    
//                    Circle()
//                        .fill(gradient)
//                        .frame(maxWidth: 180, maxHeight: 180)
//                        .shadow(color: Color.shadow, radius: 4, x: 2, y: 4)
                    
                    
                    ZStack {
                        Circle()
                            .fill(gradient)
                            .frame(maxWidth: 185, maxHeight: 185)
                            .shadow(color: Color.shadow, radius: 5, x: 2, y: 4)
                        
                        Button(action: {
                            tapCount += 1
                            pressed.toggle()
                            generateAntiMantra()
                            
                            WidgetCenter.shared.reloadTimelines(ofKind: "Widgety")
                            
                        }, label: {
                            ZStack{
                                
                                Text("\(tapCount)")
                                    .padding(.bottom, 25)
                                    .contentTransition(.numericText())
                                    .foregroundStyle(.white.shadow(.inner(color: Color.shadow, radius: 1, y: 1)))
                                    .frame(width: 180, height: 180)
                                    .font(.custom("Asap-Bold", size: 85))
                                   
                                VStack {
                                    Spacer()
                                        .frame(height: 100)
                                    Image(systemName: "plus")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                        .fontWeight(.black)
                                }
                            }
            
                    })
                        .sensoryFeedback(.success, trigger: pressed)
                    }
                    
                }
                .frame(minWidth: 300, minHeight: 300)

//                
//                Spacer()
//                    .frame(height: 75)
                
                HStack {
                    Spacer()
                  
                    Text(antiMantra)
                        .frame(width: 300, height: 150)
                        .multilineTextAlignment(.center)
                    .font(.custom("Asap-Regular", size: 35))
                    Spacer()
                    
                }
                Spacer()
                
                // RESET BUTTON
                
                Button(action: {
        
                    showAlert = true
                    
                }, label: {
                    Text("RESET COUNTER")
                        .font(.custom("Asap-Regular", size: 15))
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                        .background(Color.neutral)
                        .cornerRadius(17)
                        .foregroundStyle(Color.text)
                        .shadow(color: Color.shadow, radius: 4, x: 4, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(gradientTwo, lineWidth: 6)
                        )
                })
                .accessibilityLabel(Text("Press the button to reset the counter."))
                .frame(alignment: .bottom)
                .alert("Are you sure you want to reset?", isPresented: $showAlert) {
                    Button("Reset", role: .destructive) {
        
                        tapCount = 0
                        
                    }
                    Button("Cancel", role: .cancel) {}
                }
            }
            .frame(alignment: .center)
            
            Spacer()
                .frame(minHeight: 100)
        }
    }
}

#Preview {
        ContentView()
        
    }
