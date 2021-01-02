import SwiftUI
import SwiftUIPager

struct Canteen: Identifiable, Equatable {
    
    var id: Int
    
    static func == (lhs: Canteen, rhs: Canteen) -> Bool {
        lhs.id == rhs.id
    }
}

struct DashboardCanteenItemsView: View {
    
    @State
    private var selectedIndex = 0 {
        didSet {
            withAnimation {
                self.viewModel.selectedCanteenChange(newIndex: selectedIndex)
            }
        }
    }
    let viewModel: DashboardCanteensRowViewModel
    
    var body: some View {
        let contentHeight = DashboardCanteenView.calculatedContentHeight
        return VStack {
            Pager(
                page: $selectedIndex,
                data: viewModel.canteens,
                content: {
                    DashboardCanteenView(
                        canteenName: "Menza JAK \($0.id)",
                        canteenState: "Closed",
                        canteenOpenHours: "10:00-12:00"
                    )
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                }
            )
            .preferredItemSize(
                CGSize(
                    width: UIScreen.main.bounds.width - 32,
                    height: contentHeight
                ),
                alignment: .center
            )
            .frame(height: contentHeight)
            PageControl(
                selectedIndex: $selectedIndex,
                numberOfItems: viewModel.canteens.count
            )
            .padding(EdgeInsets(top: .kPaddingS, leading: 0, bottom: .kPaddingS, trailing: 0))
        }
    }
}

struct DashboardCanteenItemsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardCanteenItemsView(viewModel: DashboardCanteensRowViewModel(onCanteenChange: { _ in }))
    }
}
