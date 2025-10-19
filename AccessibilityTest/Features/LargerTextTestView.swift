//
//  LargerTextTestView.swift
//  AccessibilityTest
//
//  Feature: Dynamic Type / Larger Text Support
//  Learn how to make your app's text scale with user preferences
//

import SwiftUI

struct LargerTextTestView: View {
    let color: Color
    @State private var notificationCount = 3

    // MARK: - EXERCISE 1: Access the Dynamic Type Environment Variable
    // TODO: Uncomment the line below to access the current text size setting
    //
    // LEARNING GOAL: Detect when users have enabled larger text sizes
    //
    // INSTRUCTIONS:
    // 1. Uncomment: @Environment(\.dynamicTypeSize) var dynamicTypeSize
    //
    // WHY? This environment variable tells you the current text size preference.
    // Values range from .xSmall to .accessibility5 (extremely large)
    //
    // REFERENCE: https://developer.apple.com/documentation/swiftui/dynamictypesize

    // @Environment(\.dynamicTypeSize) var dynamicTypeSize

    // MARK: - EXERCISE 2: Detect Accessibility Sizes
    // TODO: Create a computed property to check if accessibility sizes are enabled
    //
    // LEARNING GOAL: Adapt your layout for very large text sizes
    //
    // INSTRUCTIONS:
    // Uncomment the following computed property:
    //
    // var isAccessibilitySize: Bool {
    //     dynamicTypeSize >= .accessibility1
    // }
    //
    // WHY? When users enable "Larger Accessibility Sizes" in Settings,
    // text can become VERY large. You may need to adjust your layout!
    //
    // Accessibility sizes: .accessibility1 through .accessibility5
    // Standard sizes: .xSmall through .xxxLarge


