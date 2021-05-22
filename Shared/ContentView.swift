//
//  ContentView.swift
//  Shared
//
//  Created by Toomas Vahter on 19.05.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Hello, world!")
            SubtitledButton(title: "First Title", subtitle: "First Subtitle", action: tapAction)
                .buttonStyle(PlainButtonStyle())
            SubtitledButton(title: "Second Title", subtitle: "Second Subtitle", action: tapAction)
                .buttonStyle(RoundedRowButtonStyle())
        }.padding()
    }
    
    func tapAction() {
        print("tapped")
    }
}

struct SubtitledButton: View {
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            VStack(spacing: 4) {
                Text(title)
                Text(subtitle).font(.footnote)
            }
        })
    }
}

struct RoundedRowButtonStyle: ButtonStyle {
    @ViewBuilder func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(Color.accentColor)
            .cornerRadius(8)
            .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
