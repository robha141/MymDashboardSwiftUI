import Foundation

final class DashboardNavigationItemsRowViewModel: DashboardRowViewModel {
    
    let id: String = UUID().uuidString
    let navigationItems = DashboardNavigationItem.allCases
}
