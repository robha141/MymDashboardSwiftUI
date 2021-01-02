import SwiftUI

struct DashboardView: View {
    
    @ObservedObject
    private var viewModel = DashboardViewModel()
    @State
    private var isRandomGenerationSheetShown = false
    
    var body: some View {
        NavigationView {
            ZStack {
                createBackground()
                createDashboardContent()
            }
            .navigationBarTitle(Text("My MENDELU"))
            .navigationBarItems(
                trailing: Button(
                    action: {
                        self.isRandomGenerationSheetShown = true
                    },
                    label: {
                        Text("Random generation")
                    }
                )
            )
            .actionSheet(
                isPresented: $isRandomGenerationSheetShown,
                content: { self.createGenerationActionSheet() }
            )
        }
    }
    
    private func createBackground() -> some View {
        R.color.appBackground.color
            .ignoresSafeArea(edges: .all)
    }
    
    private func createDashboardContent() -> some View {
        ScrollView(
            .vertical,
            showsIndicators: false,
            content: {
                LazyVStack {
                    ForEach(
                        viewModel.sections,
                        content: { DashboardSectionView(dashboardSection: $0) }
                    )
                }
            }
        )
    }
    
    private func createGenerationActionSheet() -> ActionSheet {
        ActionSheet(
            title: Text("Select generation"),
            buttons: [
                .default(
                    Text("Generate foods"),
                    action: {
                        withAnimation {
                            self.viewModel.generateRandomFoods()
                        }
                    }
                ),
                .default(
                    Text("Generate timetable"),
                    action: {
                        withAnimation {
                            self.viewModel.generateRandomTimetable()
                        }
                    }
                ),
                .default(
                    Text("Generate tasks"),
                    action: {
                        withAnimation {
                            self.viewModel.generateRandomTasks()
                        }
                    }
                ),
                .default(
                    Text("Generate everything"),
                    action: {
                        withAnimation {
                            self.viewModel.generateRandomEverything()
                        }
                    }
                ),
                .cancel(Text("Cancel"))
            ]
        )
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
        }
    }
}
