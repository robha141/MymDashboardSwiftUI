import SwiftUI

struct DashboardTimetableEventItemsView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .kPaddingS) {
                ForEach(
                    0 ..< 8,
                    content: { _ in
                        DashboardTimetableEventView(
                            eventName: "Computer Graphics 2",
                            eventPlaceName: "Q02",
                            eventTime: "10:00 - 12:00",
                            eventProgress: 0.5,
                            eventIcon: R.image.timetable_other24px
                        )
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: .kPaddingL, bottom: 0, trailing: .kPaddingL))
        }
    }
}

struct DashboardTimetableEventItemsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTimetableEventItemsView()
            .frame(height: 400)
            .background(R.color.appBackground.color)
    }
}
