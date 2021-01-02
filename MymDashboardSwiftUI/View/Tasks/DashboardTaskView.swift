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
                        .font(.subheadline)
                        .fontWeight(.medium)
                    createBottomItemsViews()
                }
            )
            .padding(.leading, .kPaddingS)
            Spacer()
        }
        .cardStyle()
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
        .frame(size: .kCardLeadingIconSize)
    }
    
    private func createBottomItemsViews() -> some View {
        if time != nil || place != nil {
            return HStack {
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
            .asAnyView()
        } else {
            return EmptyView().asAnyView()
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
                .frame(size: 15)
            Text(text)
                .font(.footnote)
                .lineLimit(1)
        }
        .foregroundColor(R.color.gray2.color)
    }
}

extension DashboardTaskView {
    
    init(viewModel: DashboardTaskRowViewModel) {
        self.init(
            isDone: viewModel.isDone,
            taskTitle: viewModel.taskTitle,
            time: viewModel.time,
            place: viewModel.place
        )
    }
}

struct DashboardTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        DashboardTaskView(viewModel: .generateRandomTask())
            .frame(height: 300)
            .background(R.color.appBackground.color)
    }
}
