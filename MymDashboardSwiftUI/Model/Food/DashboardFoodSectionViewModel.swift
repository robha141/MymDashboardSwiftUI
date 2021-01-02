import Combine
import Foundation

final class DashboardFoodSectionViewModel: DashboardSectionViewModel {
    
    init() {
        super.init(sectionName: "Food menu")
        let canteens = DashboardCanteensRowViewModel { [weak self] in
            self?.updateFoodItems(with: $0)
        }
        items = [canteens]
        canteens.selectedCanteenChange()
    }
    
    func generateRandomFoodsInCanteens() {
        guard let canteens = items[0] as? DashboardCanteensRowViewModel else {
            return
        }
        canteens.generateRandomFoodsInCanteens()
    }
    
    func updateFoodItems(with canteen: DashboardFoodCanteenViewModel) {
        items.removeAll(where: { ($0 as? DashboardFoodRowViewModel) != nil })
        items.append(contentsOf: canteen.foods)
    }
}
