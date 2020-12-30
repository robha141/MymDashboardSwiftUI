import SwiftUI

struct PageControl: View {
    
    @Binding
    var selectedIndex: Int
    
    let numberOfItems: Int
    let indicatorSize: CGFloat
    let selectedColor: Color
    let unselectedColor: Color
    
    init(
        selectedIndex: Binding<Int>,
        numberOfItems: Int,
        indicatorSize: CGFloat = 8,
        selectedColor: Color = .gray,
        unselectedColor: Color = Color(UIColor.lightGray)
    ) {
        self._selectedIndex = selectedIndex
        self.numberOfItems = numberOfItems
        self.indicatorSize = indicatorSize
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< numberOfItems) {
                let foregroundColor: Color = selectedIndex == $0
                    ? selectedColor
                    : unselectedColor
                Circle()
                    .foregroundColor(foregroundColor)
                    .frame(size: indicatorSize)
            }
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            PageControl(
                selectedIndex: .constant(2),
                numberOfItems: 5
            )
        }
    }
}
