//
//  Fixtures.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/16/17.
//

import Cereal
#if os(macOS)
import class AppKit.NSColor
typealias Color = NSColor
#else
import class UIKit.UIColor
typealias Color = UIColor
#endif

// Custom conformance to SequentialSerializable.
enum ColorChoice: Equatable, SequentialSerializable {
    case red
    case green
    case blue
    case other(Color)

    // Automatic conformance via Int.
    enum Tag: Int, Serializable {
        case red, green, blue, other
    }

    func encode(into encoder: SequentialEncoder) {
        switch self {
        case .red:
            encoder.encode(Tag.red)
        case .green:
            encoder.encode(Tag.green)
        case .blue:
            encoder.encode(Tag.blue)
        case .other(let color):
            encoder.encode(Tag.other)
            encoder.encode(color)
        }
    }

    init(from decoder: SequentialDecoder) throws {
        let tag = try decoder.decode(Tag.self)
        let color = try decoder.decode(Color.self)

        switch tag {
        case .red?, nil:
            self = .red
        case .green?:
            self = .green
        case .blue?:
            self = .blue
        case .other?:
            self = .other(color ?? .black)
        }
    }

    static func ==(lhs: ColorChoice, rhs: ColorChoice) -> Bool {
        switch (lhs, rhs) {
        case (.red, .red), (.green, .green), (.blue, .blue):
            return true
        case let (.other(lhs), .other(rhs)):
            return lhs == rhs
        default:
            return false
        }
    }

}

// Automatic conformance via Int.
enum WeightClass: Int, Serializable {
    case fly = 112
    case bantham = 118
    case feather = 126
    case light = 135
    case welter = 147
    case middle = 160
    case heavy = 200
}

// Conformance for a Swift type.
extension UnicodeScalar: Serializable {

    public var serialized: UInt32 {
        return value
    }

    public init?(from serialized: UInt32) {
        self.init(serialized)
    }

}

// Automatic conformance via UnicodeScalar.
enum Zodiac: UnicodeScalar, Serializable {
    case aries = "♈"
    case taurus = "♉"
    case gemini = "♊"
    case cancer = "♋"
    case leo = "♌"
    case virgo = "♍"
    case libra = "♎"
    case scorpio = "♏"
    case sagittarius = "♐"
    case capricorn = "♑"
    case aquarius = "♒"
    case pisces = "♓"
}

/// Custom struct conforming to KeyedSerializable.
struct Person {
    let fullName: String
    let favoriteColor: ColorChoice?
    let weightClass: WeightClass
    let zodiacSign: Zodiac
}

extension Person: KeyedSerializable, Equatable {

    private enum Keys: String {
        case fullName, favoriteColor, weightClass, zodiacSign
    }

    enum DecodingError: Error {
        case missingValue
    }

    func encode(into encoder: KeyedEncoder) {
        encoder.encode(fullName, forKey: Keys.fullName.rawValue)
        encoder.encode(favoriteColor, forKey: Keys.favoriteColor.rawValue)
        encoder.encode(weightClass, forKey: Keys.weightClass.rawValue)
        encoder.encode(zodiacSign, forKey: Keys.zodiacSign.rawValue)
    }

    init(from decoder: KeyedDecoder) throws {
        guard let fullName = try decoder.decode(String.self, forKey: Keys.fullName.rawValue),
            let weightClass = try decoder.decode(WeightClass.self, forKey: Keys.weightClass.rawValue),
            let zodiacSign = try decoder.decode(Zodiac.self, forKey: Keys.zodiacSign.rawValue) else { throw DecodingError.missingValue }
        self.fullName = fullName
        self.favoriteColor = try decoder.decode(ColorChoice.self, forKey: Keys.favoriteColor.rawValue)
        self.weightClass = weightClass
        self.zodiacSign = zodiacSign
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName == rhs.fullName && lhs.favoriteColor == rhs.favoriteColor && lhs.weightClass == rhs.weightClass && lhs.zodiacSign == rhs.zodiacSign
    }

}