    var body: some View {
        VStack(spacing: 16) {
            // Instructions
            Text("Go to Settings > Accessibility > Display & Text Size > Larger Text. Watch elements scale!")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 3: Display Current Text Size
            // TODO: Show the current dynamic type size to the user
            //
            // LEARNING GOAL: Help users understand when accessibility sizes are active
            //
            // INSTRUCTIONS:
            // 1. Uncomment the code below to show current size status
            // 2. This uses the isAccessibilitySize property you created above
            //
            // NOTE: This demonstrates responsive design - showing/hiding elements
            // based on text size to prevent overcrowding.

            /*
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "textformat.size")
                        .font(.title2)
                        .foregroundStyle(color)
                    Text("Current Size")
                        .font(.headline)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    Spacer()
                }

                HStack {
                    Text(isAccessibilitySize ? "Accessibility Size Active" : "Standard Size")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundStyle(isAccessibilitySize ? .green : .blue)
                    Spacer()
                    Text("\(String(describing: dynamicTypeSize))")
                        .font(.caption)
                        .minimumScaleFactor(0.3)
                        .lineLimit(1)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background(color.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 4: Text Style Samples
            // TODO: Make text automatically scale with Dynamic Type
            //
            // LEARNING GOAL: Use semantic text styles instead of fixed sizes
            //
            // INSTRUCTIONS:
            // All the Text views below already use semantic styles like .title, .headline, .body
            // These automatically scale with Dynamic Type - no code changes needed!
            //
            // ✅ GOOD: .font(.headline) - Scales automatically
            // ❌ BAD: .font(.system(size: 18)) - Fixed size, doesn't scale
            //
            // Try changing your text size in Settings and watch these scale!

            VStack(alignment: .leading, spacing: 12) {
                Text("Text Styles")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Title - Large Header")
                        .font(.title)

                    Text("Headline - Section Header")
                        .font(.headline)

                    Text("Body - Regular paragraph text that should be easily readable.")
                        .font(.body)

                    Text("Caption - Small supplementary text")
                        .font(.caption)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 5: Adaptive Layouts
            // TODO: Change layout orientation based on text size
            //
            // LEARNING GOAL: Prevent layout breaking when text is very large
            //
            // INSTRUCTIONS:
            // The code below demonstrates adaptive layouts. When text is very large,
            // it's better to stack elements vertically instead of horizontally.
            //
            // Uncomment this code to see adaptive layouts in action:

            /*
            VStack(alignment: .leading, spacing: 12) {
                Text("Adaptive Layout")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                // Changes from HStack to VStack at accessibility sizes
                if isAccessibilitySize {
                    // Vertical layout for large text
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Notifications")
                                .font(.headline)
                            Text("\(notificationCount) unread")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Button("Mark All Read") {
                            notificationCount = 0
                        }
                        .font(.body)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(color)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                } else {
                    // Horizontal layout for normal text
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Notifications")
                                .font(.headline)
                            Text("\(notificationCount) unread")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Button("Mark All Read") {
                            notificationCount = 0
                        }
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(color)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 6: Important Layout Modifiers
            // TODO: Learn about critical modifiers for Dynamic Type support
            //
            // LEARNING GOAL: Prevent text truncation and layout issues
            //
            // KEY MODIFIERS YOU SHOULD KNOW:
            //
            // 1. .fixedSize(horizontal: false, vertical: true)
            //    - Allows text to wrap to multiple lines instead of truncating
            //    - Use on Text views that should never be cut off
            //
            // 2. .minimumScaleFactor(0.5)
            //    - Shrinks text if it doesn't fit (down to 50% of original size)
            //    - Use sparingly - prefer wrapping text instead
            //
            // 3. .lineLimit(nil) or .lineLimit(3)
            //    - Controls how many lines text can occupy
            //    - nil = unlimited lines (preferred for accessibility)
            //
            // EXAMPLE:
            Text("This is a long piece of text that should wrap to multiple lines instead of being truncated with ellipses.")
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)  // ← Allows wrapping
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 7: Hiding Decorative Elements
            // TODO: Hide non-essential UI elements at large text sizes
            //
            // LEARNING GOAL: Preserve screen space for important content
            //
            // INSTRUCTIONS:
            // When text is very large, decorative icons and images can waste space.
            // Use conditional rendering to hide them:
            //
            // if !isAccessibilitySize {
            //     Image(systemName: "star.fill")  // Only show at normal sizes
            // }
            //
            // This gives more room for the text that users are trying to read!

            VStack(alignment: .leading, spacing: 8) {
                Text("Tip: Hide Decorative Elements")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("When text sizes are very large, consider hiding decorative icons, images, and secondary information to preserve screen space for the content users want to read.")
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

// MARK: - 📚 Learning Resources
/*
 KEY CONCEPTS:

 1. DYNAMIC TYPE SIZES
    Standard Sizes:
    - .xSmall, .small, .medium, .large (default), .xLarge, .xxLarge, .xxxLarge

    Accessibility Sizes (when "Larger Accessibility Sizes" is ON):
    - .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5

 2. SEMANTIC TEXT STYLES (Automatically scale with Dynamic Type)
    ✅ .largeTitle - Very large titles
    ✅ .title, .title2, .title3 - Section headers
    ✅ .headline - Important content
    ✅ .body - Regular paragraph text
    ✅ .callout - Secondary content
    ✅ .subheadline - Less prominent content
    ✅ .footnote - Fine print
    ✅ .caption, .caption2 - Very small text

    ❌ .font(.system(size: 18)) - Fixed size, doesn't scale!

 3. ESSENTIAL MODIFIERS
    .fixedSize(horizontal: false, vertical: true)
    - Allows text to expand vertically (wrap to multiple lines)
    - Prevents truncation

    .minimumScaleFactor(0.5)
    - Shrinks text if needed (down to 50%)
    - Use sparingly - prefer wrapping instead

    .lineLimit(nil)
    - Allows unlimited lines
    - Better for accessibility than .lineLimit(1)

 4. RESPONSIVE LAYOUTS
    Detect accessibility sizes:
    - @Environment(\.dynamicTypeSize) var dynamicTypeSize
    - if dynamicTypeSize >= .accessibility1 { /* large size layout */ }

    Adapt your layout:
    - Use VStack instead of HStack at large sizes
    - Hide decorative elements
    - Increase spacing
    - Simplify complex layouts

 5. BEST PRACTICES
    ✅ Always use semantic text styles (.headline, .body, etc.)
    ✅ Use .fixedSize(horizontal: false, vertical: true) to prevent truncation
    ✅ Test with the largest accessibility sizes
    ✅ Adapt layouts for very large text
    ✅ Hide decorative elements at large sizes
    ❌ Never use fixed font sizes like .font(.system(size: 18))
    ❌ Don't use .lineLimit(1) unless absolutely necessary
    ❌ Don't rely on horizontal scrolling for large text

 TESTING YOUR IMPLEMENTATION:
 1. Go to Settings → Accessibility → Display & Text Size → Larger Text
 2. Enable "Larger Accessibility Sizes"
 3. Drag the slider to the maximum size
 4. Return to your app and check:
    - Does all text scale properly?
    - Is any text truncated (...)?
    - Does the layout break?
    - Can you still access all features?

 COMMON ISSUES & SOLUTIONS:
 ❌ Text is truncated with "..."
    ✅ Add .fixedSize(horizontal: false, vertical: true)

 ❌ Layout breaks at large sizes
    ✅ Use conditional layouts (VStack vs HStack)

 ❌ Can't fit all content on screen
    ✅ Hide decorative elements, simplify layout

 ❌ Fixed font sizes don't scale
    ✅ Replace .font(.system(size: X)) with semantic styles

 APPLE RESOURCES:
 - Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/typography
 - Dynamic Type Documentation: https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically
 - WWDC Sessions: Search for "Dynamic Type" on developer.apple.com
 */

#Preview {
    LargerTextTestView(color: .orange)
}
