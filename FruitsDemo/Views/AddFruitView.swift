import SwiftUI

struct AddFruitView: View {
    
    @Binding var newFruit: Fruit
    @ObservedObject var fruitStore: FruitStore
    
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
            trailing:
                Button("Save") {
                    fruitStore.fruits.append(newFruit)
                    newFruit = Fruit(name: "", emoji: .apple, description: "")
                }
                .disabled(
                    newFruit.name.trimmingCharacters(in: .whitespaces).isEmpty ||
                    fruitStore.fruits.contains(where: { $0.name.lowercased() == newFruit.name.trimmingCharacters(in: .whitespaces).lowercased() })
                )
        )
    }
}
