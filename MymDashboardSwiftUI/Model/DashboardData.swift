import Combine
import Foundation
import Rswift

final class DashboardData: ObservableObject {
    
    @Published
    var sections = [DashboardSectionViewModel]()
    
    init() {
        sections = [
            DashboardSectionViewModel(items: [DashboardNavigationItemsRowViewModel()]),
            DashboardTimetableSectionViewModel(),
            DashboardFoodSectionViewModel(),
            createTasksSection()
        ]
    }
}

// MARK: - Fake data

extension DashboardData {
    
    func createTasksSection() -> DashboardSectionViewModel {
        DashboardSectionViewModel(
            items: [
                DashboardTaskRowViewModel(),
                DashboardTaskRowViewModel(),
                DashboardTaskRowViewModel(),
                DashboardTaskRowViewModel()
            ],
            sectionName: "Planned tasks"
        )
    }
}
