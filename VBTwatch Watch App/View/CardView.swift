//
//  CardView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import SwiftUI

struct CardView: View {
    let objective: Objective
    var body: some View {
        ZStack(alignment: .leading) {
            Color(red: 0.28, green: 0.28, blue: 0.28)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: objective.image).font(.system(size: 40)).foregroundColor(.pink)
                    Spacer()
                    VStack{
                        Image(systemName: "ellipsis.circle.fill").font(.system(size:20)).foregroundColor(.gray)
                        Spacer()
                    }
                }
                Text(objective.title).frame(alignment: .leading)
                Text("1Repあたり\(String(objective.velocity))m/s").font(.footnote).frame(alignment: .leading)
                Text(objective.weight).font(.footnote).frame(alignment: .leading)
            }.padding()
        }.cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(objective: Objective.sampleData[0])
    }
}
