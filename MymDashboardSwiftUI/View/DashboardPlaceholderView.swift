import SwiftUI
import Rswift

struct DashboardPlaceholderView: View {
    
    let titleText: String
    let bottomText: String
    let backgroundImage: ImageResource
    
    var body: some View {
        ZStack(alignment: .leading) {
            backgroundImage.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(titleText)
                    .foregroundColor(R.color.basicWhiteBlack.color)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Text(bottomText)
                    .foregroundColor(R.color.basicWhiteBlack.color)
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            .padding(.kPaddingL)
        }
        .frame(height: 260)
        .background(R.color.roundedCell.color)
        .cornerRadius(.kCornerRadius)
        .padding(EdgeInsets(top: 0, leading: .kPaddingL, bottom: 0, trailing: .kPaddingL))
    }
}

// MARK: - Default placeholders

extension DashboardPlaceholderView {
    
    static var createEventPlaceholder: DashboardPlaceholderView {
        DashboardPlaceholderView(
            titleText: "Create an event",
            bottomText: "Download the available timetable or schedule an event.",
            backgroundImage: R.image.create_events
        )
    }
    
    static var noEventsTodayPlaceholder: DashboardPlaceholderView {
        DashboardPlaceholderView(
            titleText: "No further events",
            bottomText: "There are no events to attend today. Just relax.",
            backgroundImage: R.image.no_events_today
        )
    }
    
    static var noEventsLeftPlaceholder: DashboardPlaceholderView {
        DashboardPlaceholderView(
            titleText: "No events left",
            bottomText: "There are no scheduled events left. Take a rest.",
            backgroundImage: R.image.no_events_left
        )
    }
    
    static var noTasksPlaceholder: DashboardPlaceholderView {
        DashboardPlaceholderView(
            titleText: "No tasks",
            bottomText: "All tasks accomplished!",
            backgroundImage: R.image.tasks
        )
    }
}

// MARK: - Previews

struct DashboardPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardPlaceholderView.noEventsLeftPlaceholder
            .frame(height: 400)
            .background(R.color.appBackground.color)
    }
}
