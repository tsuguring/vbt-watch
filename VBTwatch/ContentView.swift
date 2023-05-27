//
//  ContentView.swift
//  VBTwatch
//
//  Created by Ryo Yoshitsugu on R 5/03/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) private var reps: FetchedResults<RepData>

    var body: some View {
        VStack {
            List(reps) { rep in
                Text("\(rep.velocity)")
            }
            Button("追加") {
                let rep = RepData(context: moc)
                rep.id = UUID()
                rep.velocity = 1.1
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
