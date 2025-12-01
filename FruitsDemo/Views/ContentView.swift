import SwiftUI

struct ContentView: View {
    @StateObject var fruitStore = FruitStore()
    @State private var showAddFruit = false
    @State private var newFruit = Fruit(name: "", emoji: .apple, description: "")

    var body: some View {
        NavigationView {
            List {
                ForEach(fruitStore.fruits) { fruit in
                    NavigationLink(destination: DetailFruitView(fruit: fruit)) {
                        HStack {
                            Text(fruit.emoji.rawValue)
                                .font(.largeTitle)
                            Text(fruit.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .onDelete(perform: deleteFruit)
            }
            .navigationTitle("Fruits 🍉")
            .navigationBarItems(
                trailing: Button(action: {
                    showAddFruit = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showAddFruit) {
                NavigationView {
                    AddFruitView(newFruit: $newFruit, fruitStore: fruitStore)
                }
            }
        }
    }
    
    private func deleteFruit(at offsets: IndexSet) {
        fruitStore.fruits.remove(atOffsets: offsets)
    }
}
