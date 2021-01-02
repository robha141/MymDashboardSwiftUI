import SwiftUI

struct DashboardNavigationListView: View {
    
    let viewModel: DashboardNavigationItemsRowViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(
                    viewModel.navigationItems,
                    id: \.rawValue,
                    content: {
                        DashboardNavigationView(navigationItem: $0)
                            .frame(width: 75, height: 95)
                    }
                )
            }
            .padding(EdgeInsets(top: 0, leading: .kPaddingL, bottom: 0, trailing: .kPaddingL))
        }
    }
}

struct DashboardNavigationListView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardNavigationListView(viewModel: DashboardNavigationItemsRowViewModel())
            .background(R.color.appBackground.color)
            .environment(\.colorScheme, .dark)
    }
}
