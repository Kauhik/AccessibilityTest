//
//  CaptionsTestView.swift
//  AccessibilityTest
//
//  Feature: Closed Captions Support
//  Learn how to provide captions for video and audio content
//

import SwiftUI
import AVKit

struct CaptionsTestView: View {
    let color: Color
    @State private var player: AVPlayer?

    var body: some View {
        VStack(spacing: 16) {
            Text("Captions provide text for dialog and important sounds. System video players support captions automatically!")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 1: Video Player with Captions
            // TODO: The VideoPlayer below already supports captions!
            //
            // LEARNING GOAL: AVKit automatically handles caption selection
            //
            // HOW IT WORKS:
            // 1. User enables captions in Settings → Accessibility → Subtitles & Captioning
            // 2. Your video must include caption tracks (WebVTT, SRT, or embedded in HLS)
            // 3. AVPlayer automatically selects and displays them
            //
            // NO CODE NEEDED for basic caption support!

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

            // MARK: - EXERCISE 2: What Captions Include
            // TODO: Learn what should be captioned

            VStack(alignment: .leading, spacing: 12) {
                Text("Caption Content")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Label("Dialog - All spoken words", systemImage: "text.bubble.fill")
                        .font(.caption)

                    Label("Sound effects - [Door slams]", systemImage: "speaker.wave.2.fill")
                        .font(.caption)

                    Label("Music - [Suspenseful music playing]", systemImage: "music.note")
                        .font(.caption)

                    Label("Speaker identification - JOHN: Hello", systemImage: "person.fill")
                        .font(.caption)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            // MARK: - EXERCISE 3: Adding Captions to Your Videos
            // TODO: Learn how to add caption tracks

            VStack(alignment: .leading, spacing: 8) {
                Text("How to Add Captions")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("For HLS streams: Include WebVTT caption tracks in your m3u8 playlist\n\nFor local videos: Embed captions in MP4 or provide external WebVTT files\n\nApple automatically detects and offers them to users!")
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
        .onAppear {
            setupPlayer()
        }
    }

    // MARK: - EXERCISE 4: Setup Video Player
    // TODO: Load a video with caption tracks
    //
    // This example uses Apple's sample HLS stream with built-in captions
    // In production, ensure your videos include caption tracks

    func setupPlayer() {
        // Apple's demo HLS stream with captions
        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8") else {
            return
        }

        player = AVPlayer(url: url)

        // OPTIONAL: Programmatically select caption track
        // Usually not needed - system settings handle this automatically
        //
        // if let player = player {
        //     let group = player.currentItem?.asset.mediaSelectionGroup(forMediaCharacteristic: .legible)
        //     if let group = group {
        //         let options = AVMediaSelectionGroup.mediaSelectionOptions(from: group.options, with: Locale.current)
        //         if let option = options.first {
        //             player.currentItem?.select(option, in: group)
        //         }
        //     }
        // }
    }
}

// MARK: - 📚 Learning Resources
/*
 KEY CONCEPTS:

 1. WHAT ARE CAPTIONS?
    - Text representation of dialog and sounds
    - Synchronized with video timing
    - Help deaf/hard-of-hearing users
    - Also useful in noisy environments or when audio is off

 2. CAPTIONS VS. SUBTITLES
    Captions:
    - Include dialog + sound effects
    - For accessibility (deaf/hard-of-hearing)
    - Example: "[Thunder rumbling] Hello there!"

    Subtitles:
    - Only dialog, usually for translation
    - Example: "Hello there!" (in another language)

 3. CAPTION FORMATS
    - WebVTT (.vtt) - Web standard, most common
    - SRT (.srt) - Simple subtitle format
    - Embedded in HLS streams (m3u8 playlists)
    - CEA-608/708 - Broadcast standard

 4. AVKIT AUTOMATIC SUPPORT
    ✅ AVPlayer + VideoPlayer = Automatic caption support
    ✅ System settings control caption display
    ✅ Users can customize caption appearance
    ✅ No code needed if your media includes captions

 5. ADDING CAPTIONS TO YOUR CONTENT
    For HLS (recommended):
    - Add WEBVTT tracks to your m3u8 playlist
    - Mark tracks with TYPE=SUBTITLES or TYPE=CAPTIONS

    For MP4:
    - Embed caption tracks in the MP4 file
    - Or provide external .vtt files

    Example m3u8:
    #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="English",
    LANGUAGE="en",URI="en.vtt"

 6. CAPTION BEST PRACTICES
    ✅ Include all spoken dialog
    ✅ Describe important sound effects [door slams]
    ✅ Identify speakers (JOHN: Hello)
    ✅ Note music and tone [suspenseful music]
    ✅ Match timing precisely to audio
    ✅ Keep lines short (32-40 characters max)
    ❌ Don't caption every tiny sound
    ❌ Don't use all caps (harder to read)
    ❌ Don't leave captions on screen too briefly

 TESTING YOUR IMPLEMENTATION:
 1. Enable captions: Settings → Accessibility → Subtitles & Captioning → Closed Captions + SDH
 2. Customize appearance: Style → Create New Style
 3. Play your video - captions should appear automatically
 4. Check timing, accuracy, and readability

 TOOLS FOR CREATING CAPTIONS:
 - Rev.com - Professional captioning service
 - YouTube Auto-captions - Free but needs editing
 - Descript - AI-powered transcription
 - Subtitle Edit - Free caption editing software

 APPLE RESOURCES:
 - AVFoundation Guide: https://developer.apple.com/documentation/avfoundation
 - HLS Authoring: https://developer.apple.com/documentation/http_live_streaming
 - Accessibility Guidelines: https://developer.apple.com/design/human-interface-guidelines/accessibility
 */

#Preview {
    CaptionsTestView(color: .cyan)
}
