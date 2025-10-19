//
//  AudioDescriptionsTestView.swift
//  AccessibilityTest
//
//  Feature: Audio Descriptions Support
//  Learn how to provide narrated descriptions of visual content
//

import SwiftUI
import AVKit

struct AudioDescriptionsTestView: View {
    let color: Color
    @State private var player: AVPlayer?

    var body: some View {
        VStack(spacing: 16) {
            Text("Audio Descriptions narrate important visual information for blind and low-vision users during natural pauses in dialog.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 1: Video Player with Audio Descriptions
            // TODO: Learn how AVKit handles audio descriptions
            //
            // LEARNING GOAL: AVPlayer automatically detects and plays audio description tracks
            //
            // HOW IT WORKS:
            // 1. User enables: Settings → Accessibility → Audio Descriptions
            // 2. Your video must include an audio description track
            // 3. AVPlayer automatically selects it when available
            //
            // The system handles everything - you just provide the content!

            if let player = player {
                VideoPlayer(player: player)
                    .aspectRatio(16/9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.secondary.opacity(0.2))
                    .aspectRatio(16/9, contentMode: .fit)
                    .overlay(
                        ProgressView()
                    )
            }

            // MARK: - EXERCISE 2: What Gets Described
            // TODO: Learn what audio descriptions should include

            VStack(alignment: .leading, spacing: 12) {
                Text("What to Describe")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Label("Characters - Who appears on screen", systemImage: "person.fill")
                        .font(.caption)

                    Label("Actions - What people are doing", systemImage: "figure.walk")
                        .font(.caption)

                    Label("Settings - Location and environment", systemImage: "location.fill")
                        .font(.caption)

                    Label("On-screen text - Important text/graphics", systemImage: "text.viewfinder")
                        .font(.caption)

                    Label("Expressions - Emotions and reactions", systemImage: "face.smiling")
                        .font(.caption)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 3: Adding Audio Descriptions
            // TODO: Learn how to create and add audio description tracks

            VStack(alignment: .leading, spacing: 8) {
                Text("How to Add Audio Descriptions")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("1. Create a script describing visual elements\n2. Record narration in natural pauses\n3. Mix with original audio\n4. Add as alternate audio track in your video\n5. Mark track with 'describesVideoForAccessibility' characteristic")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // Example of good description
            VStack(alignment: .leading, spacing: 8) {
                Text("Example Description")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("Visual: Person walks into sunny room\n\nAudio Description: \"Sarah enters a bright kitchen. Morning sunlight streams through the window. She smiles.\"")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .background(Color.green.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
        .background(Color.secondary.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .onAppear {
            setupPlayer()
        }
    }

    // MARK: - EXERCISE 4: Setup Player with Audio Descriptions
    // TODO: Load video and select audio description track if available
    //
    // AVPlayer can automatically detect audio description tracks

    func setupPlayer() {
        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8") else {
            return
        }

        player = AVPlayer(url: url)

        // OPTIONAL: Programmatically enable audio descriptions
        // Usually not needed - system preferences handle this
        //
        // if let player = player {
        //     let group = player.currentItem?.asset.mediaSelectionGroup(forMediaCharacteristic: .audible)
        //     if let group = group {
        //         // Find audio description track
        //         let options = group.options.filter { option in
        //             option.hasMediaCharacteristic(.describesVideoForAccessibility)
        //         }
        //         if let audioDescriptionOption = options.first {
        //             player.currentItem?.select(audioDescriptionOption, in: group)
        //         }
        //     }
        // }
    }
}

// MARK: - 📚 Learning Resources
/*
 KEY CONCEPTS:

 1. WHAT ARE AUDIO DESCRIPTIONS?
    - Narrated descriptions of visual content
    - Spoken during natural pauses in dialog
    - Help blind and low-vision users understand visual storytelling
    - Describe actions, settings, costumes, gestures, and scene changes

 2. WHEN TO USE AUDIO DESCRIPTIONS
    ✅ Movies and TV shows
    ✅ Educational videos
    ✅ Training materials
    ✅ Promotional videos
    ✅ Any content where visuals convey important information

 3. WHAT TO DESCRIBE
    Essential visual information:
    - Who is on screen
    - What they're doing
    - Where they are
    - Relevant on-screen text
    - Facial expressions and body language
    - Scene changes and transitions

    What NOT to describe:
    - Information already in the dialog
    - Obvious sounds (if they're clear)
    - Every tiny detail
    - Personal interpretation

 4. DESCRIPTION BEST PRACTICES
    ✅ Be objective and factual
    ✅ Use present tense ("Sarah walks" not "Sarah walked")
    ✅ Be concise - fit in natural pauses
    ✅ Describe race, age, and appearance when relevant
    ✅ Match the tone of the content
    ✅ Describe text that appears on screen
    ❌ Don't interpret or add commentary
    ❌ Don't speak over dialog
    ❌ Don't use jargon or complex terms
    ❌ Don't make assumptions about what's "obvious"

 5. TECHNICAL IMPLEMENTATION
    For HLS streams:
    - Add alternate audio track to m3u8
    - Mark with CHARACTERISTICS="public.accessibility.describes-video"

    Example:
    #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio",NAME="English AD",
    LANGUAGE="en",CHARACTERISTICS="public.accessibility.describes-video",
    URI="audio-description.m3u8"

    For MP4:
    - Include alternate audio track in container
    - Set accessibility characteristic flag

 6. AVPLAYER AUTOMATIC SUPPORT
    ✅ Detects audio description tracks automatically
    ✅ Enables them based on system settings
    ✅ No code needed if media is properly formatted
    ✅ Users control via Settings → Accessibility → Audio Descriptions

 7. CREATING AUDIO DESCRIPTIONS
    Process:
    1. Watch content and note visual elements
    2. Write descriptions for natural pauses
    3. Record narration (professional voice recommended)
    4. Mix with original audio (don't overlap dialog)
    5. Add as alternate audio track
    6. Test with visually impaired users

    Tools:
    - Professional services (Rev, 3Play Media)
    - DIY tools (Audacity for recording/mixing)
    - Scripts can be written in advance

 TESTING YOUR IMPLEMENTATION:
 1. Enable Audio Descriptions: Settings → Accessibility → Audio Descriptions
 2. Play your video
 3. Verify audio description track is selected
 4. Check that descriptions:
    - Play during appropriate pauses
    - Don't overlap dialog
    - Provide useful information
    - Match the content's tone

 ACCESSIBILITY STANDARDS:
 - WCAG 2.1 Level AA requires audio descriptions for prerecorded video
 - FCC requires descriptions for certain TV programs
 - Many countries have legal requirements for video accessibility

 APPLE RESOURCES:
 - AVFoundation Documentation: https://developer.apple.com/documentation/avfoundation
 - HLS Authoring Specification: https://developer.apple.com/documentation/http_live_streaming
 - Accessibility Guidelines: https://developer.apple.com/design/human-interface-guidelines/accessibility
 - Audio Description Coalition: Best practices and standards
 */

#Preview {
    AudioDescriptionsTestView(color: .teal)
}
