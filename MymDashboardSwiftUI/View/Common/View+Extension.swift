import SwiftUI

extension View {
    
    func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: size, height: size, alignment: alignment)
    }
    
    func cardShadow() -> some View {
        self.shadow(color: R.color.cardShadow.color.opacity(0.1), radius: 5)
    }
}
