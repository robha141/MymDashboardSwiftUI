import Combine

final class DashboardData: ObservableObject {
    
    @Published
    var sections = [DashboardSectionViewModel]()
    
    init() {
        sections = [
            DashboardSectionViewModel(items: [DashboardNavigationItemsRowViewModel()]),
            DashboardTimetableSectionViewModel(),
            DashboardFoodSectionViewModel(),
            DashboardTasksSectionViewModel()
        ]
    }
}
