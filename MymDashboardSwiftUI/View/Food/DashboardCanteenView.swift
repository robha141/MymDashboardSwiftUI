import SwiftUI

struct DashboardCanteenView: View {
    
    let canteenName: String
    let canteenState: String
    let canteenOpenHours: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { reader in
                R.image.canteens_jak.image
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

struct DashboardCanteenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCanteenView(
            canteenName: "Menza JAK",
            canteenState: "Closed",
            canteenOpenHours: "11:00-12:00"
        )
        .frame(height: 400)
        .background(R.color.appBackground.color)
    }
}
