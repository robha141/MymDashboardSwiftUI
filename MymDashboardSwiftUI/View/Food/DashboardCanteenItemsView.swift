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
    private var page = 0
    var items = (0 ..< 10).map { Canteen(id: $0) }
    
    var body: some View {
        let contentHeight = DashboardCanteenView.calculatedContentHeight
        return VStack {
            Pager(
                page: $page,
                data: items,
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
                selectedIndex: $page,
                numberOfItems: items.count
            )
            .padding(.top, .kPaddingS)
        }
    }
}

struct DashboardCanteenItemsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCanteenItemsView()
    }
}
