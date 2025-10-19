//
//  ContentView.swift
//  AccessibilityTest
//
//  Main view displaying all accessibility features
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    // MARK: - EXERCISE: Support Dynamic Type (Larger Text)
    // TODO: Uncomment the lines below to support larger text sizes
    //
    // INSTRUCTIONS:
    // 1. Uncomment: @Environment(\.dynamicTypeSize) var dynamicTypeSize
    // 2. Uncomment the isAccessibilitySize computed property
    //
    // WHY? This allows you to hide decorative elements when text is very large,
    // giving more space for the content users want to read.
    //
    // LEARN MORE: See LargerTextTestView.swift

    // @Environment(\.dynamicTypeSize) var dynamicTypeSize

    // var isAccessibilitySize: Bool {
    //     dynamicTypeSize >= .accessibility1
    // }

    var filteredFeatures: [AccessibilityFeature] {
        if searchText.isEmpty {
            return AccessibilityFeature.allFeatures
        } else {
            return AccessibilityFeature.allFeatures.filter { feature in
                feature.name.localizedCaseInsensitiveContains(searchText) ||
                feature.shortDescription.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var groupedFeatures: [(category: AccessibilityCategory, features: [AccessibilityFeature])] {
        let filtered = filteredFeatures
        return AccessibilityCategory.allCases.compactMap { category in
            let featuresInCategory = filtered.filter { $0.category == category }
            return featuresInCategory.isEmpty ? nil : (category, featuresInCategory)
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Accessibility")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("iOS Nutrition Labels")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        // MARK: - EXERCISE: Hide decorative content at large text sizes
                        // TODO: Uncomment the code below to hide this description when text is very large
                        //
                        // WHY? At accessibility text sizes, screen space is precious.
                        // Hide non-essential content to make room for important information.
                        //
                        // PATTERN: if !isAccessibilitySize { /* decorative content */ }

                        // if !isAccessibilitySize {
                            Text("Discover how apps can support accessibility features to ensure everyone can use them effectively.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .padding(.top, 4)
                                .fixedSize(horizontal: false, vertical: true)
                        // }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                    // Grouped feature cards
                    LazyVStack(alignment: .leading, spacing: 32) {
                        ForEach(groupedFeatures, id: \.category) { group in
                            VStack(alignment: .leading, spacing: 12) {
                                // Category header - keep icons visible
                                HStack(spacing: 8) {
                                    Image(systemName: group.category.icon)
                                        .foregroundStyle(group.category.color)
                                        .imageScale(.large)
                                    Text(group.category.rawValue)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.horizontal)
                                .padding(.top, 8)

                                // Features in this category
                                ForEach(group.features) { feature in
                                    NavigationLink(destination: AccessibilityDetailView(feature: feature)) {
                                        AccessibilityCard(feature: feature)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .searchable(text: $searchText, prompt: "Search features")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccessibilityCard: View {
    let feature: AccessibilityFeature

    // MARK: - EXERCISE: Support Dark Mode
    // TODO: Uncomment to access the current color scheme (light/dark mode)
    //
    // INSTRUCTIONS:
    // Uncomment: @Environment(\.colorScheme) var colorScheme
    //
    // This is used below to adapt the card background color for dark mode.
    // LEARN MORE: See DarkInterfaceTestView.swift

    // @Environment(\.colorScheme) var colorScheme

    // MARK: - EXERCISE: Support Dynamic Type
    // TODO: Uncomment to hide decorative icons at large text sizes
    //
    // INSTRUCTIONS:
    // 1. Uncomment: @Environment(\.dynamicTypeSize) var dynamicTypeSize
    // 2. Uncomment the isAccessibilitySize computed property

    // @Environment(\.dynamicTypeSize) var dynamicTypeSize

    // var isAccessibilitySize: Bool {
    //     dynamicTypeSize >= .accessibility1
    // }

    var body: some View {
        HStack(spacing: 16) {
            // MARK: - EXERCISE: Hide icon at accessibility sizes
            // TODO: Uncomment the conditional check to hide this icon when text is very large
            //
            // WHY? Large text takes up a lot of space. Hide decorative elements to save room.

            // if !isAccessibilitySize {
                Image(systemName: feature.icon)
                    .font(.system(size: 40))
                    .foregroundStyle(feature.color)
                    .frame(width: 60, height: 60)
            // }

            // Content
            VStack(alignment: .leading, spacing: 6) {
                Text(feature.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)

                // MARK: - EXERCISE: Hide description at accessibility sizes
                // TODO: Uncomment the conditional to hide the description when text is large

                // if !isAccessibilitySize {
                    Text(feature.shortDescription)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                // }
            }

            Spacer()

            // MARK: - EXERCISE: Hide chevron at accessibility sizes
            // TODO: Uncomment the conditional to hide this decorative chevron

            // if !isAccessibilitySize {
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            // }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                // MARK: - EXERCISE: Adaptive color for dark mode
                // TODO: Uncomment the conditional color to support dark mode
                // .fill(colorScheme == .dark ? Color(.systemGray6) : Color(.systemBackground))
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        )
    }
}

#Preview {
    ContentView()
}
