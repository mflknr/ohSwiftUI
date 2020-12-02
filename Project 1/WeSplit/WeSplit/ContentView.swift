//
// Created by nihilias on 30.11.20.
// Copyright © 2020 nihilias. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        NavigationView {
            Form {
                // mutating state
                Section(
                    header: Text("Mutating a state")
                ) {
                    Button("Tap again after \(tapCount) times!") {
                        self.tapCount += 1
                    }
                }
            }
            .navigationTitle("SwiftUI - First Steps")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
