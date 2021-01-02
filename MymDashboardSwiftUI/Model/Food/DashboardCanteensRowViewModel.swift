import Foundation
import Combine

final class DashboardCanteensRowViewModel: DashboardRowViewModel, ObservableObject {
    
    @Published
    var selectedCanteenIndex: Int = 0
    var id = UUID().uuidString
    var canteens: [DashboardFoodCanteenViewModel]
    var onCanteenChange: (DashboardFoodCanteenViewModel) -> Void
    
    init(onCanteenChange: @escaping (DashboardFoodCanteenViewModel) -> Void) {
        self.onCanteenChange = onCanteenChange
        canteens = (0 ..< 3)
            .map { _ in DashboardFoodCanteenViewModel.generateRandomCanteen() }
    }
    
    func selectedCanteenChange() {
        onCanteenChange(canteens[selectedCanteenIndex])
    }
    
    func generateRandomFoodsInCanteens() {
        for (index, _) in canteens.enumerated() {
            canteens[index].generateRandomFoods()
        }
        onCanteenChange(canteens[selectedCanteenIndex])
    }
}
