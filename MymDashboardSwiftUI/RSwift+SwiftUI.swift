import SwiftUI
import Rswift

extension ColorResource {
    
    var color: Color { Color(name) }
}

extension StringResource {
    
    var localizedStringKey: LocalizedStringKey { LocalizedStringKey(key) }
    var text: Text { Text(localizedStringKey) }
}

extension ImageResource {
    
    var image: Image { Image(name) }
}
