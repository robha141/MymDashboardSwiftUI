import SwiftUI
import Rswift

struct DashboardCanteenView: View {
    
    let canteenName: String
    let canteenState: String
    let canteenOpenHours: String
    let canteenImage: ImageResource
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { reader in
                canteenImage.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: reader.size.width,
                        height: reader.size.height
                    )
            }
            Color.black.opacity(0.1)
            VStack(alignment: .leading, spacing: .kPaddingS) {
                Text(canteenName)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                HStack {
                    Text(canteenState)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(canteenOpenHours)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                Spacer()
            }
            .padding(.kPaddingL)
        }
        .frame(height: Self.calculatedContentHeight)
        .cardStyle(padding: 0, hasShadow: true)
    }
}

extension DashboardCanteenView: HasCalculatedContentHeight {
    
    static var calculatedContentHeight: CGFloat { 210 }
}

extension DashboardCanteenView {
    
    init(viewModel: DashboardFoodCanteenViewModel) {
        self.init(
            canteenName: viewModel.name,
            canteenState: viewModel.state,
            canteenOpenHours: viewModel.openHours,
            canteenImage: viewModel.image
        )
    }
}

struct DashboardCanteenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCanteenView(viewModel: .generateRandomCanteen())
            .frame(height: 400)
            .background(R.color.appBackground.color)
    }
}
