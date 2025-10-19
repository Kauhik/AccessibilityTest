//
//  VoiceOverTestView.swift
//  AccessibilityTest
//
//  Feature: VoiceOver Support
//  Learn how to make your app accessible to blind and low-vision users
//

import SwiftUI

struct VoiceOverTestView: View {
    let color: Color
    @State private var counter = 0
    @State private var isLiked = false
    @State private var sliderValue = 50.0

    var body: some View {
        VStack(spacing: 16) {
            Text("Enable VoiceOver (triple-click side button) and try navigating these elements by swiping right/left. Double-tap to activate.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 1: Counter Button with Accessibility Labels
            // TODO: Add accessibility label, hint, and value to this button
            //
            // LEARNING GOAL: Screen reader users need descriptive labels and context
            //
            // INSTRUCTIONS:
            // 1. Add .accessibilityLabel("Add item button") to describe what this button does
            // 2. Add .accessibilityHint("Double tap to add an item to the counter") to explain how to use it
            // 3. Add .accessibilityValue("Current count: \(counter) items") to announce the dynamic state
            //
            // WHY? VoiceOver reads: Label → Value → Hint → Trait
            // Example: "Add item button, Current count: 5 items, Double tap to add an item to the counter, Button"
            //
            // REFERENCE: https://developer.apple.com/documentation/swiftui/view/accessibilitylabel(_:)

            HStack {
                Button(action: {
                    counter += 1
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                        Text("Add Item")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(color)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                // 👇 ADD YOUR ACCESSIBILITY MODIFIERS HERE


                Text("\(counter)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
                    .frame(width: 60)
                // 👇 ADD ACCESSIBILITY FOR THE COUNTER DISPLAY
                // TODO: Add .accessibilityLabel("Item count")
                // TODO: Add .accessibilityValue("\(counter) items")

            }

            // MARK: - EXERCISE 2: Like Button with State Announcements
            // TODO: Make this button announce its current state to VoiceOver users
            //
            // LEARNING GOAL: Dynamic states need to be announced clearly
            //
            // INSTRUCTIONS:
            // 1. Add .accessibilityLabel(isLiked ? "Unlike" : "Like")
            // 2. Add .accessibilityHint("Double tap to \(isLiked ? "remove like" : "add like")")
            // 3. Add .accessibilityValue(isLiked ? "Liked" : "Not liked")
            //
            // WHY? The button's visual changes (filled heart) won't be seen by VoiceOver users.
            // They need to hear the state change!

            Button(action: {
                isLiked.toggle()
            }) {
                HStack {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.title3)
                    Text(isLiked ? "Liked" : "Like")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(isLiked ? .white : color)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isLiked ? color : Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color, lineWidth: 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            // 👇 ADD YOUR ACCESSIBILITY MODIFIERS HERE


            // MARK: - EXERCISE 3: Image with Description
            // TODO: Provide meaningful descriptions for decorative images
            //
            // LEARNING GOAL: Images need text descriptions for screen readers
            //
            // INSTRUCTIONS:
            // 1. Add .accessibilityLabel("Weather icon") to the image
            // 2. Add .accessibilityHint("Sunny weather, 75 degrees fahrenheit")
            // 3. Group the entire VStack as one element with .accessibilityElement(children: .ignore)
            // 4. Add .accessibilityLabel("Weather display") to the VStack
            // 5. Add .accessibilityValue("Sunny, 75 degrees fahrenheit") to the VStack
            //
            // WHY? This prevents VoiceOver from reading "Weather Icon, Sunny, 75 degrees, Weather Icon"
            // Instead it reads: "Weather display, Sunny, 75 degrees fahrenheit"

            VStack(spacing: 8) {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(color)
                // 👇 ADD ACCESSIBILITY TO THE IMAGE


                Text("Weather Icon")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            // 👇 ADD ACCESSIBILITY GROUPING HERE
            // TODO: .accessibilityElement(children: .ignore)
            // TODO: .accessibilityLabel("Weather display")
            // TODO: .accessibilityValue("Sunny, 75 degrees fahrenheit")


            // MARK: - EXERCISE 4: Slider with Custom Value Announcements
            // TODO: Make the slider announce its value in a user-friendly way
            //
            // LEARNING GOAL: Sliders need custom accessibility values and hints
            //
            // INSTRUCTIONS:
            // 1. Add .accessibilityLabel("Volume slider") to the Slider
            // 2. Add .accessibilityValue("\(Int(sliderValue)) percent")
            // 3. Add .accessibilityHint("Swipe up or down to adjust volume")
            // 4. Add .accessibilityHidden(true) to the percentage Text below
            //
            // WHY? The slider's visual value won't be read. You need to announce it!
            // Also, hiding redundant text prevents double-reading: "50 percent... 50 percent"

            VStack(alignment: .leading, spacing: 8) {
                Text("Volume")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Slider(value: $sliderValue, in: 0...100)
                    .tint(color)
                // 👇 ADD SLIDER ACCESSIBILITY HERE


                Text("\(Int(sliderValue))%")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                // 👇 HIDE THIS REDUNDANT TEXT FROM VOICEOVER
                // TODO: .accessibilityHidden(true)

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

 1. ACCESSIBILITY LABEL (.accessibilityLabel)
    - Describes WHAT the element is
    - Replaces the default label
    - Example: "Add item button" instead of "Plus circle fill Add Item"

 2. ACCESSIBILITY HINT (.accessibilityHint)
    - Describes HOW to use the element
    - Should start with a verb
    - Example: "Double tap to add an item to the counter"

 3. ACCESSIBILITY VALUE (.accessibilityValue)
    - Describes the CURRENT STATE or VALUE
    - Updates dynamically
    - Example: "Current count: 5 items"

 4. ACCESSIBILITY HIDDEN (.accessibilityHidden)
    - Hides redundant or decorative elements from VoiceOver
    - Use when visual info is already conveyed elsewhere

 5. ACCESSIBILITY ELEMENT GROUPING (.accessibilityElement(children:))
    - Combine multiple views into a single VoiceOver element
    - Prevents fragmented reading
    - Use .ignore to ignore all child elements

 TESTING YOUR IMPLEMENTATION:
 1. Enable VoiceOver: Settings → Accessibility → VoiceOver → ON
 2. Or triple-click the side button (if configured)
 3. Swipe right/left to navigate between elements
 4. Double-tap to activate buttons
 5. Swipe up/down on sliders to adjust values

 BEST PRACTICES:
 - Keep labels concise (1-3 words)
 - Make hints action-oriented
 - Update values dynamically for changing states
 - Test with VoiceOver ON
 - Don't repeat information (e.g., don't say "Button" in your label)

 APPLE RESOURCES:
 - Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/accessibility
 - VoiceOver Documentation: https://developer.apple.com/documentation/accessibility/voiceover
 - Accessibility Inspector: Xcode → Open Developer Tool → Accessibility Inspector
 */

#Preview {
    VoiceOverTestView(color: .blue)
}
