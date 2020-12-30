import SwiftUI
import Rswift

struct DashboardTimetableEventView: View {
    
    let eventName: String
    let eventPlaceName: String
    let eventTime: String
    let eventProgress: Double
    let eventIcon: ImageResource
    
    // MARK: - View
    
    var body: some View {
        VStack {
            creteContentView()
            ProgressView(value: 0.5, total: 1)
                .accentColor(R.color.primary.color)
                .scaleEffect(x: 1, y: 2, anchor: .center)
        }
        .frame(
            width: Self.calculatedContentWidth,
            height: Self.calculatedContentHeight
        )
        .cardStyle(padding: 0, hasShadow: true)
    }
    
    private func creteContentView() -> some View {
        VStack {
            HStack(alignment: .top) {
                Text(eventName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(R.color.cardTitle.color)
                    .lineLimit(3)
                Spacer()
                eventIcon.image
                    .foregroundColor(R.color.roundedIconPrimaryTint.color)
                    .frame(size: .kCardLeadingIconSize)
                    .background(R.color.roundedIconPrimaryBcg.color)
                    .clipShape(Circle())
            }
            Spacer()
            HStack {
                Text(eventPlaceName)
                    .font(.subheadline)
                    .foregroundColor(R.color.cardSubtitle.color)
                Spacer()
                Text(eventTime)
                    .font(.subheadline)
                    .foregroundColor(R.color.cardSubtitle.color)
            }
        }
        .padding(.kPaddingS)
    }
}

extension DashboardTimetableEventView: HasCalculatedContentHeight {
    
    static var calculatedContentHeight: CGFloat { 140 }
}

extension DashboardTimetableEventView: HasCalculatedContentWidth {
    
    static var calculatedContentWidth: CGFloat { 285 }
}

struct DashboardTimetableEventView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTimetableEventView(
            eventName: "Computer Graphics 2",
            eventPlaceName: "Q02",
            eventTime: "10:00 - 12:00",
            eventProgress: 0.5,
            eventIcon: R.image.timetable_other24px
        )
        .frame(height: 400)
        .padding(20)
        .background(R.color.appBackground.color)
    }
}
