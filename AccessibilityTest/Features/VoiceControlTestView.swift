//
//  VoiceControlTestView.swift
//  AccessibilityTest
//
//  Feature: Voice Control Support
//  Learn how users can operate your app entirely by voice commands
//

import SwiftUI

struct VoiceControlTestView: View {
    let color: Color
    @State private var feedback = "Waiting for voice command..."
    @State private var likeCount = 0
    @State private var isToggled = false
    @State private var textInput = ""
    @State private var selectedOption = "Option 1"

    let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        VStack(spacing: 16) {
            // MARK: - Voice Control Instructions
            VStack(alignment: .leading, spacing: 8) {
                Text("Voice Control Commands to Try:")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    Label("\"Show names\" - See button labels", systemImage: "tag")
                    Label("\"Show numbers\" - See item numbers", systemImage: "number")
                    Label("\"Show grid\" - Show precise tap grid", systemImage: "grid")
                    Label("\"Tap [name]\" - Tap any button", systemImage: "hand.tap")
                    Label("\"Type [text]\" - Dictate text", systemImage: "text.cursor")
                }
                .font(.caption2)
                .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))

            // Feedback display
            Text(feedback)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(color)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity)
                .padding()
                .background(color.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 1: Clear Button Labels
            // TODO: Voice Control uses button labels to identify tappable elements
            //
            // LEARNING GOAL: Buttons need clear, concise labels for voice commands
            //
            // WHAT VOICE CONTROL DOES:
            // - Automatically detects all interactive elements
            // - Uses the button's Text() or .accessibilityLabel() for voice commands
            // - Users can say "Tap Like" or "Tap Share" to activate buttons
            //
            // BEST PRACTICES:
            // 1. Use clear, unique button labels (avoid duplicate labels)
            // 2. Keep labels short (1-2 words is ideal)
            // 3. Don't add accessibility labels unless necessary - the Text() is usually enough!
            //
            // INSTRUCTIONS:
            // - These buttons already work well with Voice Control because they have clear Text() labels
            // - Try Voice Control: Say "Tap Like" or "Tap Share" or "Tap Save"
            // - No code changes needed here! This is an example of good design.

            HStack(spacing: 12) {
                Button("Like") {
                    likeCount += 1
                    feedback = "Liked! Count: \(likeCount)"
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Button("Share") {
                    feedback = "Share button activated!"
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Button("Save") {
                    feedback = "Item saved!"
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            // MARK: - EXERCISE 2: Toggle Control
            // TODO: Ensure toggle has a clear label
            //
            // LEARNING GOAL: Toggles need visible labels or accessibility labels
            //
            // INSTRUCTIONS:
            // - This toggle works because it has a visible "Notifications" text label
            // - Voice Control users can say "Tap Notifications" to toggle it
            // - The .labelsHidden() only hides the empty string "", not the HStack label
            //
            // CHALLENGE: What if you needed an icon-only toggle?
            // - You would add .accessibilityLabel("Notifications toggle")
            // - Try it! Comment out the "Notifications" Text and add an accessibility label

            HStack {
                Text("Notifications")
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Toggle("", isOn: $isToggled)
                    .labelsHidden()
                    .onChange(of: isToggled) { _, newValue in
                        feedback = newValue ? "Notifications ON" : "Notifications OFF"
                    }
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))

            // MARK: - EXERCISE 3: Text Input Field
            // TODO: Text fields need clear placeholders or labels
            //
            // LEARNING GOAL: Voice Control can dictate text into fields
            //
            // INSTRUCTIONS:
            // - Voice Control users can say "Tap [field name]" then "Type your message"
            // - The placeholder text "Tap or speak to type" helps identify this field
            // - Try it: Enable Voice Control and say "Tap Tap or speak to type"
            //
            // BEST PRACTICE: Use descriptive placeholders or add accessibility labels

            VStack(alignment: .leading, spacing: 8) {
                Text("Say: \"Type your message\"")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                TextField("Tap or speak to type", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: textInput) { _, newValue in
                        if !newValue.isEmpty {
                            feedback = "Text entered: \(newValue)"
                        }
                    }
            }

            // MARK: - EXERCISE 4: Selection Buttons
            // TODO: Unique labels help Voice Control distinguish between similar buttons
            //
            // LEARNING GOAL: Avoid duplicate button labels
            //
            // INSTRUCTIONS:
            // - These buttons have unique labels: "Option 1", "Option 2", "Option 3"
            // - Voice Control can distinguish them easily
            // - Users say: "Tap Option 1" or "Tap Option 2"
            //
            // BAD EXAMPLE: Three buttons all labeled "Select" - Voice Control can't tell them apart!
            // GOOD EXAMPLE: "Option 1", "Option 2", "Option 3" - Each is unique

            VStack(alignment: .leading, spacing: 8) {
                Text("Choose an option:")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack(spacing: 8) {
                    ForEach(options, id: \.self) { option in
                        Button(option) {
                            selectedOption = option
                            feedback = "Selected: \(option)"
                        }
                        .font(.caption)
                        .foregroundStyle(selectedOption == option ? .white : color)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selectedOption == option ? color : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(color, lineWidth: 1.5)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }

            // MARK: - EXERCISE 5: Action Buttons
            // TODO: These demonstrate good vs. potentially problematic button labeling
            //
            // LEARNING GOAL: Context matters for button labels
            //
            // CURRENT LABELS: "Reset" and "Confirm"
            // - These are unique and clear
            // - Users can easily say "Tap Reset" or "Tap Confirm"
            //
            // CHALLENGE FOR YOU:
            // - What if both buttons said "OK"? Voice Control couldn't distinguish them!
            // - Try changing both labels to "OK" and see what happens with Voice Control
            // - Then fix it by making them unique again

            HStack(spacing: 12) {
                Button("Reset") {
                    likeCount = 0
                    textInput = ""
                    selectedOption = "Option 1"
                    isToggled = false
                    feedback = "Everything reset!"
                }
                .foregroundStyle(color)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Button("Confirm") {
                    feedback = "Action confirmed!"
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .background(Color.secondary.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - 📚 Learning Resources
/*
 KEY CONCEPTS:

 1. VOICE CONTROL BASICS
    - Users control the entire device using only their voice
    - No need for special accessibility modifiers in most cases!
    - Voice Control automatically detects interactive elements

 2. WHAT VOICE CONTROL USES FOR LABELS
    - Visible Text() inside buttons (preferred)
    - .accessibilityLabel() if no visible text exists
    - Placeholder text for TextFields
    - System labels for standard controls

 3. COMMON VOICE COMMANDS
    - "Show names" - Shows labels overlaid on buttons
    - "Show numbers" - Shows numbers next to all tappable elements
    - "Show grid" - Shows a grid for precise tapping
    - "Tap [name]" - Taps a button with that label
    - "Type [text]" - Types text into active field
    - "Swipe up/down/left/right" - Performs gestures

 4. BEST PRACTICES
    ✅ Use clear, concise button labels (1-2 words)
    ✅ Make labels unique within the same screen
    ✅ Prefer visible text over accessibility labels
    ✅ Use descriptive TextField placeholders
    ❌ Avoid duplicate button labels
    ❌ Don't use vague labels like "OK" when multiple exist
    ❌ Don't rely only on icons without labels

 5. WHEN TO USE .accessibilityLabel() FOR VOICE CONTROL
    - Icon-only buttons (add a label like "Settings")
    - Image buttons (add what the image represents)
    - Custom controls without visible text
    - To clarify ambiguous labels

 TESTING YOUR IMPLEMENTATION:
 1. Enable Voice Control: Settings → Accessibility → Voice Control → ON
 2. Say "Show names" to see all button labels
 3. Say "Tap [button name]" to activate buttons
 4. Say "Show grid" for precise tapping
 5. Say "Type hello world" when a text field is focused

 COMMON ISSUES & SOLUTIONS:
 ❌ Voice Control can't distinguish between buttons
    ✅ Solution: Give each button a unique label

 ❌ Voice Control doesn't recognize a button
    ✅ Solution: Add .accessibilityLabel("Button name")

 ❌ Icon-only buttons aren't accessible
    ✅ Solution: Add descriptive accessibility labels

 APPLE RESOURCES:
 - Voice Control Guide: https://support.apple.com/guide/iphone/voice-control-iph2c21a3c88/ios
 - Accessibility Documentation: https://developer.apple.com/documentation/accessibility
 - WWDC Sessions: Search for "Voice Control" on developer.apple.com
 */

#Preview {
    VoiceControlTestView(color: .purple)
}
