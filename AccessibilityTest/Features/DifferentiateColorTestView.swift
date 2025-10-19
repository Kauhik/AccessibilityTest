//
//  DifferentiateColorTestView.swift
//  AccessibilityTest
//
//  Feature: Differentiate Without Color Alone
//  Learn how to convey information without relying solely on color
//

import SwiftUI

struct DifferentiateColorTestView: View {
    let color: Color

    // MARK: - EXERCISE 1: Access the Differentiate Without Color Setting
    // TODO: Uncomment the line below to detect this accessibility preference
    //
    // LEARNING GOAL: Detect when users need non-color indicators
    //
    // INSTRUCTIONS:
    // Uncomment: @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    //
    // WHY? Some users are colorblind or have difficulty distinguishing colors.
    // When this setting is ON, you should add icons, text, or patterns in addition to color.
    //
    // REFERENCE: https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilitydifferentiatewithoutcolor

    // @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

    var body: some View {
        VStack(spacing: 16) {
            // Instructions
            Text("Go to Settings > Accessibility > Display & Text Size > Differentiate Without Color. Watch icons and labels appear!")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 2: Display Current Setting
            // TODO: Show whether "Differentiate Without Color" is enabled
            //
            // INSTRUCTIONS:
            // Uncomment the code below to display the current setting status

            /*
            HStack(spacing: 12) {
                Image(systemName: differentiateWithoutColor ? "checkmark.circle.fill" : "circle")
                    .font(.title)
                    .foregroundStyle(color)

                VStack(alignment: .leading, spacing: 2) {
                    Text(differentiateWithoutColor ? "Feature Active" : "Feature Inactive")
                        .font(.headline)

                    Text(differentiateWithoutColor ? "Icons & text shown" : "Color-only mode")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }
            .padding()
            .background(color.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 3: Status Indicators Without Color
            // TODO: Add icons when "Differentiate Without Color" is enabled
            //
            // LEARNING GOAL: Don't rely on color alone to communicate status
            //
            // PROBLEM: Color-only indicators
            // ❌ Green circle = Success, Red circle = Error
            // Users with color blindness can't tell them apart!
            //
            // SOLUTION: Add icons or text
            // ✅ Green circle + checkmark icon = Success
            // ✅ Red circle + X icon = Error
            //
            // INSTRUCTIONS:
            // Uncomment the code below to see icons appear based on the setting

            /*
            VStack(alignment: .leading, spacing: 12) {
                Text("Status Indicators")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                HStack(spacing: 12) {
                    // Success Status
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 28, height: 28)
                            .overlay(
                                Group {
                                    if differentiateWithoutColor {
                                        Image(systemName: "checkmark")
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                    }
                                }
                            )

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Success")
                                .font(.subheadline)
                                .fontWeight(.medium)

                            if differentiateWithoutColor {
                                Text("Completed")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Error Status
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 28, height: 28)
                            .overlay(
                                Group {
                                    if differentiateWithoutColor {
                                        Image(systemName: "xmark")
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                    }
                                }
                            )

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Error")
                                .font(.subheadline)
                                .fontWeight(.medium)

                            if differentiateWithoutColor {
                                Text("Failed")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 4: Progress Indicators
            // TODO: Add text labels to progress indicators
            //
            // LEARNING GOAL: Progress bars need more than just color
            //
            // PROBLEM: Color-only progress
            // ❌ Green bar vs Orange bar vs Red bar - what do they mean?
            //
            // SOLUTION: Add descriptive labels
            // ✅ "75% Complete" with a green bar
            //
            // INSTRUCTIONS:
            // The example below shows how to add text labels to progress indicators

            VStack(alignment: .leading, spacing: 12) {
                Text("Progress Indicators")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                // Good example: Always has text label
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Upload Progress")
                            .font(.subheadline)
                        Spacer()
                        Text("75%")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.green)
                    }

                    ProgressView(value: 0.75)
                        .tint(.green)
                }
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 5: Form Validation
            // TODO: Show errors with icons AND text, not just color
            //
            // LEARNING GOAL: Form errors need more than red borders
            //
            // PROBLEM: Color-only validation
            // ❌ Red border around field = Error (not clear what's wrong!)
            //
            // SOLUTION: Add error icons and messages
            // ✅ Red border + X icon + "Email is required" message
            //
            // INSTRUCTIONS:
            // Uncomment the code to see proper form validation

            /*
            VStack(alignment: .leading, spacing: 12) {
                Text("Form Validation")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                // Example: Text field with error state
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Email")
                            .font(.subheadline)

                        if differentiateWithoutColor {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.caption)
                                .foregroundStyle(.red)
                        }
                    }

                    TextField("Enter email", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.red, lineWidth: differentiateWithoutColor ? 2 : 1)
                        )

                    if differentiateWithoutColor {
                        Label("Email is required", systemImage: "xmark.circle.fill")
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                }
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            */

            // MARK: - EXERCISE 6: Chart and Graph Accessibility
            // TODO: Use patterns or labels instead of color-only legends
            //
            // LEARNING GOAL: Charts need more than different colored bars
            //
            // BEST PRACTICES FOR CHARTS:
            // - Add data labels directly on chart elements
            // - Use different patterns (stripes, dots, solid)
            // - Add a text-based legend
            // - Consider different shapes for different categories

            VStack(alignment: .leading, spacing: 8) {
                Text("Pro Tip: Charts & Graphs")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("For charts, use labels, patterns, or shapes in addition to colors. Example: Striped bars for Category A, dotted for Category B, solid for Category C.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 7: Interactive Elements
            // TODO: Show selected states with icons, not just color
            //
            // LEARNING GOAL: Selection needs visual indicators beyond color
            //
            // PROBLEM: Color-only selection
            // ❌ Blue background = Selected, White background = Not selected
            //
            // SOLUTION: Add checkmarks or borders
            // ✅ Blue background + Checkmark = Selected

            VStack(alignment: .leading, spacing: 12) {
                Text("Selection States")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text("Tap these items to select them. Notice how selection is shown!")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                // Example: Selectable cards
                HStack(spacing: 12) {
                    // Card 1 - Selected
                    VStack(spacing: 8) {
                        Image(systemName: "star.fill")
                            .font(.title2)

                        Text("Favorites")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(color.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color, lineWidth: 2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    // Card 2 - Not selected
                    VStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.title2)

                        Text("Recent")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
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

 1. DIFFERENTIATE WITHOUT COLOR
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    - true: User needs additional visual indicators beyond color
    - false: Color-only indicators are OK

 2. WHY THIS MATTERS
    - ~8% of men and ~0.5% of women have color vision deficiency
    - Red-green color blindness is most common
    - Some users have difficulty distinguishing similar colors
    - This benefits everyone in bright sunlight or low-light conditions

 3. COLOR-ONLY PROBLEMS (What NOT to do)
    ❌ Green = Success, Red = Error (no icons or text)
    ❌ Colored chart bars without labels
    ❌ Required form fields shown only with red borders
    ❌ Selected items shown only by background color change
    ❌ Progress bars without percentage text

 4. SOLUTIONS (Best Practices)
    ✅ Icons: checkmark (success), X (error), ! (warning)
    ✅ Text labels: "Success", "Error", "Required", "75% complete"
    ✅ Patterns: stripes, dots, solid fills
    ✅ Shapes: circles, squares, triangles for different categories
    ✅ Borders: thick borders for selected items
    ✅ Position: consistent placement for different states

 5. IMPLEMENTATION PATTERN
    if differentiateWithoutColor {
        // Show icon AND color
        Image(systemName: "checkmark.circle.fill")
            .foregroundStyle(.green)
    } else {
        // Color only
        Circle().fill(.green)
    }

 6. COMMON USE CASES
    Status Indicators:
    - Add checkmark, X, or exclamation icons

    Form Validation:
    - Show error messages, not just red borders

    Progress Bars:
    - Add percentage text or completion labels

    Charts/Graphs:
    - Use patterns, direct labels, or legends

    Selection States:
    - Add checkmarks or thick borders

    Color-Coded Categories:
    - Add icons or labels for each category

 BEST PRACTICES:
 ✅ Always provide a non-color indicator for critical information
 ✅ Use SF Symbols for consistent iconography
 ✅ Add text labels when possible
 ✅ Test in grayscale to ensure information is conveyed
 ✅ Consider using patterns for data visualization
 ❌ Never use color as the only way to convey information
 ❌ Don't assume users can distinguish similar colors
 ❌ Don't rely on subtle color differences

 TESTING YOUR IMPLEMENTATION:
 1. Enable setting: Settings → Accessibility → Display & Text Size → Differentiate Without Color
 2. Check your app:
    - Can you understand all status indicators?
    - Are form errors clear without color?
    - Can you tell which items are selected?
    - Is chart data distinguishable?

 Alternative test:
 1. Take a screenshot
 2. Convert to grayscale (use any image editor)
 3. Can you still understand all information?

 COMMON ISSUES & SOLUTIONS:
 ❌ Users can't tell success from error
    ✅ Add checkmark and X icons

 ❌ Chart categories are indistinguishable
    ✅ Add labels or use different patterns

 ❌ Form validation is unclear
    ✅ Show error messages with icons

 ❌ Selected items aren't obvious
    ✅ Add checkmarks or thick borders

 APPLE RESOURCES:
 - Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/accessibility#Color-and-shapes
 - Color Contrast: https://developer.apple.com/design/human-interface-guidelines/color
 - SF Symbols: https://developer.apple.com/sf-symbols/
 */

#Preview {
    DifferentiateColorTestView(color: .green)
}
