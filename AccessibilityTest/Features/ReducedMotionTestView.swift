//
//  ReducedMotionTestView.swift
//  AccessibilityTest
//
//  Feature: Reduced Motion Support
//  Learn how to support users with motion sensitivity and vestibular disorders
//

import SwiftUI

struct ReducedMotionTestView: View {
    let color: Color
    @State private var isAnimating = false

    // MARK: - EXERCISE: Access the Reduced Motion Setting
    // TODO: Uncomment to detect if Reduce Motion is enabled
    //
    // INSTRUCTIONS:
    // Uncomment: @Environment(\.accessibilityReduceMotion) var reduceMotion
    //
    // WHY? Animations can cause nausea, dizziness, or discomfort for some users
    // When true, disable or minimize animations
    //
    // REFERENCE: https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityreducemotion

    // @Environment(\.accessibilityReduceMotion) var reduceMotion

    var body: some View {
        VStack(spacing: 16) {
            Text("Go to Settings > Accessibility > Motion > Reduce Motion to see animations change or disappear.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // MARK: - EXERCISE 1: Disable Spring Animations
            // TODO: Replace bouncy animations with instant updates when reduceMotion is true
            //
            // PATTERN: .animation(reduceMotion ? .none : .spring(), value: state)

            Button("Toggle Animation") {
                isAnimating.toggle()
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Circle()
                .fill(color)
                .frame(width: isAnimating ? 80 : 40, height: isAnimating ? 80 : 40)
            // TODO: Add conditional animation
            // .animation(reduceMotion ? .none : .spring(duration: 0.6), value: isAnimating)

            // MARK: - EXERCISE 2: Replace Continuous Animations
            // TODO: Stop infinite animations when Reduce Motion is ON
            //
            // PROBLEM: Spinning loading indicators can cause motion sickness
            // SOLUTION: Use a static indicator instead

            VStack(spacing: 12) {
                Text("Loading Indicator")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                // TODO: Show ProgressView (static) when reduceMotion is true
                // Otherwise show rotating animation
                //
                // if reduceMotion {
                //     ProgressView()
                //         .progressViewStyle(.circular)
                // } else {
                //     Image(systemName: "arrow.triangle.2.circlepath")
                //         .font(.largeTitle)
                //         .foregroundStyle(color)
                //         .rotationEffect(.degrees(isAnimating ? 360 : 0))
                //         .animation(.linear(duration: 1.0).repeatForever(autoreverses: false), value: isAnimating)
                // }

                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.largeTitle)
                    .foregroundStyle(color)
            }
            .padding()
            .background(Color.secondary.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onAppear {
                isAnimating = true
            }

            // MARK: - EXERCISE 3: Crossfade Instead of Slide
            // TODO: Replace sliding transitions with opacity fades
            //
            // PATTERN:
            // .transition(reduceMotion ? .opacity : .slide)

            VStack(alignment: .leading, spacing: 8) {
                Text("Pro Tip: Alternative Transitions")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Text("Replace:\n• Slides with fades\n• Bounces with instant changes\n• Infinite rotations with static icons\n• Parallax scrolling with standard scrolling")
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

 1. WHO THIS HELPS
    - Users with vestibular disorders (balance/inner ear issues)
    - People prone to motion sickness
    - Users with attention disorders who find animations distracting
    - Anyone working in motion-sensitive environments

 2. WHAT TO DISABLE/REPLACE
    ❌ Spring/bounce animations → ✅ Instant updates
    ❌ Continuous rotations → ✅ Static icons
    ❌ Parallax scrolling → ✅ Standard scrolling
    ❌ Slide transitions → ✅ Opacity fades
    ❌ Scaling animations → ✅ Instant size changes

 3. IMPLEMENTATION PATTERNS
    // Conditional animation
    .animation(reduceMotion ? .none : .spring(), value: state)

    // Conditional transition
    .transition(reduceMotion ? .identity : .slide)

    // Conditional view
    if reduceMotion {
        StaticView()
    } else {
        AnimatedView()
    }

 4. BEST PRACTICES
    ✅ Provide instant feedback instead of animated feedback
    ✅ Use opacity fades instead of position-based animations
    ✅ Replace continuous animations with static alternatives
    ✅ Test with Reduce Motion ON
    ❌ Don't remove all visual feedback - just the motion
    ❌ Don't make the experience feel broken or incomplete

 APPLE RESOURCES:
 - Motion Guidelines: https://developer.apple.com/design/human-interface-guidelines/motion
 - Reduce Motion: https://support.apple.com/guide/iphone/reduce-screen-motion-iph23f48c6a5/ios
 */

#Preview {
    ReducedMotionTestView(color: .mint)
}
