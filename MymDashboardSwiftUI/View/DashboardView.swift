import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                R.color.appBackground.color
                    .ignoresSafeArea(edges: .all)
                ScrollView(
                    .vertical,
                    showsIndicators: false,
                    content: {
                        VStack(alignment: .leading) {
                            DashboardNavigationListView()
                            
                            DashboardHeaderView(
                                title: "Today events",
                                showAllButtonAction: {}
                            )
                            DashboardTimetableEventItemsView()
                            
                            DashboardHeaderView(
                                title: "Food menu",
                                showAllButtonAction: {}
                            )
                            DashboardCanteenItemsView()
                            HStack {
                                Spacer()
                                Text("No menu available")
                                Spacer()
                            }
                            
                            DashboardHeaderView(
                                title: "Planned tasks",
                                showAllButtonAction: {}
                            )
                            DashboardTaskView(
                                isDone: false,
                                taskTitle: "Task1",
                                time: "10:00",
                                place: "Q02"
                            )
                            DashboardTaskView(
                                isDone: false,
                                taskTitle: "Task2",
                                time: "All day",
                                place: "Q15"
                            )
                            Spacer()
                        }
                    }
                )
            }
            .navigationBarTitle(Text("My MENDELU"))
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
                .environment(\.colorScheme, .dark)
        }
    }
}
