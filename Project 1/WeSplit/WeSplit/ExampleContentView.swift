//
// Created by nihilias on 30.11.20.
// Copyright © 2020 nihilias. All rights reserved.
//

import SwiftUI

enum HogwartsStudent: String, CaseIterable, Identifiable {
    case harry = "Harry"
    case hermione = "Hermione"
    case ron = "Ron"
    
    var quote: String {
        switch self {
        case .harry:
            return "There must always be a Lich King!"
        case .hermione:
            return "I hate chess."
        case .ron:
            return "I don't now Hermiones last name and at this point I'm afraid to ask :/"
        }
    }
    
    var id: String { self.rawValue }
}

struct ExampleContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    @State private var selectedStudent: HogwartsStudent = .harry
    
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
                
                // two way binding
                Section(
                    header: Text("Two way binding")
                ) {
                    TextField("Enter your name", text: $name)
                    if !name.isEmpty {
                        Text("Hello, \(name)!")
                    }
                }
                
                // picker test
                Section(
                    header: Text("Picker"),
                    footer: Text("Best quote: \(selectedStudent.quote)")
                ) {
                    Picker(
                        "Hogwarts Student:",
                        selection: $selectedStudent
                    ) {
                        ForEach(HogwartsStudent.allCases) { student in
                            Text(student.rawValue).tag(student)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI - First Steps")
        }
    }
}

struct ExampleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleContentView()
            .preferredColorScheme(.dark)
            
    }
}
