//
//  ContentView.swift
//  CraveFreeTracker
//
//  Created by Kasia Rivers on 4/4/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("tapCount", store: UserDefaults(suiteName: "group.academy.C4Project")) var tapCount = 0
    @State private var showAlert = false
    @State private var pressed = false
    @State private var antiMantraActive = true
      
      @State private var antiMantra = ""
      @State private var selectedCategory: AntiMantraCategory = .neutral
      
      private func generateAntiMantra() {
          let filteredPhrases = antiMantraList.filter { $0.category == selectedCategory }
          let randomAntiMantra = filteredPhrases.randomElement() ?? AntiMantra(text: "", category: .neutral)
          antiMantra = randomAntiMantra.text
          antiMantraActive = true
      }
      
      enum AntiMantraCategory {
          case encouraging, neutral, demeaning
      }
      
      struct AntiMantra {
          let text: String
          let category: AntiMantraCategory
      }
      
      // changing mantra levels for enum, currently set to begin with .neutral
      
      let antiMantraList: [AntiMantra] = [
          
          AntiMantra(text: "YOU DON'T NEED IT", category: .encouraging),
          AntiMantra(text: "GO FOR A WALK", category: .encouraging),
          AntiMantra(text: "YOU'RE SAVING $", category: .encouraging),
          AntiMantra(text: "FIRST WEEK IS THE HARDEST", category: .encouraging),
          AntiMantra(text: "YOU'RE MAKING POSITIVE CHOICES FOR YOUR HEALTH", category: .encouraging),
          AntiMantra(text: "EVERY MOMENT WITHOUT NICOTINE IS A STEP TOWARD A HEALTHIER YOU", category: .encouraging),
          AntiMantra(text: "YOUR BODY THANKS YOU FOR CHOOSING TO QUIT", category: .encouraging),
          AntiMantra(text: "CELEBRATE EACH SMALL VICTORY ON YOUR JOURNEY TO QUIT NICOTINE", category: .encouraging),
          AntiMantra(text: "MOVE FORWARD WITHOUT NICOTINE", category: .encouraging),
          AntiMantra(text: "EMBRACE THE FREEDOM FROM NICOTINE, WHERE EVERY BREATH FEELS LIKE A VICTORY", category: .encouraging),
          AntiMantra(text: "YOU'RE CHOOSING LIFE OVER A CLOUD – AND THAT'S A BEAUTIFUL DECISION", category: .encouraging),
          AntiMantra(text: "CELEBRATE EACH DAY SMOKE-FREE; YOU'RE THE MAIN CHARACTER IN YOUR STORY", category: .encouraging),
          AntiMantra(text: "BREAKING FREE FROM NICOTINE, BECAUSE YOU DESERVE A HEALTHIER, HAPPIER YOU", category: .encouraging),
          AntiMantra(text: "YOUR JOURNEY TO A SMOKE-FREE LIFE IS A TESTAMENT TO YOUR STRENGTH AND SELF-LOVE", category: .encouraging),
          AntiMantra(text: "STEP INTO A SMOKE-FREE ZONE; YOUR LUNGS WILL THANK YOU LATER", category: .encouraging),
          AntiMantra(text: "CHOOSING HEALTH OVER HABIT, ONE DAY AT A TIME", category: .encouraging),
          AntiMantra(text: "EACH DAY WITHOUT NICOTINE IS A STEP TOWARDS A BRIGHTER, SMOKE-FREE FUTURE", category: .encouraging),
          AntiMantra(text: "BREATHE IN FREEDOM, BREATHE OUT THE OLD HABITS – YOU'RE ON THE RIGHT TRACK", category: .encouraging),
          AntiMantra(text: "YOUR DECISION TO QUIT SPEAKS LOUDER THAN ANY SMOKE-FILLED ROOM EVER COULD", category: .encouraging),
  //        AntiMantra(text: "", category: .encouraging),
          
          
          AntiMantra(text: "CHEW ON SOMETHING", category: .neutral),
          AntiMantra(text: "GO BUY A FIDGET TOY", category: .neutral),
          AntiMantra(text: "TAKE A DEEP BREATH AND EMBRACE THE NICOTINE-FREE MOMENT", category: .neutral),
          AntiMantra(text: "YOU'RE IN CONTROL OF YOUR CHOICES, INCLUDING SAYING NO TO NICOTINE", category: .neutral),
          AntiMantra(text: "STAY FOCUSED ON YOUR GOALS, ONE STEP AT A TIME", category: .neutral),
          AntiMantra(text: "A NICOTINE-FREE LIFE IS A HEALTHIER LIFE", category: .neutral),
          AntiMantra(text: "QUITTING NICOTINE – BECAUSE IT'S JUST ANOTHER CHOICE IN LIFE'S MENU", category: .neutral),
          AntiMantra(text: "NAVIGATING LIFE WITHOUT NICOTINE: A SIMPLE DETOUR ON THE ROAD OF HABITS.", category: .neutral),
          AntiMantra(text: "EVERY DAY WITHOUT SMOKING IS A STEP TOWARD A DIFFERENT KIND OF NORMAL", category: .neutral),
          AntiMantra(text: "CHOOSING FREEDOM FROM NICOTINE: NEITHER GOOD NOR BAD, JUST DIFFERENT", category: .neutral),
          AntiMantra(text: "YOUR JOURNEY TO QUIT – NOT A SPRINT, NOT A MARATHON, JUST A STROLL", category: .neutral),
          AntiMantra(text: "YOU'RE LEAVING NICOTINE IN THE DUST – WHERE IT BELONGS", category: .neutral),
          AntiMantra(text: "QUITTING SMOKING – BECAUSE LIFE IS FULL OF INTERESTING CHOICES", category: .neutral),
          AntiMantra(text: "ONE LESS CIGARETTE, ONE MORE STEP TOWARDS A BALANCED LIFE", category: .neutral),
          AntiMantra(text: "BREAKING THE HABIT: A SIMPLE SHIFT IN THE ROUTINE OF LIFE", category: .neutral),
          AntiMantra(text: "LIFE WITHOUT NICOTINE: DIFFERENT STROKES FOR DIFFERENT FOLKS", category: .neutral),
          AntiMantra(text: "STRIDING THROUGH THE SMOKE-FREE JOURNEY – NOT GOOD OR BAD, JUST DIFFERENT", category: .neutral),
  //        AntiMantra(text: "", category: .neutral),
     
          
          AntiMantra(text: "GET IT TOGETHER", category: .demeaning),
          AntiMantra(text: "DO BETTER", category: .demeaning),
          AntiMantra(text: "YOU CAN GET LUNG CANCER BY THE WAY", category: .demeaning),
          AntiMantra(text: "NICOTINE CAUSES ANXIETY", category: .demeaning),
          AntiMantra(text: "NICOTINE CAUSES ANXIETY, & YOU ALREADY HAVE ENOUGH OF THAT TO ADD ON MORE", category: .demeaning),
          AntiMantra(text: "NICOTINE DOESN'T CONTROL YOU; YOU CONTROL YOUR CHOICES", category: .demeaning),
          AntiMantra(text: "DON'T LET NICOTINE BE THE BOSS OF YOUR WELL-BEING", category: .demeaning),
          AntiMantra(text: "SMOKING? THAT'S SO LAST YEAR", category: .demeaning),
          AntiMantra(text: "YOU'RE STRONGER THAN NICOTINE'S GRIP, BREAK FREE", category: .demeaning),
          AntiMantra(text: "BREAKING UP WITH NICOTINE: BECAUSE WHO NEEDS THAT TOXIC RELATIONSHIP ANYWAY?", category: .demeaning),
          AntiMantra(text: "CONGRATULATIONS, YOU'VE OUTSMARTED A NICOTINE ADDICTION. A ROUND OF APPLAUSE, PLEASE", category: .demeaning),
          AntiMantra(text: "QUIT SMOKING: BECAUSE YOUR LUNGS DESERVE BETTER THAN A NICOTINE SPA", category: .demeaning),
          AntiMantra(text: "KICKING NICOTINE TO THE CURB – A BREAKUP YOU WON'T REGRET", category: .demeaning),
          AntiMantra(text: "YOU'RE OUTSMARTING A HABIT THAT THOUGHT IT HAD YOU FOOLED. CHEERS TO THAT!", category: .demeaning),
          AntiMantra(text: "QUITTING SMOKING: BECAUSE YOUR BODY DESERVES A DETOX, NOT A SMOKE BREAK", category: .demeaning),
          AntiMantra(text: "NICOTINE-FREE LIVING: WHERE YOUR HEALTH TAKES CENTER STAGE", category: .demeaning),
      ]
    
    
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
               VStack {
                   HStack {
                       Text(Date.now, format: .dateTime.weekday(.wide).day().month())
                           .frame(minWidth: 300, alignment: .leading)
                           .font(.custom("Asap-Regular", size: 24))
                           .padding(.leading, 17)
                           .padding(.top, 30)
                           .padding(.bottom, 6.0)
                           .minimumScaleFactor(0.2)
                       Spacer()
                   }
                   
                   Picker(selection: $selectedCategory, label: Text("Select Category")) {
                       Text("Nice").tag(AntiMantraCategory.encouraging)
                       Text("Neutral").tag(AntiMantraCategory.neutral)
                       Text("Mean").tag(AntiMantraCategory.demeaning)
                   }
                   .pickerStyle(PalettePickerStyle())
                   .padding(.horizontal)
                   .padding(.top)
                   
                   Spacer()

                   
                   // Circles & button ZStack:
                   ZStack {
                       Circle()
                           .stroke(LinearGradient(stops: [
                               .init(color: Color.purble, location: 0),
                               .init(color: Color.lilac, location: 0.25),
                               .init(color: Color.bloo, location: 0.33),
                               .init(color: Color.froth, location: 0.8)],
                                                 startPoint: .top,
                                                 endPoint: .bottom), lineWidth: 55)
                           .stroke(Color.neutral, lineWidth: 35)
                           .frame(maxWidth: 255, maxHeight: 255)
                       Circle()
                           .foregroundStyle(Color.background)
                           .frame(maxWidth: 245, maxHeight: 245)
                       
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
                               ZStack {
                                   Text("\(tapCount)")
                                       .padding(.bottom, 25)
                                       .contentTransition(.numericText())
                                       .foregroundStyle(.white.shadow(.inner(color: Color.shadow, radius: 1, y: 1)))
                                       .frame(width: 160, height: 160)
                                       .font(.custom("Asap-Bold", size: 85))
                                   VStack {
                                       Image(systemName: "plus")
                                           .foregroundStyle(.white)
                                           .font(.title)
                                           .fontWeight(.bold)
                                           .offset(y: 60)
                                   }
                               }
                               .minimumScaleFactor(0.2)
                           })
