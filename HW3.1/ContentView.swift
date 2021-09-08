//
//  ContentView.swift
//  HW3.1
//
//  Created by Mike Albright on 08.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedLight = TrafficLight.red
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Spacer()
                switch selectedLight {
                case .red:
                    VStack {
                        ColorCircle(color: .red, isTurnedOn: true)
                        ColorCircle(color: .yellow, isTurnedOn: false)
                        ColorCircle(color: .green, isTurnedOn: false)
                    }
                case .yellow:
                    VStack {
                        ColorCircle(color: .red, isTurnedOn: false)
                        ColorCircle(color: .yellow, isTurnedOn: true)
                        ColorCircle(color: .green, isTurnedOn: false)
                    }
                case .green:
                    VStack {
                        ColorCircle(color: .red, isTurnedOn: false)
                        ColorCircle(color: .yellow, isTurnedOn: false)
                        ColorCircle(color: .green, isTurnedOn: true)
                    }
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 130, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 5))
                        .padding()
                    Button(action: {selectedLight.next()
                        buttonText = "NEXT"
                    }) {
                        Text(buttonText)
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .padding()
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum TrafficLight {
    case red, yellow, green
    mutating func next() {
        switch self {
        case .red: self = .yellow
        case .yellow: self = .green
        case .green: self = .red
        }
    }
}
