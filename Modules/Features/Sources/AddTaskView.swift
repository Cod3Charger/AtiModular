import SwiftUI
import Core

/// Экран для добавления новой задачи
public struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskTitle: String = ""
    let onAdd: (String) -> Void
    
    public init(onAdd: @escaping (String) -> Void) {
        self.onAdd = onAdd
    }
    
    public var body: some View {
        NavigationView {
            Form {
                TextField("Название задачи", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationTitle("Новая задача")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Добавить") {
                        if !taskTitle.isEmpty {
                            onAdd(taskTitle)
                            dismiss()
                        }
                    }
                    .disabled(taskTitle.isEmpty)
                }
            }
        }
    }
}
