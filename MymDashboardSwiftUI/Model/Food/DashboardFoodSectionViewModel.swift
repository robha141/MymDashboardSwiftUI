import Combine
import Foundation

final class DashboardFoodSectionViewModel: DashboardSectionViewModel {
    
    init() {
        super.init(sectionName: "Food menu")
        let canteens = DashboardCanteensRowViewModel { [weak self] canteen in
            self?.items.removeAll(where: { ($0 as? DashboardFoodRowViewModel) != nil })
            self?.items.append(contentsOf: canteen.foods)
        }
        items = [canteens]
        canteens.selectedCanteenChange(newIndex: 0)
    }
    
    private func generateFoods() {
        items.removeSubrange(1 ..< items.count)
        items.append(contentsOf: (0 ..< Int.random(in: 1 ... 10)).map { _ in DashboardFoodRowViewModel.generateRandomFood() })
    }
}
