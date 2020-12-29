import SwiftUI

struct DashboardHeaderView: View {
    
    let title: String
    let showAllButtonAction: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .lineLimit(1)
                .font(.body)
                .foregroundColor(R.color.heading.color)
            Spacer()
            Button(
                action: showAllButtonAction,
                label: {
                    Text("Show all")
                        .font(.footnote)
                        .foregroundColor(R.color.heading.color)
                }
            )
        }
        .padding(EdgeInsets(top: 20, leading: 16, bottom: 10, trailing: 16))
    }
}

struct DashboardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardHeaderView(
                title: "Food menu",
                showAllButtonAction: {
                    print("Test")
                }
            )
            DashboardHeaderView(
                title: "Food menu",
                showAllButtonAction: {
                    print("Test")
                }
            )
            .background(R.color.appBackground.color)
            .environment(\.colorScheme, .dark)
        }
    }
}
