//
//  DarkInterfaceTestView.swift
//  AccessibilityTest
//
//  Feature: Dark Mode / Dark Interface Support
//  Learn how to support dark appearance for users with light sensitivity
//

import SwiftUI

struct DarkInterfaceTestView: View {
    let color: Color

    // MARK: - EXERCISE 1: Access the Color Scheme Environment Variable
    // TODO: Uncomment the line below to detect if Dark Mode is enabled
    //
    // LEARNING GOAL: Adapt your UI to light and dark appearances
    //
    // INSTRUCTIONS:
    // Uncomment: @Environment(\.colorScheme) var colorScheme
    //
    // WHY? This tells you if the user has Dark Mode enabled
    // Values: .light or .dark
    //
    // REFERENCE: https://developer.apple.com/documentation/swiftui/colorscheme

    // @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 16) {
            // Instructions
            Text("Go to Settings > Display & Brightness and switch between Light and Dark modes to see the interface adapt.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 2: Display Current Mode
            // TODO: Show whether Dark Mode is currently active
            //
            // INSTRUCTIONS:
            // Uncomment the code below to display the current color scheme
            //
            // This demonstrates how to check the current mode and display different content

            /*
            HStack {
                Image(systemName: colorScheme == .dark ? "moon.fill" : "sun.max.fill")
                    .font(.title2)
                    .foregroundStyle(color)

                VStack(alignment: .leading) {
                    Text(colorScheme == .dark ? "Dark Mode Active" : "Light Mode Active")
                        .font(.headline)

                    Text(colorScheme == .dark ? "Reduced brightness" : "Full brightness")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }
            .padding()
            .background(color.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 3: Adaptive Colors
            // TODO: Use colors that automatically adapt to light/dark modes
            //
            // LEARNING GOAL: SwiftUI provides semantic colors that adapt automatically
            //
            // AUTOMATIC COLORS (No code needed!):
            // - Color.primary - Black in light mode, white in dark mode
            // - Color.secondary - Gray that adapts
            // - Color(.systemBackground) - Background color that adapts
            // - Color(.label) - Text color that adapts
            //
            // The text below already uses .primary and .secondary - they adapt automatically!

            VStack(alignment: .leading, spacing: 12) {
                Text("Adaptive Colors")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text("This text uses Color.primary - it's black in light mode and white in dark mode!")
                    .font(.body)
                    .foregroundStyle(.primary)

                Text("This uses Color.secondary - it's a lighter gray that also adapts.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )

            // MARK: - EXERCISE 4: Conditional Colors
            // TODO: Use different colors based on the color scheme
            //
            // LEARNING GOAL: Sometimes you need custom colors for light/dark modes
            //
            // INSTRUCTIONS:
            // Uncomment the code below to see conditional coloring in action
            //
            // PATTERN: colorScheme == .dark ? darkModeColor : lightModeColor

            /*
            VStack(spacing: 12) {
                Text("Custom Adaptive Colors")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                HStack(spacing: 12) {
                    // Card that changes background based on mode
                    VStack {
                        Image(systemName: "square.fill")
                            .font(.largeTitle)
                            .foregroundStyle(colorScheme == .dark ? Color.cyan : Color.blue)

                        Text("Background")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(colorScheme == .dark ? Color(.systemGray6) : Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    // Card that changes text based on mode
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .foregroundStyle(colorScheme == .dark ? Color.orange : Color.red)

                        Text("Text")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(colorScheme == .dark ? Color(.systemGray6) : Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 5: Asset Catalog Colors
            // TODO: Learn about defining adaptive colors in Assets
            //
            // LEARNING GOAL: Best practice is to define colors in your Asset Catalog
            //
            // INSTRUCTIONS (Outside of code):
            // 1. Open Assets.xcassets in Xcode
            // 2. Right-click → New Color Set
            // 3. In Attributes Inspector, set Appearances to "Any, Dark"
            // 4. Set different colors for Light and Dark appearances
            // 5. Use in code: Color("YourColorName")
            //
            // BENEFITS:
            // - Centralized color management
            // - Automatic adaptation
            // - Easy to update across entire app
            // - Works with UIKit and SwiftUI

            VStack(alignment: .leading, spacing: 8) {
                Text("Pro Tip: Asset Catalog Colors")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("Define your app's colors in Assets.xcassets with separate light/dark variants. This keeps your code clean and colors consistent!")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 6: Images in Dark Mode
            // TODO: Make images adapt to dark mode
            //
            // LEARNING GOAL: Images may need dark mode variants
            //
            // BEST PRACTICES:
            // - SF Symbols automatically adapt (no work needed!)
            // - Custom images: Add dark variants in Assets.xcassets
            // - Or use .renderingMode(.template) to make images tintable

            HStack(spacing: 16) {
                VStack {
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundStyle(color)

                    Text("SF Symbol")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)

                VStack {
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.primary)

                    Text("Auto Color")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
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

 1. COLOR SCHEME DETECTION
    @Environment(\.colorScheme) var colorScheme
    - .light - Light mode is active
    - .dark - Dark mode is active

 2. SEMANTIC COLORS (Automatically adapt!)
    ✅ Color.primary - Main text color
    ✅ Color.secondary - Secondary text color
    ✅ Color(.systemBackground) - Main background
    ✅ Color(.systemGray6) - Light gray background
    ✅ Color(.label) - Text labels
    ✅ Color(.secondaryLabel) - Secondary labels
    ✅ Color.accentColor - Your app's accent color

 3. CONDITIONAL COLORS
    Pattern: colorScheme == .dark ? darkColor : lightColor

    Example:
    .background(colorScheme == .dark ? Color(.systemGray6) : Color.white)

 4. ASSET CATALOG COLORS (Best Practice!)
    Steps:
    1. Open Assets.xcassets
    2. Add New Color Set
    3. Set Appearances: "Any, Dark"
    4. Define colors for both modes
    5. Use: Color("MyCustomColor")

 5. SF SYMBOLS
    - Automatically adapt to dark mode
    - Use .foregroundStyle(.primary) for automatic colors
    - Or use .foregroundStyle(yourColor) for custom colors

 6. CUSTOM IMAGES
    - Add dark variants in Assets.xcassets
    - Set Appearances: "Any, Dark"
    - Provide separate images for each mode
    - Or use .renderingMode(.template) to tint images

 BEST PRACTICES:
 ✅ Use semantic colors (.primary, .secondary) when possible
 ✅ Define custom colors in Assets.xcassets
 ✅ Test in both light and dark modes
 ✅ Ensure sufficient contrast in both modes
 ✅ Use SF Symbols - they adapt automatically
 ❌ Don't hardcode colors like Color.black or Color.white
 ❌ Don't assume the color scheme
 ❌ Don't use images that only work in one mode

 TESTING YOUR IMPLEMENTATION:
 1. Open Settings → Display & Brightness
 2. Switch between Light and Dark
 3. Check your app:
    - All colors should look good in both modes
    - Text should be readable
    - Images should be appropriate
    - No jarring color combinations

 Quick test in Xcode:
 1. Click Environment Overrides button in Xcode
 2. Toggle "Interface Style" between Light and Dark
 3. Watch your preview update in real-time!

 COMMON ISSUES & SOLUTIONS:
 ❌ Text is unreadable in one mode
    ✅ Use semantic colors like .primary instead of hardcoded colors

 ❌ Images look wrong in dark mode
    ✅ Add dark variants in Assets.xcassets

 ❌ Colors don't match in both modes
    ✅ Use Asset Catalog colors with light/dark variants

 ❌ Hardcoded colors everywhere
    ✅ Refactor to use semantic or asset colors

 APPLE RESOURCES:
 - Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/dark-mode
 - Color Documentation: https://developer.apple.com/documentation/swiftui/color
 - Asset Catalogs: https://developer.apple.com/documentation/xcode/asset-management
 */

#Preview {
    DarkInterfaceTestView(color: .indigo)
}
