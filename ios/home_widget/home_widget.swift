//
//  home_widget.swift
//  home_widget
//
//  Created by Jamaldin on 5/8/23.
//

import WidgetKit
import SwiftUI

private let widgetGroupId = "group.motivation_app_group"

let defImageUrl = "https://firebasestorage.googleapis.com/v0/b/kyrgyz-1.appspot.com/o/bg.png?alt=media&token=df2836ce-9a5c-4035-b059-18b2ec45feeb"

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "title", description: "mess", imageUrl: defImageUrl)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let data = UserDefaults.init(suiteName: widgetGroupId)
        let allKeys = data!.dictionaryRepresentation().keys
        var title = ""
        var des = ""
        var image = defImageUrl
        for key in allKeys {
            if let value = data!.value(forKey: key) {
                if key == "title" {
                    title = "\(value)"
                }
                if key == "description" {
                    des = "\(value)"
                }
                if key == "imageUrl" {
//                    des = "\(value)"
                    image = "\(value)"
                }
            }
        }
//        let entry = SimpleEntry(date: Date(), title: data?.string(forKey: "title") ?? "NoTitleSet", description: data?.string(forKey: "description") ?? "NoDescriptionSet2", imageUrl: URL(string: data?.string(forKey: "imageUrl") ?? defImageUrl)!)
        let entry = SimpleEntry(date: Date(), title: title, description: des, imageUrl: image)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        getSnapshot(in: context) { (entry) in
                    let timeline = Timeline(entries: [entry], policy: .atEnd)
                    completion(timeline)
        }
    }

//    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        getSnapshot(in: context) { (entry) in
//            let timeline = Timeline(entries: [entry], policy: .atEnd)
//            completion(timeline)
//        }
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
    let description: String
    let imageUrl: String
}

struct home_widgetEntryView : View {
    var entry: Provider.Entry
    @State private var image: UIImage?

    var body: some View {
        ZStack{
            if let data = try? Data(contentsOf: URL(string: entry.imageUrl)!),
               let image = UIImage(data: data) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
            Color.black
                            .opacity(0.6) // Adjust opacity value as needed
                            .edgesIgnoringSafeArea(.all)
        
                VStack {
                    Text(entry.title)
                        .foregroundColor(.white)
                    Text(entry.description)
                    //                    .font(.body)
                        .foregroundColor(.white)
                }
                .onAppear {
                            // Download the image from the URL
                            let url = URL(string: defImageUrl)!
                            let data = try? Data(contentsOf: url)
                            if let data = data {
                                image = UIImage(data: data)
                            }
                        }

        }
    }
}

struct home_widget: Widget {
    let kind: String = "home_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            home_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct home_widget_Previews: PreviewProvider {
    static var previews: some View {
        home_widgetEntryView(entry: SimpleEntry(date: Date(), title: "title", description: "mess", imageUrl: defImageUrl))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
