import SwiftUI
import Rswift

struct DashboardTimetableEventView: View {
    
    let eventName: String
    let eventPlaceName: String
    let eventTime: String
    let eventProgress: Double
    let eventIcon: ImageResource
    
    var body: some View {
        VStack {
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
                        .frame(width: 36, height: 36)
                        .background(R.color.roundedIconPrimaryBcg.color)
                        .cornerRadius(18)
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
            ProgressView(value: 0.5, total: 1)
                .accentColor(R.color.primary.color)
                .scaleEffect(x: 1, y: 2, anchor: .center)
        }
        .frame(height: Self.calculatedContentHeight)
        .background(R.color.roundedCell.color)
        .cornerRadius(11)
        .shadow(
            color: R.color.cardShadow.color.opacity(0.1),
            radius: 5
        )
    }
}

extension DashboardTimetableEventView: HasCalculatedContentHeight {
    
    static var calculatedContentHeight: CGFloat { 150 }
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
        .padding()
        .background(R.color.appBackground.color)
    }
}
