//
//  CardView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/07.
//

import SwiftUI

struct CardView: View {
    let objective: Objective
    @State private var isPush = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(objective.image)
                    .font(.system(size: 40))
                    .foregroundColor(.pink)
                Spacer()
                VStack{
                    NavigationLink(destination: VBTExplanation(objective: objective), isActive: $isPush) {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size:23))
                            .foregroundColor(.gray)
                            .onTapGesture {
                                self.isPush.toggle()
                            }
                    }
                    Spacer()
                }
            }
            Text(objective.title).frame(alignment: .leading)
            Text("1Repあたり\(String(objective.velocity))m/s").font(.footnote).frame(alignment: .leading)
            Text("\(objective.perRM)%1RM").font(.footnote).frame(alignment: .leading)
        }.padding().cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(objective: Objective.sampleData[0])
    }
}
