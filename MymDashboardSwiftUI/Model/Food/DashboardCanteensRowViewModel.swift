import Foundation

final class DashboardCanteensRowViewModel: DashboardRowViewModel {
    
    var id: String
    var canteens: [Canteen]
    var onCanteenChange: (Canteen) -> Void
    
    init(
        id: String = UUID().uuidString,
        canteens: [Canteen] = [Canteen(id: 1), Canteen(id: 2), Canteen(id: 3)],
        onCanteenChange: @escaping (Canteen) -> Void
    ) {
        self.id = id
        self.canteens = canteens
        self.onCanteenChange = onCanteenChange
    }
    
    func selectedCanteenChange(newIndex: Int) {
        onCanteenChange(canteens[newIndex])
    }
}
