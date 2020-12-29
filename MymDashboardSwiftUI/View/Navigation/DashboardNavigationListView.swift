import SwiftUI

@available(*, deprecated, message: "TODO - not fully implemented")
struct DashboardNavigationListView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(
                    0 ..< 8,
                    content: { _ in
                        DashboardNavigationView(
                            text: "Covid",
                            icon: R.image.corona24px
                        )
                        .frame(width: 75, height: 95, alignment: .center)
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: .kPaddingL, bottom: 0, trailing: .kPaddingL))
        }
    }
}

struct DashboardNavigationListView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardNavigationListView()
            .background(R.color.appBackground.color)
            .environment(\.colorScheme, .dark)
    }
}
