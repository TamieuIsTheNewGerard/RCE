//
//  Theme.swift
//  RCE
//
//  Created for the RCE project.
//

import SwiftData
import SwiftUI

/// Represents a theme for conferences, with a name and a color.
@Model
final class Theme {
    var name: String
    var color: CodableColor

    /// Relationship: A theme can have multiple conferences.
    @Relationship(deleteRule: .nullify, inverse: \Conference.theme)
    var conferences: [Conference] = []

    init(name: String, color: Color) {
        self.name = name
        self.color = CodableColor(color)
    }
}

/// A wrapper to store `Color` in SwiftData.
struct CodableColor: Codable, Hashable {
    let color: Color

    init(_ color: Color) {
        self.color = color
    }

    /// Codable representation using RGB components.
    private enum CodingKeys: String, CodingKey {
        case red, green, blue, opacity
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let components = color.cgColor?.components ?? [0, 0, 0, 1]
        try container.encode(components[0], forKey: .red)
        try container.encode(components[1], forKey: .green)
        try container.encode(components[2], forKey: .blue)
        try container.encode(components[3], forKey: .opacity)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(Double.self, forKey: .red)
        let green = try container.decode(Double.self, forKey: .green)
        let blue = try container.decode(Double.self, forKey: .blue)
        let opacity = try container.decode(Double.self, forKey: .opacity)
        self.color = Color(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
