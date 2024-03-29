//
//  ContentView.swift
//  SwiftUIDynamicColorShapeStyle
//
//  Created by Kyle Lanchman on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)

            Text("Hello, world!")

            Button("Button") {}
                .buttonStyle(.bordered)

            // HierarchicalShapeStyle (primary, secondary, etc) is based on the foreground style!
            // Using .secondary here gives us a dimmed version of our foreground style's color.

            Text("Background")
                .foregroundStyle(Color.primary)
                .padding()
                .background(.secondary)

            Circle()
                .strokeBorder(lineWidth: 5)
                .fill(.secondary)
                .frame(width: 100, height: 100)
        }
        .foregroundStyle(.dynamic(light: .red, dark: .yellow))
        .padding()
    }
}

struct DynamicColorShapeStyle: ShapeStyle {
    let light: Color
    let dark: Color

    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        if environment.colorScheme == .light {
            return light
        } else {
            return dark
        }
    }
}

// This lets us use `.dynamic(light:dark:)` in places that take a ShapeStyle
extension ShapeStyle where Self == DynamicColorShapeStyle {
    static func `dynamic`(light: Color, dark: Color) -> DynamicColorShapeStyle {
        DynamicColorShapeStyle(light: light, dark: dark)
    }
}

#Preview {
    ContentView()
}
