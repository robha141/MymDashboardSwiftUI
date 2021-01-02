import Rswift

enum DashboardNavigationItem: Int, CaseIterable {
    
    case timetable
    case map
    case canteen
    case faq
    case tasks
    case about
    
    var title: String {
        switch self {
        case .timetable:
            return "Schedule"
        case .map:
            return "Map"
        case .canteen:
            return "Canteen"
        case .faq:
            return "FAQ"
        case .tasks:
            return "Tasks"
        case .about:
            return "About"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .timetable:
            return R.image.calendar24px
        case .map:
            return R.image.location_marker24px
        case .canteen:
            return R.image.food_default24px
        case .faq:
            return R.image.comment24px
        case .tasks:
            return R.image.tasks24px
        case .about:
            return R.image.about24px
        }
    }
}
