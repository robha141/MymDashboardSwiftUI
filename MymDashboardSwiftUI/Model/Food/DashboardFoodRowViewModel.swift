import Rswift

struct DashboardFoodRowViewModel: DashboardRowViewModel {
    
    let id = UUID().uuidString
    let foodName: String
    let foodPrice: String
    let foodImage: ImageResource
    let rating: FoodRating
}

extension DashboardFoodRowViewModel {
    
    static func generateRandomFood() -> DashboardFoodRowViewModel {
        DashboardFoodRowViewModel(
            foodName: [
                    "Pizza mozarella",
                    "Bun bo nam bo",
                    "Kebab kuřecí",
                    "Trhaný seitan po korejsku"
                ]
                .randomElement()!,
            foodPrice: [
                    "45 Kč",
                    "50 Kč",
                    "55 Kč"
                ]
                .randomElement()!,
            foodImage: [
                    R.image.pizza24px,
                    R.image.soup24px,
                    R.image.food_default24px
                ]
                .randomElement()!,
            rating: FoodRating.allCases.randomElement()!
        )
    }
}
