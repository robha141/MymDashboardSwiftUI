import Foundation

struct DashboardTaskRowViewModel: DashboardRowViewModel {
    
    var id: String = UUID().uuidString
    let isDone: Bool
    let taskTitle: String
    let time: String?
    let place: String?
}

extension DashboardTaskRowViewModel {
    
    static func generateRandomTask() -> DashboardTaskRowViewModel {
        var place: String?
        if Bool.random() {
            place = [
                "Q01",
                "Q02",
                "Q03",
                "Q12",
                "Q15",
                "Q16"
            ]
            .randomElement()
        }
        var time: String?
        if Bool.random() {
            time = [
                "7:00",
                "9:00",
                "11:00",
                "13:00",
                "15:00"
            ]
            .randomElement()
        }
        return DashboardTaskRowViewModel(
            isDone: .random(),
            taskTitle: [
                    "Dokončiť úlohu",
                    "Pripraviť sa na cviko",
                    "Začať pracovať na semestrálnom projekte",
                    "Pripraviť si materiály na prednášku"
                ]
                .randomElement()!,
            time: time,
            place: place
        )
    }
}
