//
//  SerializableConformances.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/16/17.
//

import Foundation

extension RawRepresentable where RawValue: SerializationScalar {

    /// Express `self` as a serialization type.
    public var serialized: RawValue {
        return rawValue
    }

    /// Create an instance from a `serialized` value.
    public init?(_ serialized: RawValue) {
        self.init(rawValue: serialized)
    }

}

extension RawRepresentable where RawValue: Serializable {

    /// Express `self` as a serialization type.
    public var serialized: RawValue.Scalar {
        return rawValue.serialized
    }

    /// Create an instance from a `serialized` value.
    public init?(_ serialized: RawValue.Scalar) {
        guard let rawValue = RawValue(serialized) else { return nil }
        self.init(rawValue: rawValue)
    }
    
}

extension LosslessStringConvertible {

    /// Express `self` as a serialization type.
    public var serialized: String {
        return String(describing: self)
    }

}

extension Date: Serializable {

    public var serialized: Double {
        return timeIntervalSinceReferenceDate
    }

    public init?(_ serialized: Double) {
        self.init(timeIntervalSinceReferenceDate: serialized)
    }
    
}
