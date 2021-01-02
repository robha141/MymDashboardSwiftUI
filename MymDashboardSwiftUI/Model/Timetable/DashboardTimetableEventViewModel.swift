import Rswift

struct DashboardTimetableEventViewModel {
    
    let id = UUID().uuidString
    let eventName: String
    let eventPlaceName: String
    let eventTime: String
    let eventProgress: Double
    let eventIcon: ImageResource
}

extension DashboardTimetableEventViewModel {
    
    static func generateRandomEvent() -> DashboardTimetableEventViewModel {
        DashboardTimetableEventViewModel(
            eventName: [
                    "Computer graphics II",
                    "Advanced user interfaces",
                    "Software engineering I",
                    "Software engineering II",
                    "Information systems",
                    "Artifical inteligence II"
                ]
                .randomElement()!,
            eventPlaceName: [
                    "Q01",
                    "Q02",
                    "Q03",
                    "Q12",
                    "Q15",
                    "Q16"
                ]
                .randomElement()!,
            eventTime: [
                    "7:00 - 9:00",
                    "9:00 - 11:00",
                    "11:00 - 13:00",
                    "13:00 - 15:00",
                    "15:00 - 17:00"
                ]
                .randomElement()!,
            eventProgress: [
                    0,
                    0.3,
                    0.5,
                    0.8,
                    1
                ]
                .randomElement()!,
            eventIcon: [
                    R.image.timetable_other24px,
                    R.image.lecture24px,
                    R.image.seminar24px
                ]
                .randomElement()!
        )
    }
}
