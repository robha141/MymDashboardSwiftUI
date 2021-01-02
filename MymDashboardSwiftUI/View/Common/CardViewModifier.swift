//
//  CardViewModifier.swift
//  MymDashboardSwiftUI
//
//  Created by Róbert Oravec on 30/12/2020.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    
    let padding: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let hasShadow: Bool
    
    func body(content: Content) -> some View {
        let newContent = content
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        if hasShadow {
            return newContent.cardShadow().asAnyView()
        } else {
            return newContent.asAnyView()
        }
    }
}

extension View {
    
    func cardStyle(
        padding: CGFloat = .kPaddingS,
        backgroundColor: Color = R.color.roundedCell.color,
        cornerRadius: CGFloat = .kCornerRadius,
        hasShadow: Bool = false
    ) -> some View {
        self.modifier(
            CardViewModifier(
                padding: padding,
                backgroundColor: backgroundColor,
                cornerRadius: cornerRadius,
                hasShadow: hasShadow
            )
        )
    }
}

struct CardViewModifier_Previews: PreviewProvider {
    
    static var previews: some View {
        Rectangle()
            .frame(width: 100, height: 100, alignment: .center)
            .cardStyle()
    }
}
