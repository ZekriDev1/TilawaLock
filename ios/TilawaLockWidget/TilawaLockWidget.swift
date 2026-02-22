import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), timeRemaining: 60, versesCompleted: 3, totalVerses: 5, streak: 7, message: "Discipline begins with recitation.")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), timeRemaining: 60, versesCompleted: 3, totalVerses: 5, streak: 7, message: "Discipline begins with recitation.")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let userDefaults = UserDefaults(suiteName: "group.com.zekri.coranappacces")
        let timeRemaining = userDefaults?.integer(forKey: "time_remaining") ?? 0
        let versesCompleted = userDefaults?.integer(forKey: "verses_completed") ?? 0
        let totalVerses = userDefaults?.integer(forKey: "total_verses") ?? 5
        let streak = userDefaults?.integer(forKey: "streak") ?? 0
        let message = userDefaults?.string(forKey: "motivation_message") ?? "Discipline begins with recitation."

        let entry = SimpleEntry(
            date: Date(),
            timeRemaining: timeRemaining,
            versesCompleted: versesCompleted,
            totalVerses: totalVerses,
            streak: streak,
            message: message
        )

        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let timeRemaining: Int
    let versesCompleted: Int
    let totalVerses: Int
    let streak: Int
    let message: String
}

struct TilawaLockWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("TilawaLock")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "D4AF37"))
                Spacer()
                Text("\(entry.streak)d Streak")
                    .font(.caption2)
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Time Remaining")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.7))
                
                Text("\(entry.timeRemaining / 60)h \(entry.timeRemaining % 60)m")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            ProgressView(value: Double(entry.versesCompleted), total: Double(entry.totalVerses))
                .accentColor(Color(hex: "D4AF37"))
                .scaleEffect(x: 1, y: 0.5, anchor: .center)
            
            Text("Recitation: \(entry.versesCompleted) / \(entry.totalVerses)")
                .font(.system(size: 10))
                .foregroundColor(.white.opacity(0.7))
            
            Text(entry.message)
                .font(.system(size: 11))
                .italic()
                .foregroundColor(Color(hex: "D4AF37"))
                .lineLimit(1)
        }
        .padding()
        .background(Color(hex: "0F3D3E"))
    }
}

@main
struct TilawaLockWidget: Widget {
    let kind: String = "TilawaLockWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TilawaLockWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("TilawaLock Discipline")
        .description("Track your recitation and app usage limits.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
