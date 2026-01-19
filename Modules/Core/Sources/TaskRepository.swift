import Foundation
import Combine

/// Репозиторий для управления задачами
public class TaskRepository: ObservableObject {
    @Published public private(set) var tasks: [Task] = []
    
    public init() {
        // Инициализируем с несколькими примерами задач
        tasks = [
            Task(title: "Изучить Tuist", isCompleted: false),
            Task(title: "Создать модульное приложение", isCompleted: false),
            Task(title: "Понять и принять модульность", isCompleted: true)
        ]
    }
    
    /// Добавить новую задачу
    public func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    /// Удалить задачу
    public func removeTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
    
    /// Переключить статус выполнения задачи
    public func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    /// Обновить задачу
    public func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        }
    }
}
