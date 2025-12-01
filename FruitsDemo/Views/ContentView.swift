import SwiftUI

struct ContentView: View {
    @StateObject var fruitStore = FruitStore()
    @State private var newFruit = Fruit(name: "", emoji: .apple, description: "")

    var body: some View {
        TabView {
            
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

            NavigationView {
                AddFruitView(newFruit: $newFruit, fruitStore: fruitStore)
                    .navigationTitle("Add Fruit")
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text("Add")
            }
        }
    }
}
