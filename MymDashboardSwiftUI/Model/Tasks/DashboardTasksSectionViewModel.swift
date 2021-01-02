final class DashboardTasksSectionViewModel: DashboardSectionViewModel {
    
    init() {
        super.init(sectionName: "Planned tasks")
        generateRandomTasks()
    }
    
    func generateRandomTasks() {
        let random = Int.random(in: 1 ... 100)
        if random < 30 {
            items = [DashboardPlaceholderItem.noTasks]
        } else {
            items = (0 ... Int.random(in: 1 ... 15))
                .map { _ in DashboardTaskRowViewModel.generateRandomTask() }
        }
    }
}
