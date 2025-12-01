import SwiftUI

struct ContentView: View {
    @StateObject var fruitStore = FruitStore()
    @State private var newFruit = Fruit(name: "", emoji: .apple, description: "")

    var body: some View {
        TabView {

            // TAB 1 — Lista de frutas
            NavigationView {
                List(fruitStore.fruits) { fruit in
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
                .navigationTitle("Fruits 🍉")
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Fruits")
            }

            // TAB 2 — Añadir fruta
            NavigationView {
                AddFruitView(newFruit: $newFruit)
                    .navigationTitle("Add Fruit")
                    .navigationBarItems(
                        trailing:
                            Button("Save") {
                                fruitStore.fruits.append(newFruit)
                                newFruit = Fruit(name: "", emoji: .apple, description: "")
                            }
                    )
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text("Add")
            }
        }
    }
}
