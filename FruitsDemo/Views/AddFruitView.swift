import SwiftUI

struct AddFruitView: View {
    
    @Binding var newFruit: Fruit
    @ObservedObject var fruitStore: FruitStore
    @Environment(\.presentationMode) var presentationMode   // <- para cerrar el sheet
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $newFruit.name)
            }
            Section(header: Text("Description")) {
                TextEditor(text: $newFruit.description)
            }
            Section(header: Text("Image")) {
                EmojiPicker(emoji: $newFruit.emoji)
            }
        }
        .navigationBarItems(
            leading: Button("Cancel") {
                newFruit = Fruit(name: "", emoji: .apple, description: "")
                presentationMode.wrappedValue.dismiss()
            },
            trailing: Button("Save") {
                fruitStore.fruits.append(newFruit)
                newFruit = Fruit(name: "", emoji: .apple, description: "")
                presentationMode.wrappedValue.dismiss()
            }
            .disabled(
                newFruit.name.trimmingCharacters(in: .whitespaces).isEmpty ||
                fruitStore.fruits.contains(where: { $0.name.lowercased() == newFruit.name.trimmingCharacters(in: .whitespaces).lowercased() })
            )
        )
    }
}
