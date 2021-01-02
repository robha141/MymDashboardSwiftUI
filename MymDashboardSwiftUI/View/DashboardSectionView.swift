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
                        DashboardNavigationListView(viewModel: viewModel)
                    case let viewModel as DashboardTimetableEventsRowViewModel:
                        DashboardTimetableEventsRowView(viewModel: viewModel)
                            .transition(.rowTransition)
                    case let viewModel as DashboardCanteensRowViewModel:
                        DashboardCanteenItemsView(viewModel: viewModel)
                    case let viewModel as DashboardFoodRowViewModel:
                        DashboardFoodView(viewModel: viewModel)
                            .padding(.kListItemInsets)
                            .transition(.rowTransition)
                    case let viewModel as DashboardTaskRowViewModel:
                        DashboardTaskView(viewModel: viewModel)
                            .padding(.kListItemInsets)
                            .transition(.rowTransition)
                    case let item as DashboardPlaceholderItem:
                        DashboardPlaceholderView(from: item)
                            .transition(.rowTransition)
                    default:
                        EmptyView()
                    }
                }
            )
        }
    }
}

struct DashboardSectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardSectionView(dashboardSection: DashboardTasksSectionViewModel())
    }
}
