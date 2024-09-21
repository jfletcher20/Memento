//
//  SpinnerWidget.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct SpinnerWidget: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2, anchor: .center)
    }
}

struct SpinnerWidget_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerWidget()
    }
}
