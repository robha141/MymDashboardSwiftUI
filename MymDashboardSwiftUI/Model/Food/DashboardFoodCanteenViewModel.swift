import Rswift

struct DashboardFoodCanteenViewModel: Identifiable {
    
    var id = UUID().uuidString
    var foods = [DashboardFoodRowViewModel]()
    var name: String
    var state: String
    var openHours: String
    var image: ImageResource
    
    mutating func generateRandomFoods() {
        foods = (0 ... Int.random(in: 1 ... 10))
            .map { _ in DashboardFoodRowViewModel.generateRandomFood() }
    }
}

extension DashboardFoodCanteenViewModel: Equatable {
    
    static func == (
        lhs: DashboardFoodCanteenViewModel,
        rhs: DashboardFoodCanteenViewModel
    ) -> Bool {
        lhs.id == rhs.id
    }
}

extension DashboardFoodCanteenViewModel {
    
    static func generateRandomCanteen() -> DashboardFoodCanteenViewModel {
        let canteen = Canteen.allCases.randomElement()!
        var canteenViewModel = DashboardFoodCanteenViewModel(
            name: canteen.name,
            state: [
                    "Open",
                    "Closed"
                ]
                .randomElement()!,
            openHours: canteen.openHours,
            image: canteen.image
        )
        canteenViewModel.generateRandomFoods()
        return canteenViewModel
    }
}

enum Canteen: String, CaseIterable {
    
    case akademie
    case jak
    case lednice
    case o
    case pizzerie
    case tak
    case x
    
    var image: ImageResource {
        switch self {
        case .akademie:
            return R.image.canteens_akademie
        case .jak:
            return R.image.canteens_jak
        case .lednice:
            return R.image.canteens_lednice
        case .o:
            return R.image.canteens_o
        case .pizzerie:
            return R.image.canteens_pizzerie
        case .tak:
            return R.image.canteens_tak
        case .x:
            return R.image.canteens_x
        }
    }
    
    var name: String {
        "Menza \(rawValue.capitalized)"
    }
    
    var openHours: String {
        switch self {
        case .akademie, .jak, .x:
            return "9:00 - 15:00"
        default:
            return "11:00 - 13:00"
        }
    }
}
