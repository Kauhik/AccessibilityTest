//
//  GenericTestView.swift
//  AccessibilityTest
//
//  Fallback view for features without specific test playgrounds
//

import SwiftUI

struct GenericTestView: View {
    let color: Color

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "hand.raised.fill")
                .font(.system(size: 60))
                .foregroundStyle(color)

            Text("Feature Playground")
                .font(.title2)
                .fontWeight(.bold)

            Text("This feature's interactive playground is coming soon. Check the activation steps above to enable and test this feature manually!")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.secondary.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    GenericTestView(color: .blue)
}
