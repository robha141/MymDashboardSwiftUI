import SwiftUI
import SwiftUIPager

struct DashboardCanteensRowView: View {

    @StateObject
    var viewModel: DashboardCanteensRowViewModel
    
    var body: some View {
        let contentHeight = DashboardCanteenView.calculatedContentHeight
        return VStack {
            Pager(
                page: $viewModel.selectedCanteenIndex,
                data: viewModel.canteens,
                content: {
                    DashboardCanteenView(viewModel: $0)
                        .padding(
                            EdgeInsets(
                                top: 0,
                                leading: 4,
                                bottom: 0,
                                trailing: 4
                            )
                        )
                }
            )
            .onPageChanged({ index in
                withAnimation {
                    self.viewModel.selectedCanteenChange()
                }
            })
            .preferredItemSize(
                CGSize(
                    width: UIScreen.main.bounds.width - 32,
                    height: contentHeight
                ),
                alignment: .center
            )
            .frame(height: contentHeight)
            PageControl(
                selectedIndex: $viewModel.selectedCanteenIndex,
                numberOfItems: viewModel.canteens.count
            )
            .padding(EdgeInsets(vertical: .kPaddingS))
        }
    }
}

struct DashboardCanteenItemsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardCanteensRowView(viewModel: DashboardCanteensRowViewModel(onCanteenChange: { _ in }))
    }
}
