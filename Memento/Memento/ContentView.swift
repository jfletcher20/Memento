//
//  ContentView.swift
//  Memento
//
//  Uses "AlertToast" package v1.3.9
//
//  Created by Joshua Lee Fletcher
//

import AlertToast
import SwiftUI

struct ContentView: View {
    @State private var inputText: String = "";
    @State private var showToast: Bool = false;
    @State private var timesTapped: Int = 0;
    var body: some View {
        NavigationView {
            VStack {
                Text("Write some basic text!")
                TextField("Enter text below", text: $inputText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink(destination: SecondView(displayText: inputText)) {
                    RoundedRectangle(cornerRadius: 8).frame(width: 200, height: 48).overlay(Text("Submit").foregroundColor(.white))
                }.padding()
                Button("Tap me!", action: {
                    if (!$showToast.wrappedValue) {
                        timesTapped += 1;
                        showToast.toggle()
                    }
                })
            }.toast(isPresenting: $showToast) {
                AlertToast(type: .regular, title: "Button tapped \(timesTapped) times!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
