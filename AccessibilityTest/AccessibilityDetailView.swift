//
//  AccessibilityDetailView.swift
//  AccessibilityTest
//
//  Detail view for each accessibility feature
//

import SwiftUI

struct AccessibilityDetailView: View {
    let feature: AccessibilityFeature

    // MARK: - EXERCISE: Support Dark Mode and Dynamic Type
    // TODO: Uncomment these to enable dark mode and dynamic type support
    //
    // INSTRUCTIONS:
    // 1. Uncomment: @Environment(\.colorScheme) var colorScheme
    // 2. Uncomment: @Environment(\.dynamicTypeSize) var dynamicTypeSize
    // 3. Uncomment the isAccessibilitySize computed property
    //
    // WHY? This allows the detail view to adapt to user preferences

    // @Environment(\.colorScheme) var colorScheme
    // @Environment(\.dynamicTypeSize) var dynamicTypeSize

    // var isAccessibilitySize: Bool {
    //     dynamicTypeSize >= .accessibility1
    // }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // MARK: - EXERCISE: Hide decorative icon at large text sizes
                // TODO: Uncomment the conditional to hide the icon when text is very large
                //
                // WHY? Save screen space for important content

                // if !isAccessibilitySize {
                    HStack {
                        Image(systemName: feature.icon)
                            .font(.system(size: 60))
                            .foregroundStyle(feature.color)
                        Spacer()
                    }
                    .padding(.top)
                // }

                // Feature name
                Text(feature.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    // TODO: Uncomment to adjust padding based on text size
                    // .padding(.top, isAccessibilitySize ? 8 : 0)

                // MARK: - EXERCISE: Hide short description at accessibility sizes
                // TODO: Uncomment the conditional to hide this at large text sizes

                // if !isAccessibilitySize {
                    Text(feature.shortDescription)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                // }

                Divider()

                // MARK: - EXERCISE: Hide platform badges at accessibility sizes
                // TODO: Uncomment the conditional to hide these badges when text is large
                //
                // WHY? Platform availability is less important than the feature description
                // Hide it to save space when text is very large

                // if !isAccessibilitySize {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Available On")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        FlowLayout(spacing: 8) {
                            ForEach(feature.platforms, id: \.self) { platform in
                                PlatformBadge(platform: platform)
                            }
                        }
                    }

                    Divider()
                // }

                // Full description
                VStack(alignment: .leading, spacing: 12) {
                    Text("About")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(feature.fullDescription)
                        .font(.body)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Divider()

                // MARK: - EXERCISE: Adaptive Layout for Activation Steps
                // TODO: Uncomment the adaptive layout code below
                //
                // LEARNING GOAL: Change from horizontal to vertical layout at large text sizes
                //
                // WHY? HStack with numbers + text becomes cramped at large text sizes.
                // VStack layout is more readable for accessibility users.
                //
                // INSTRUCTIONS:
                // Uncomment all the code in this section to enable adaptive layouts

                VStack(alignment: .leading, spacing: 12) {
                    Text("How to Enable")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)

                    // TODO: Uncomment the adaptive spacing
                    // VStack(alignment: .leading, spacing: isAccessibilitySize ? 16 : 8) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(Array(feature.activationSteps.enumerated()), id: \.offset) { index, step in
                            // TODO: Uncomment this adaptive layout
                            // if isAccessibilitySize {
                            //     // Simplified layout for accessibility sizes
                            //     VStack(alignment: .leading, spacing: 4) {
                            //         Text("\(index + 1).")
                            //             .font(.body)
                            //             .fontWeight(.bold)
                            //             .foregroundStyle(feature.color)
                            //
                            //         Text(step)
                            //             .font(.body)
                            //             .fixedSize(horizontal: false, vertical: true)
                            //             .lineSpacing(4)
                            //     }
                            // } else {
                                // Standard layout for normal sizes
                                HStack(alignment: .top, spacing: 12) {
                                    Text("\(index + 1).")
                                        .font(.body)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(feature.color)
                                        .frame(width: 20, alignment: .leading)

                                    Text(step)
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .lineSpacing(4)
                                }
                            // }
                        }
                    }
                }

                Divider()

                // Test Playground
                AccessibilityTestPlayground(feature: feature)

                // MARK: - EXERCISE: Hide developer tips at accessibility sizes
                // TODO: Uncomment the conditional to hide tips when text is large
                //
                // WHY? Save space for more important content

                // if !isAccessibilitySize {
                    Divider()

                    VStack(alignment: .leading, spacing: 12) {
                        Text("For Developers")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        Text("Ensure your app supports this feature by following Apple's Human Interface Guidelines and testing with the Accessibility Inspector.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                // }

            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlatformBadge: View {
    let platform: String

    var platformIcon: String {
        switch platform {
        case "iOS":
            return "iphone"
        case "iPadOS":
            return "ipad"
        case "macOS":
            return "macbook"
        case "watchOS":
            return "applewatch"
        case "tvOS":
            return "appletv"
        case "visionOS":
            return "visionpro"
        default:
            return "questionmark.circle"
        }
    }

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: platformIcon)
                .font(.caption)
            Text(platform)
                .font(.caption)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.accentColor.opacity(0.15))
        .foregroundStyle(Color.accentColor)
        .clipShape(Capsule())
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.replacingUnspecifiedDimensions().width, subviews: subviews, spacing: spacing)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.frames[index].minX, y: bounds.minY + result.frames[index].minY), proposal: .unspecified)
        }
    }

    struct FlowResult {
        var frames: [CGRect] = []
        var size: CGSize = .zero

        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0

            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)

                if currentX + size.width > maxWidth && currentX > 0 {
                    currentX = 0
                    currentY += lineHeight + spacing
                    lineHeight = 0
                }

                frames.append(CGRect(x: currentX, y: currentY, width: size.width, height: size.height))
                lineHeight = max(lineHeight, size.height)
                currentX += size.width + spacing
            }

            self.size = CGSize(width: maxWidth, height: currentY + lineHeight)
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityDetailView(feature: AccessibilityFeature.allFeatures[0])
    }
}
