final class DashboardTimetableSectionViewModel: DashboardSectionViewModel {
    
    init() {
        super.init(sectionName: "Today events")
        generateItems()
    }
    
    func generateItems() {
        let random = Int.random(in: 1 ... 100)
        if random < 15 {
            items = [DashboardPlaceholderItem.noEventsToday]
        } else if random >= 15 && random < 30 {
            items = [DashboardPlaceholderItem.noEventsLeft]
        } else {
            items = [DashboardTimetableEventsRowViewModel()]
        }
    }
}
