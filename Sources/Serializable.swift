//
//  Serializable.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/2/17.
//

import Foundation

/// A simple type that can be serialized as a single value.
///
/// - SeeAlso: `RawRepresentable`
public protocol Serializable {
    /// The underlying that can be used to represent all values of the
    /// conforming type.
    associatedtype Scalar: SerializationScalar

    /// Express `self` as a serialization type.
    var serialized: Scalar { get }

    /// Create an instance from a `serialized` value.
    init?(_ serialized: Scalar)
}

/// A type that can be serialized by its properties according to named keys.
public protocol KeyedSerializable {
    /// Writes properties through repeated calls to `encoder.encode(_:)`.
    func encode(into encoder: KeyedEncoder)

    /// Creates an instance by reading properties through repeated calls to
    /// `decoder.decode(_:forKey:)`.
    init(from decoder: KeyedDecoder) throws
}

/// A type that can be serialized by its properties according to the order of
/// methods issued to the coder.
public protocol SequentialSerializable {
    /// Writes properties through repeated calls to `encoder.encode(_:)`.
    func encode(into encoder: SequentialEncoder)

    /// Creates an instance by reading properties through repeated calls to
    /// `decoder.decode(_:forKey:)`.
    init(from decoder: SequentialDecoder) throws
}
