//
//  SecondView.swift
//  Memento
//
//  Created by Joshua Fletcher
//

import SwiftUI

struct SecondView: View {
    let displayText: String;
    init(displayText: String) {
        self.displayText = displayText;
    }
    var body: some View {
        Text("You wrote: " + displayText)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(displayText: "Example text")
    }
}
