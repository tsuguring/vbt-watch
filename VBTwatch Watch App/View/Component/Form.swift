//
//  Form.swift
//  VBTwatch Watch App
//
//  Created by Ryo Yoshitsugu on R 5/03/09.
//

import SwiftUI

struct Form: View {
    let label: String
    @Binding var data: Int
    
    var body: some View {
        VStack {
            Text(label).font(.system(size:12))
            HStack {
                Image(systemName: "minus.circle.fill").font(.system(size:21))
                    .foregroundColor(.gray)
                    .onTapGesture {
                        if data > 0 {
                            data = minusData(label: label, data: data)
                        }
                    }
                Spacer()
                HStack{
                    Text(String(data)).font(.title)
                    Text(getUnit(label: label))
                }
                Spacer()
                Image(systemName: "plus.circle.fill").font(.system(size:21))
                    .foregroundColor(.gray)
                    .onTapGesture {
                        data = plusData(label: label, data: data)
                    }
            }
        }.padding(.vertical, 2)
    }
}

func getUnit(label: String) -> String {
    switch label {
    case "重量":
        return "kg"
    case "セット数":
        return "set"
    case "上限速度低下率":
        return "%"
    default:
        return ""
    }
}

func plusData(label: String, data: Int) -> Int {
    let MAX_WEIGHT = 200
    let MAX_SET = 10
    let MAX_VELOCITY_LOSS = 50
    switch label {
    case "重量":
        if data < MAX_WEIGHT { return data+5 }
        else { return data }
    case "セット数":
        if data < MAX_SET { return data+1 }
        else { return data }
    case "上限速度低下率":
        if data < MAX_VELOCITY_LOSS { return data+5 }
        else { return data }
    default:
        return data
    }
}

func minusData(label: String, data: Int) -> Int {
    let MIN_WEIGHT = 10
    let MIN_SET = 1
    let MIN_VELOCITY_LOSS = 10
    switch label {
    case "重量":
        if data > MIN_WEIGHT { return data-5 }
        else { return data }
    case "セット数":
        if data > MIN_SET { return data-1 }
        else { return data }
    case "上限速度低下率":
        if data > MIN_VELOCITY_LOSS { return data-5 }
        else { return data }
    default:
        return data
    }
}
