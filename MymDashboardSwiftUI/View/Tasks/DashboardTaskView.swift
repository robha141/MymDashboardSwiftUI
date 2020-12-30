import SwiftUI
import Rswift

struct DashboardTaskView: View {
    
    // MARK: - Properties
    
    let isDone: Bool
    let taskTitle: String
    let time: String?
    let place: String?
    
    // MARK: - View
    
    var body: some View {
        HStack(spacing: 0) {
            createImage()
            VStack(
                alignment: .leading,
                spacing: .kPaddingS / 2,
                content: {
                    Text(taskTitle)
                    if time != nil || place != nil {
                        createBottomItemsViews()
                    } else {
                        EmptyView()
                    }
                }
            )
            .padding(.leading, .kPaddingS)
            Spacer()
        }
        .padding(.kPaddingS)
        .background(R.color.roundedCell.color)
        .cornerRadius(11)
    }
    
    private func createImage() -> some View {
        ZStack {
            if isDone {
                R.image.checkmark24px.image
                    .resizable()
                    .foregroundColor(R.color.white.color)
                    .background(R.color.primary.color)
                    .clipShape(Circle())
            } else {
                Circle()
                    .strokeBorder(
                        R.color.primary.color,
                        lineWidth: 2
                    )
            }
        }
        .frame(width: 35, height: 35)
    }
    
    private func createBottomItemsViews() -> some View {
        HStack {
            if let time = time {
                TaskBottomItemView(
                    image: R.image.time24px,
                    text: time
                )
            }
            if let place = place {
                TaskBottomItemView(
                    image: R.image.location_marker24px,
                    text: place
                )
            }
        }
    }
}

private struct TaskBottomItemView: View {
    
    let image: ImageResource
    let text: String
    
    var body: some View {
        HStack(spacing: 5) {
            image.image
                .resizable()
                .frame(width: 15, height: 15)
            Text(text)
                .font(.footnote)
                .lineLimit(1)
        }
        .foregroundColor(R.color.gray2.color)
    }
}

struct DashboardTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardTaskView(
            isDone: false,
            taskTitle: "Test",
            time: "123",
            place: "123"
        )
        .frame(height: 300)
        .background(R.color.appBackground.color)
    }
}
