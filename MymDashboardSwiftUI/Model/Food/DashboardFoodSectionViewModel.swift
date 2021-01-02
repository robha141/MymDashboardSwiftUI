import Combine
import Foundation

final class DashboardFoodSectionViewModel: DashboardSectionViewModel {
    
    init() {
        super.init(
            items: [],
            id: UUID().uuidString,
            sectionName: "Food menu"
        )
        let canteens = DashboardCanteensRowViewModel { [weak self] _ in
            self?.generateFoods()
        }
        items = [
            canteens,
            DashboardFoodRowViewModel(),
            DashboardFoodRowViewModel(),
            DashboardFoodRowViewModel()
        ]
    }
    
    private func generateFoods() {
        items.removeSubrange(1 ..< items.count)
        items.append(contentsOf: (0 ..< Int.random(in: 1 ... 5)).map { _ in DashboardFoodRowViewModel() })
    }
}
