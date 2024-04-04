//
//  Widget.swift
//  Widget
//
//  Created by Kasia Rivers on 2/1/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), tapCount: data.progress())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), tapCount: data.progress())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, tapCount: data.progress())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let tapCount: Int
}

struct WidgetEntryView : View {
    let data = DataService()
    
    let gradient = LinearGradient(stops: [
        .init(color: Color.lilac, location: 0),
        .init(color: Color.bloo, location: 0.3),
        .init(color: Color.froth, location: 0.9)],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    var entry: Provider.Entry
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(LinearGradient(stops: [
                    .init(color: Color.purble, location: 0),
                    .init(color: Color.lilac, location: 0.25),
                    .init(color: Color.bloo, location: 0.33),
                    .init(color: Color.froth, location: 0.8)],
                                       startPoint: .top,
                                       endPoint: .bottom), lineWidth: 30)
                .stroke(Color.neutral, lineWidth: 10)
                .frame(maxWidth: 100, maxHeight: 100)
            
            Circle()
                .foregroundStyle(Color.background)
                .frame(maxWidth: 90, maxHeight: 90)
            
            ZStack {
                Circle()
                    .fill(gradient)
                    .frame(maxWidth: 70, maxHeight: 70)
                    .shadow(color: Color.shadow, radius: 4, x: 2, y: 4)
                Text(String(data.progress()))
                    .foregroundStyle(.white.shadow(.inner(color: Color.shadow, radius: 1, y: 1)))
                    .font(.custom("Asap-Bold", size: 35))
            }
        }
        
        
    }
}

struct Widgety: Widget {
    let kind: String = "Widgety"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    Widgety()
} timeline: {
    SimpleEntry(date: .now, tapCount: 0)
    SimpleEntry(date: .now, tapCount: 4)
}
