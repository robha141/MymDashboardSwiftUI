import SwiftUI

struct DashboardTimetableEventsRowView: View {
    
    let viewModel: DashboardTimetableEventsRowViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .kPaddingS) {
                ForEach(
                    viewModel.items,
                    id: \.id,
                    content: { DashboardTimetableEventView(viewModel: $0) }
                )
            }
            .padding(.kListItemInsets)
        }
    }
}

struct DashboardTimetableEventItemsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTimetableEventsRowView(viewModel: DashboardTimetableEventsRowViewModel())
            .frame(height: 400)
            .background(R.color.appBackground.color)
    }
}
