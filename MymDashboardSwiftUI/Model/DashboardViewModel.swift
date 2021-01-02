import Combine

final class DashboardViewModel: ObservableObject {
    
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
    
    func generateRandomTimetable() {
        (sections[1] as? DashboardTimetableSectionViewModel)?.generateItems()
    }
    
    func generateRandomFoods() {
        (sections[2] as? DashboardFoodSectionViewModel)?.generateRandomFoodsInCanteens()
    }
    
    func generateRandomTasks() {
        (sections[3] as? DashboardTasksSectionViewModel)?.generateRandomTasks()
    }
    
    func generateRandomEverything() {
        generateRandomTimetable()
        generateRandomFoods()
        generateRandomTasks()
    }
}
