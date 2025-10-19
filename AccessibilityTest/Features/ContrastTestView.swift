//
//  ContrastTestView.swift
//  AccessibilityTest
//
//  Feature: Increased Contrast Support
//  Learn how to support users who need higher contrast ratios
//

import SwiftUI

struct ContrastTestView: View {
    let color: Color

    // MARK: - EXERCISE: Access the Contrast Environment Variable
    // TODO: Uncomment to detect if Increase Contrast is enabled
    //
    // INSTRUCTIONS:
    // Uncomment: @Environment(\.colorSchemeContrast) var contrast
    //
    // WHY? Users with low vision need higher contrast between elements
    // Values: .standard or .increased
    //
    // REFERENCE: https://developer.apple.com/documentation/swiftui/colorschemecontrast

    // @Environment(\.colorSchemeContrast) var contrast

    var body: some View {
        VStack(spacing: 16) {
            Text("Go to Settings > Accessibility > Display & Text Size > Increase Contrast to see enhanced visual separation.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // TODO: Implement contrast-aware UI elements
            // When contrast == .increased:
            // - Increase border widths (1pt → 2pt)
            // - Darken background colors
            // - Increase opacity of dividers
            // - Use stronger shadows
            //
            // Example:
            // .stroke(Color.blue, lineWidth: contrast == .increased ? 2 : 1)
            // .background(contrast == .increased ? Color.gray.opacity(0.3) : Color.gray.opacity(0.1))

            VStack(alignment: .leading, spacing: 12) {
                Text("Buttons")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Button("Standard Button") {
                    // Action
                }
                .foregroundStyle(color)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 1)  // TODO: Increase to 2 when contrast == .increased
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Button("Filled Button") {
                    // Action
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)  // TODO: Darken when contrast == .increased
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // Learning tip
            VStack(alignment: .leading, spacing: 8) {
                Text("WCAG Contrast Standards")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("AA Level: 4.5:1 for normal text, 3:1 for large text\nAAA Level: 7:1 for normal text, 4.5:1 for large text\n\nWhen Increase Contrast is ON, aim for AAA standards!")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
        .background(Color.secondary.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ContrastTestView(color: .purple)
}
