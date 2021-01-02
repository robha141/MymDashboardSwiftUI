import SwiftUI

struct DashboardView: View {
    
    @ObservedObject
    var dashboardData = DashboardData()
    
    var body: some View {
        NavigationView {
            ZStack {
                createBackground()
                createDashboardContent()
            }
            .navigationBarTitle(Text("My MENDELU"))
        }
    }
    
    private func createBackground() -> some View {
        R.color.appBackground.color
            .ignoresSafeArea(edges: .all)
    }
    
    private func createDashboardContent() -> some View {
        ScrollView(
            .vertical,
            showsIndicators: false,
            content: {
                LazyVStack {
                    ForEach(
                        dashboardData.sections,
                        content: { DashboardSectionView(dashboardSection: $0) }
                    )
                }
            }
        )
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
                .colorScheme(.dark)
        }
    }
}
