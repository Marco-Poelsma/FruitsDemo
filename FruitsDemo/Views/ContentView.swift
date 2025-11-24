
import SwiftUI
struct ContentView: View {
    @StateObject var fruitStore = FruitStore()
    
    var body: some View {
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
    }
}
