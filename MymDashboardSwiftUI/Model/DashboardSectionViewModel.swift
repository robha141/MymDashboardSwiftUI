import Combine
import Foundation

// MARK: - DashboardDataSection

class DashboardSectionViewModel: Identifiable, ObservableObject {
    
    // MARK: - Properties
    
    @Published
    var items: [DashboardRowViewModel]
    var id: String
    var sectionName: String?
    
    // MARK: - Init
    
    init(
        items: [DashboardRowViewModel] = [],
        id: String = UUID().uuidString,
        sectionName: String? = nil
    ) {
        self.items = items
        self.id = id
        self.sectionName = sectionName
    }
}
