//
//  AccessibilityTestPlaygroundRouter.swift
//  AccessibilityTest
//
//  Routes to the appropriate test playground based on feature name
//

import SwiftUI

struct AccessibilityTestPlayground: View {
    let feature: AccessibilityFeature

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Try It Out")
                .font(.headline)
                .foregroundStyle(.secondary)

            Text("Test how this accessibility feature works with the interactive elements below.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            // Route to the appropriate feature test view
            Group {
                switch feature.name {
                case "VoiceOver":
                    VoiceOverTestView(color: feature.color)
                case "Voice Control":
                    VoiceControlTestView(color: feature.color)
                case "Larger Text":
                    LargerTextTestView(color: feature.color)
                case "Dark Interface":
                    DarkInterfaceTestView(color: feature.color)
                case "Differentiate Without Color Alone":
                    DifferentiateColorTestView(color: feature.color)
                case "Sufficient Contrast":
                    ContrastTestView(color: feature.color)
                case "Reduced Motion":
                    ReducedMotionTestView(color: feature.color)
                case "Captions":
                    CaptionsTestView(color: feature.color)
                case "Audio Descriptions":
                    AudioDescriptionsTestView(color: feature.color)
                default:
                    GenericTestView(color: feature.color)
                }
            }
        }
    }
}

#Preview {
    AccessibilityTestPlayground(feature: AccessibilityFeature.allFeatures[0])
}
