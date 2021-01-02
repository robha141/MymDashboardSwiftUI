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
                content: { item in
                    switch item {
                    case let item as DashboardNavigationItemsRowViewModel:
                        DashboardNavigationListView(viewModel: item)
                    case let item as DashboardTimetableEventsRowViewModel:
                        DashboardTimetableEventsRowView(viewModel: item)
                    case let item as DashboardCanteensRowViewModel:
                        DashboardCanteenItemsView(viewModel: item)
                    case let item as DashboardFoodRowViewModel:
                        DashboardFoodView(
                            foodName: "Pizza",
                            foodPrice: "over 9000 Kč",
                            foodImage: R.image.pizza24px,
                            rating: .good
                        )
                        .padding(.kListItemInsets)
                        .transition(.rowTransition)
                    case let item as DashboardTaskRowViewModel:
                        DashboardTaskView(
                            isDone: false,
                            taskTitle: "Pain",
                            time: "24:00",
                            place: "Somewhere"
                        )
                        .padding(.kListItemInsets)
                    case let item as DashboardPlaceholderItem:
                        DashboardPlaceholderView(from: item)
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
        DashboardSectionView(dashboardSection: DashboardFoodSectionViewModel())
    }
}
