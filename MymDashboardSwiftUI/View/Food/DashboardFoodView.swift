import SwiftUI
import Rswift

struct DashboardFoodView: View {
    
    // MARK: - Properties
    
    let foodName: String
    let foodPrice: String
    var foodImage: ImageResource
    var rating: FoodRating
    
    // MARK: - View
    
    var body: some View {
        HStack(spacing: .kPaddingS) {
            foodImage.image
                .frame(size: .kCardLeadingIconSize)
                .foregroundColor(R.color.roundedIconSecondaryTint.color)
                .background(R.color.roundedIconSecondaryBcg.color)
                .clipShape(Circle())
            VStack(
                alignment: .leading,
                spacing: .kPaddingS / 2,
                content: {
                    Text(foodName)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .lineLimit(2)
                    Text(foodPrice)
                        .font(.subheadline)
                }
            )
            Spacer()
            rating.image
                .frame(size: .kCardLeadingIconSize)
                .clipShape(Circle())
        }
        .cardStyle()
    }
}

// MARK: - FoodRating + image

private extension FoodRating {
    
    var image: some View {
        switch self {
        case .good:
            return R.image.green_emoji24px.image
                .foregroundColor(R.color.primary400.color)
        case .neutral:
            return R.image.gray_emoji24px.image
                .foregroundColor(R.color.gray2.color)
        case .bad:
            return R.image.red_emoji24px.image
                .foregroundColor(R.color.redEmoji.color)
        }
    }
}

struct DashboardFoodView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardFoodView(
            foodName: "Chonk",
            foodPrice: "30 Kč",
            foodImage: R.image.soup24px,
            rating: .bad
        )
        .frame(height: 300)
        .background(R.color.appBackground.color)
        .colorScheme(.dark)
    }
}
