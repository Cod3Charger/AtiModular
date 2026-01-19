import SwiftUI
import Core

/// Главный экран со списком задач
public struct TaskListView: View {
    @StateObject private var repository = TaskRepository()
    @State private var showingAddTask = false
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(repository.tasks) { task in
                    TaskRow(
                        task: task,
                        onToggle: {
                            repository.toggleTask(task)
                        },
                        onDelete: {
                            repository.removeTask(task)
                        }
                    )
                }
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddTask = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView { title in
                    repository.addTask(Task(title: title))
                }
            }
        }
    }
}
