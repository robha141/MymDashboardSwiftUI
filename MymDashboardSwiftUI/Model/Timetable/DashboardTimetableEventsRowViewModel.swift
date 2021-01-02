import Foundation

final class DashboardTimetableEventsRowViewModel: DashboardRowViewModel {
    
    var id: String = UUID().uuidString
    var items = [DashboardTimetableEventViewModel]()
    
    init() {
        generateRandomItems()
    }
    
    func generateRandomItems() {
        items = (0 ..< Int.random(in: 1 ... 10))
            .map { _ in DashboardTimetableEventViewModel.generateRandomEvent() }
    }
}