//                           .sensoryFeedback(.levelChange, trigger: pressed)
                           .sensoryFeedback(.success, trigger: pressed)
                       }
                   }
                   .frame(minWidth: 300, minHeight: 300)

                   HStack {
                       if antiMantraActive {
                           Text(antiMantra)
                               .frame(width: 330, height: 230)
                               .multilineTextAlignment(.center)
                               .font(.custom("Asap-Regular", size: 35))
                       } else {
                          Text("")
                               .frame(width: 350, height: 230)

                       }
                   }
                   .minimumScaleFactor(0.35)

                   // RESET BUTTON
                   Button(action: {
                       showAlert = true
                   }, label: {
                       Text("RESET COUNTER")
                           .font(.custom("Asap-Regular", size: 15))
                           .minimumScaleFactor(0.35)
                           .padding(.horizontal, 25)
                           .padding(.vertical)
                           .background(Color.neutral)
                           .cornerRadius(47)
                           .foregroundStyle(Color.text)
                           .shadow(color: Color.shadow, radius: 4, x: 4, y: 5)
                           .overlay(
                               RoundedRectangle(cornerRadius: 47)
                                   .stroke(gradientTwo, lineWidth: 8)
                           )
                   })
                   .accessibilityLabel(Text("Press the button to reset the counter."))
                   .frame(alignment: .bottom)
                   .alert("Are you sure you want to reset?", isPresented: $showAlert) {
                       Button("Reset", role: .destructive) {
                           tapCount = 0
                           antiMantraActive = false
                           
                       }
                       Button("Cancel", role: .cancel) {}
                   }
               }
               .frame(alignment: .center)
               
               Spacer()
                   .frame(minHeight: 100)
               
//               .offset(y: -280) // Adjust this offset to move the picker upwards
           }
       }
   }

#Preview {
        ContentView()
        
    }
