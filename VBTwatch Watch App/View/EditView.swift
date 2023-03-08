//
//  EditView.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/08.
//

import SwiftUI

struct EditView: View {
    var body: some View {
        VStack {
            VStack {
                Text("重量").font(.system(size:13))
                HStack {
                    Image(systemName: "plus.circle.fill").font(.system(size:23))
                        .foregroundColor(.gray)
                    Spacer()
                    HStack{
                        Text("50").font(.title2)
                        Text("kg")
                    }
                    Spacer()
                    Image(systemName: "minus.circle.fill").font(.system(size:23))
                        .foregroundColor(.gray)
                }
            }
            VStack {
                Text("セット数").font(.footnote)
                HStack {
                    Image(systemName: "plus.circle.fill").font(.system(size:23))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("1").font(.title2)
                    Spacer()
                    Image(systemName: "minus.circle.fill").font(.system(size:23))
                        .foregroundColor(.gray)
                }
            }
            VStack {
                HStack{
                    Text("上限速度低下率").font(.footnote)
                    Image(systemName: "questionmark.circle.fill").font(.system(size:15))
                        .foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "plus.circle.fill").font(.system(size:23))
                        .foregroundColor(.gray)
                    Spacer()
                    HStack{
                        Text("20").font(.title2)
                        Text("%")
                    }
                    Spacer()
                    Image(systemName: "minus.circle.fill").font(.system(size:23))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
