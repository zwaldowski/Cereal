//
//  SerializationScalar.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/2/17.
//

import struct CoreGraphics.CGFloat
import struct Foundation.Data

/// A common Swift type that serializers will typically have specialization for.
/// This protocol is not meant to be adopted by custom types, and doing so may
/// lead to undefined behavior.
public protocol SerializationScalar {}

extension Int: SerializationScalar {}
extension UInt: SerializationScalar {}
extension CGFloat: SerializationScalar {}
extension Int8: SerializationScalar {}
extension Int16: SerializationScalar {}
extension Int32: SerializationScalar {}
extension Int64: SerializationScalar {}
extension UInt8: SerializationScalar {}
extension UInt16: SerializationScalar {}
extension UInt32: SerializationScalar {}
extension UInt64: SerializationScalar {}
extension Float: SerializationScalar {}
extension Double: SerializationScalar {}
extension Bool: SerializationScalar {}
extension String: SerializationScalar {}
extension Data: SerializationScalar {}
