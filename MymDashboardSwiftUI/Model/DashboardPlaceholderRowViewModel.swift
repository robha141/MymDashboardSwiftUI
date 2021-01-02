import Foundation
import Rswift

struct DashboardPlaceholderItem: DashboardRowViewModel {
    
    var id: String = UUID().uuidString
    var titleText: String
    var bottomText: String
    var image: ImageResource
}

extension DashboardPlaceholderItem {
    
    static var createEvent: DashboardPlaceholderItem {
        DashboardPlaceholderItem(
            titleText: "Create an event",
            bottomText: "Download the available timetable or schedule an event.",
            image: R.image.create_events
        )
    }
    static var noEventsToday: DashboardPlaceholderItem {
        DashboardPlaceholderItem(
            titleText: "No further events",
            bottomText: "There are no events to attend today. Just relax.",
            image: R.image.no_events_today
        )
    }
    static var noEventsLeft: DashboardPlaceholderItem {
        DashboardPlaceholderItem(
            titleText: "No events left",
            bottomText: "There are no scheduled events left. Take a rest.",
            image: R.image.no_events_left
        )
    }
    static var noTasks: DashboardPlaceholderItem {
        DashboardPlaceholderItem(
            titleText: "No tasks",
            bottomText: "All tasks accomplished!",
            image: R.image.tasks
        )
    }
}
