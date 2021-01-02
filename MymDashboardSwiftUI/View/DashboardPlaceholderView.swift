import SwiftUI
import Rswift

struct DashboardPlaceholderView: View {
    
    let titleText: String
    let bottomText: String
    let backgroundImage: ImageResource
    
    var body: some View {
        ZStack(alignment: .leading) {
            backgroundImage.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(titleText)
                    .foregroundColor(R.color.basicWhiteBlack.color)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Text(bottomText)
                    .foregroundColor(R.color.basicWhiteBlack.color)
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            .padding(.kPaddingL)
        }
        .frame(height: 260)
        .background(R.color.roundedCell.color)
        .cornerRadius(.kCornerRadius)
        .padding(.kListItemInsets)
    }
}

// MARK: - Dashboard placeholder view init

extension DashboardPlaceholderView {
    
    init(from item: DashboardPlaceholderItem) {
        self.init(
            titleText: item.titleText,
            bottomText: item.bottomText,
            backgroundImage: item.image
        )
    }
}

// MARK: - Previews

struct DashboardPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardPlaceholderView(from: .createEvent)
            .frame(height: 400)
            .background(R.color.appBackground.color)
    }
}
