import SwiftUI

struct DashboardSectionView: View {
    
    @StateObject
    var dashboardSection: DashboardSectionViewModel
    
    var body: some View {
        LazyVStack {
            if let title = dashboardSection.sectionName {
                DashboardHeaderView(
                    title: title,
                    showAllButtonAction: {}
                )
            }
            ForEach(
                dashboardSection.items,
                id: \.id,
                content: { viewModel in
                    switch viewModel {
                    case let viewModel as DashboardNavigationItemsRowViewModel:
                        DashboardNavigationItemsRowView(viewModel: viewModel)
                    case let viewModel as DashboardTimetableEventsRowViewModel:
                        DashboardTimetableEventsRowView(viewModel: viewModel)
                    case let viewModel as DashboardCanteensRowViewModel:
                        DashboardCanteensRowView(viewModel: viewModel)
                    case let viewModel as DashboardFoodRowViewModel:
                        DashboardFoodView(viewModel: viewModel)
                            .padding(.kListItemInsets)
                    case let viewModel as DashboardTaskRowViewModel:
                        DashboardTaskView(viewModel: viewModel)
                            .padding(.kListItemInsets)
                    case let item as DashboardPlaceholderItem:
                        DashboardPlaceholderView(from: item)
                    default:
                        EmptyView()
                    }
                }
            )
            .transition(.rowTransition)
        }
    }
}

struct DashboardSectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScrollView(
            .vertical,
            showsIndicators: false,
            content: {
                DashboardSectionView(dashboardSection: DashboardFoodSectionViewModel())
            }
        )
    }
}
