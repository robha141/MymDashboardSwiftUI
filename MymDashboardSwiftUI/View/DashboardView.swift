import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                R.color.appBackground.color
                    .ignoresSafeArea(edges: .all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        DashboardNavigationListView()
                        DashboardHeaderView(
                            title: "Today events",
                            showAllButtonAction: {}
                        )
                        DashboardCanteenItemsView()
                        Spacer()
                    }
                }
            }
            .navigationBarTitle(Text("My MENDELU"))
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
                .environment(\.colorScheme, .dark)
        }
    }
}
