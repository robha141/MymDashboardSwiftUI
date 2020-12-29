import SwiftUI
import Rswift

struct DashboardNavigationView: View {
    
    let text: String
    let icon: ImageResource
    
    var body: some View {
        VStack {
            icon.image
                .frame(width: 60, height: 60)
                .foregroundColor(R.color.roundedIconPrimaryTint.color)
                .background(R.color.roundedIconPrimaryBcg.color)
                .cornerRadius(30)
                .shadow(radius: 5)
            Text(text)
                .foregroundColor(R.color.collectionViewCellTitle.color)
                .font(.footnote)
                .minimumScaleFactor(0.8)
        }
    }
}

struct DashboardNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardNavigationView(
                text: "Covid",
                icon: R.image.corona24px
            )
            .frame(width: 75, height: 90)
            .background(R.color.appBackground.color)
        }
    }
}
