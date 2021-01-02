import Foundation

final class DashboardCanteensRowViewModel: DashboardRowViewModel {
    
    var id = UUID().uuidString
    var canteens: [DashboardFoodCanteenViewModel]
    var onCanteenChange: (DashboardFoodCanteenViewModel) -> Void
    
    init(onCanteenChange: @escaping (DashboardFoodCanteenViewModel) -> Void) {
        self.onCanteenChange = onCanteenChange
        canteens = (0 ..< 3)
            .map { _ in DashboardFoodCanteenViewModel.generateRandomCanteen() }
    }
    
    func selectedCanteenChange(newIndex: Int) {
        onCanteenChange(canteens[newIndex])
    }
}
