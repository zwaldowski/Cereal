//
//  KeyedCoder.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/2/17.
//

import Foundation

public protocol KeyedEncoder {
    /// Serializes `value` and associates it with `key`.
    func encode<Value: SerializationScalar>(_ value: Value?, forKey key: String)
    /// Serializes `value` and associates it with `key`.
    func encode<Value: Serializable>(_ value: Value?, forKey key: String)
    /// Serializes `value` and associates it with `key`.
    func encode<Value: SequentialSerializable>(_ value: Value?, forKey key: String)
    /// Serializes `value` and associates it with `key`.
    func encode<Value: KeyedSerializable>(_ value: Value?, forKey key: String)
    /// Serializes `value` and associates it with `key`.
    func encode<Value: SequentialSerializable & KeyedSerializable>(_ value: Value?, forKey key: String)

    /// Serializes `values` and associates them with `key`.
    func encode<Value: SerializationScalar>(_ values: [Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: Serializable>(_ values: [Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: SequentialSerializable>(_ values: [Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: KeyedSerializable>(_ values: [Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: SequentialSerializable & KeyedSerializable>(_ values: [Value]?, forKey key: String)

    /// Serializes `values` and associates them with `key`.
    func encode<Value: SerializationScalar>(_ values: Set<Value>?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: Serializable>(_ values: Set<Value>?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: SequentialSerializable>(_ values: Set<Value>?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: KeyedSerializable>(_ values: Set<Value>?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Value: SequentialSerializable & KeyedSerializable>(_ values: Set<Value>?, forKey key: String)

    /// Serializes `values` and associates them with `key`.
    func encode<Key: SerializationScalar, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: Serializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: KeyedSerializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable & KeyedSerializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SerializationScalar, Value: Serializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: Serializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: KeyedSerializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable & KeyedSerializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SerializationScalar, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: Serializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: KeyedSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SerializationScalar, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: Serializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: KeyedSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable & KeyedSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SerializationScalar, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: Serializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)
    /// Serializes `values` and associates them with `key`.
    func encode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String)

    /// Serializes `value` using Cocoa archival and associates it with `key`.
    func encode<Value: NSCoding>(_ value: Value?, forKey key: String)
    /// Serializes `values` using Cocoa archival and associates them with `key`.
    func encode<Value: NSCoding>(_ values: [Value]?, forKey key: String)
    /// Serializes `values` using Cocoa archival and associates them with `key`.
    func encode<Value: NSCoding>(_ values: Set<Value>?, forKey key: String)
    /// Serializes `values` using Cocoa archival and associates them with `key`.
    func encode<Key: NSCoding, Value: NSCoding>(_ values: [Key: Value]?, forKey key: String)
}

extension KeyedEncoder {

    /// Serializes `value` and associates it with `key`.
    public func encode<Value: Serializable>(_ value: Value?, forKey key: String) {
        encode(value?.serialized, forKey: key)
    }

    /// Serializes `value` using Cocoa archival and associates it with `key`.
    public func encode<Value: NSCoding>(_ value: Value?, forKey key: String) {
        encode(value.map(NSKeyedArchiver.archivedData), forKey: key)
    }

    private func encode<Array: Sequence>(elementsFrom array: Array?, forKey key: String, by eachElement: (Array.Iterator.Element, String) -> Void) {
        guard let array = array else { return }
        for (i, value) in array.enumerated() {
            eachElement(value, "C.values.\(i)")
        }
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Array: Sequence, Value: SerializationScalar>(_ values: Array?, forKey key: String) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Array: Sequence, Value: Serializable>(_ values: Array?, forKey key: String) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Array: Sequence, Value: SequentialSerializable>(_ values: Array?, forKey key: String) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Array: Sequence, Value: KeyedSerializable>(_ values: Array?, forKey key: String) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Array: Sequence, Value: SequentialSerializable & KeyedSerializable>(_ values: Array?, forKey key: String) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    /// Serializes `values` using Cocoa archival and associates them with `key`.
    public func encode<Value: NSCoding>(_ values: [Value]?, forKey key: String) {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    /// Serializes `values` using Cocoa archival and associates them with `key`.
    public func encode<Value: NSCoding>(_ values: Set<Value>?, forKey key: String) {
        encode(elementsFrom: values, forKey: key, by: encode)
    }

    private func encode<Key: Hashable, Value>(elementsFrom dictionary: [Key: Value]?, byKey eachKey: (Key, String) -> Void, byValue eachValue: (Value, String) -> Void) {
        guard let dictionary = dictionary else { return }
        for (i, pair) in dictionary.enumerated() {
            eachKey(pair.key, "C.keys.\(i)")
            eachValue(pair.value, "C.values.\(i)")
        }
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SerializationScalar, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: Serializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: KeyedSerializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: SerializationScalar>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SerializationScalar, Value: Serializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: Serializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: KeyedSerializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: Serializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SerializationScalar, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: Serializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: KeyedSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SerializationScalar, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: Serializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: KeyedSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SerializationScalar, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: Serializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` and associates them with `key`.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` using Cocoa archival and associates them with `key`.
    public func encode<Key: NSCoding, Value: NSCoding>(_ values: [Key: Value]?, forKey key: String) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

}

public protocol KeyedDecoder {
    /// Whether the coder contains a value for `key` in the current scope.
    func hasValue(forKey key: String) -> Bool

    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SerializationScalar>(_ type: Value.Type, forKey key: String) throws -> Value?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: Serializable>(_ type: Value.Type, forKey key: String) throws -> Value?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SequentialSerializable>(_ type: Value.Type, forKey key: String) throws -> Value?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: KeyedSerializable>(_ type: Value.Type, forKey key: String) throws -> Value?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SequentialSerializable & KeyedSerializable>(_ type: Value.Type, forKey key: String) throws -> Value?

    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SerializationScalar>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: Serializable>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SequentialSerializable>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: KeyedSerializable>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SequentialSerializable & KeyedSerializable>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]?

    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SerializationScalar>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: Serializable>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SequentialSerializable>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: KeyedSerializable>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Value: SequentialSerializable & KeyedSerializable>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>?

    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SerializationScalar, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: Serializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: KeyedSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable & KeyedSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SerializationScalar, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: Serializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: KeyedSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable & KeyedSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SerializationScalar, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: Serializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: KeyedSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SerializationScalar, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: Serializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: KeyedSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable & KeyedSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SerializationScalar, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: Serializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?
    /// Deserializes a value of `type` associated with `key`, if any.
    func decode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]?

    /// Deserializes a value of `type` associated with `key` using Cocoa archival, if any.
    func decode<Value: NSCoding>(_ type: Value.Type, forKey key: String) throws -> Value? where Value: NSObject
    /// Deserializes values of `type` associated with `key` using Cocoa archival, if any.
    func decode<Value: NSCoding>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]? where Value: NSObject
    /// Deserializes values of `type` associated with `key` using Cocoa archival, if any.
    func decode<Value: NSCoding>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>? where Value: NSObject, Value: Hashable
    /// Deserializes values of `type` associated with `key` using Cocoa archival, if any.
    func decode<Key: NSCoding, Value: NSCoding>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? where Key: NSObject, Key: Hashable, Value: NSObject
}

extension KeyedDecoder {

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Value: Serializable>(_ type: Value.Type, forKey key: String) throws -> Value? {
        return try decode(Value.Scalar.self, forKey: key).flatMap(Value.init(_:))
    }

    private func decodeArray<Array: RangeReplaceableCollection>(forKey key: String, by nextElement: (Array.Iterator.Element.Type, String) throws -> Array.Iterator.Element?) throws -> Array? {
        var array = Array()
        var i = 0
        while let next = try nextElement(Array.Iterator.Element.self, "C.values.\(i)") {
            array.append(next)
            i += 1
        }
        return array
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type, forKey key: String) throws -> Array? where Array.Iterator.Element: SerializationScalar {
        return try decodeArray(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type, forKey key: String) throws -> Array? where Array.Iterator.Element: Serializable {
        return try decodeArray(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type, forKey key: String) throws -> Array? where Array.Iterator.Element: SequentialSerializable {
        return try decodeArray(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type, forKey key: String) throws -> Array? where Array.Iterator.Element: KeyedSerializable {
        return try decodeArray(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type, forKey key: String) throws -> Array? where Array.Iterator.Element: SequentialSerializable & KeyedSerializable {
        return try decodeArray(forKey: key, by: decode)
    }

    /// Deserializes values of `type` associated with `key` using Cocoa archival, if any.
    public func decode<Value: NSCoding>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]? where Value: NSObject {
        return try decodeArray(forKey: key, by: decode)
    }

    private func decodeSet<Set: SetAlgebra>(forKey key: String, by nextElement: (Set.Element.Type, String) throws -> Set.Element?) throws -> Set? {
        var set: Set = []
        var i = 0
        while let next = try nextElement(Set.Element.self, "C.values.\(i)") {
            set.insert(next)
            i += 1
        }
        return set
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Set: SetAlgebra>(_ type: Set.Type, forKey key: String) throws -> Set? where Set.Element: SerializationScalar {
        return try decodeSet(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Set: SetAlgebra>(_ type: Set.Type, forKey key: String) throws -> Set? where Set.Element: Serializable {
        return try decodeSet(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Set: SetAlgebra>(_ type: Set.Type, forKey key: String) throws -> Set? where Set.Element: SequentialSerializable {
        return try decodeSet(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Set: SetAlgebra>(_ type: Set.Type, forKey key: String) throws -> Set? where Set.Element: KeyedSerializable {
        return try decodeSet(forKey: key, by: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Set: SetAlgebra>(_ type: Set.Type, forKey key: String) throws -> Set? where Set.Element: SequentialSerializable & KeyedSerializable {
        return try decodeSet(forKey: key, by: decode)
    }

    /// Deserializes values of `type` associated with `key` using Cocoa archival, if any.
    public func decode<Value: NSCoding>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>? where Value: NSObject, Value: Hashable {
        return try decodeSet(forKey: key, by: decode)
    }

    private func decodeDictionary<Key: Hashable, Value>(forKey key: String, byKey nextKey: (Key.Type, String) throws -> Key?, byValue nextValue: (Value.Type, String) throws -> Value?) throws -> [Key: Value]? {
        var dictionary = [Key: Value]()
        var i = 0
        while let key = try nextKey(Key.self, "C.keys.\(i)"), let value = try nextValue(Value.self, "C.values.\(i)") {
            dictionary[key] = value
            i += 1
        }
        return dictionary
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SerializationScalar, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: Serializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: KeyedSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SerializationScalar, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: Serializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: KeyedSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SerializationScalar, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: Serializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: KeyedSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SerializationScalar, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: Serializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: KeyedSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SerializationScalar, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: Serializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes a value of `type` associated with `key`, if any.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` associated with `key` using Cocoa archival, if any.
    public func decode<Key: NSCoding, Value: NSCoding>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? where Key: NSObject, Key: Hashable, Value: NSObject {
        return try decodeDictionary(forKey: key, byKey: decode, byValue: decode)
    }
    
}
