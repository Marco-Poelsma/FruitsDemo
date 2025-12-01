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
                    // 1. Añadir la fruta
                    fruitStore.fruits.append(newFruit)

                    // 2. Resetear el formulario
                    newFruit = Fruit(name: "", emoji: .apple, description: "")
                }
        )
    }
}
