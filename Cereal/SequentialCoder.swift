//
//  SequentialCoder.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/2/17.
//

import Foundation

public protocol SequentialEncoder {
    /// Serializes `value` at the current position.
    func encode<Value: SerializationScalar>(_ value: Value?)
    /// Serializes `value` at the current position.
    func encode<Value: Serializable>(_ value: Value?)
    /// Serializes `value` at the current position.
    func encode<Value: SequentialSerializable>(_ value: Value?)
    /// Serializes `value` at the current position.
    func encode<Value: KeyedSerializable>(_ value: Value?)
    /// Serializes `value` at the current position.
    func encode<Value: SequentialSerializable & KeyedSerializable>(_ value: Value?)
    
    /// Serializes `value` at the current position.
    func encode<Value: NSCoding>(_ value: Value?)
    /// Serializes `values` at the current position using Cocoa archival.
    func encode<Value: NSCoding>(_ values: [Value]?)
    /// Serializes `values` at the current position using Cocoa archival.
    func encode<Value: NSCoding>(_ values: Set<Value>?)
    /// Serializes `values` at the current position using Cocoa archival.
    func encode<Key: NSCoding, Value: NSCoding>(_ values: [Key: Value]?)
}

extension SequentialEncoder {

    /// Serializes `value` at the current position.
    public func encode<Value: Serializable>(_ value: Value?) {
        encode(value?.serialized)
    }

    /// Serializes `value` at the current position.
    public func encode<Value: NSCoding>(_ value: Value?) {
        encode(value.map(NSKeyedArchiver.archivedData))
    }

    private func encode<Array: Sequence>(elementsFrom array: Array?, by eachElement: (Array.Iterator.Element) -> Void) {
        guard let array = array.map(Swift.Array.init) else { return }
        encode(array.count)
        array.forEach(eachElement)
    }

    /// Serializes `values` at the current position.
    public func encode<Array: Sequence, Value: SerializationScalar>(_ values: Array?) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, by: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Array: Sequence, Value: Serializable>(_ values: Array?) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, by: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Array: Sequence, Value: SequentialSerializable>(_ values: Array?) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, by: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Array: Sequence, Value: KeyedSerializable>(_ values: Array?) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, by: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Array: Sequence, Value: SequentialSerializable & KeyedSerializable>(_ values: Array?) where Array.Iterator.Element == Value {
        encode(elementsFrom: values, by: encode)
    }

    /// Serializes `values` at the current position using Cocoa archival.
    public func encode<Value: NSCoding>(_ values: [Value]?) {
        encode(elementsFrom: values, by: encode)
    }

    /// Serializes `values` at the current position using Cocoa archival.
    public func encode<Value: NSCoding>(_ values: Set<Value>?) {
        encode(elementsFrom: values, by: encode)
    }

    private func encode<Key: Hashable, Value>(elementsFrom dictionary: [Key: Value]?, byKey eachKey: (Key) -> Void, byValue eachValue: (Value) -> Void) {
        guard let dictionary = dictionary else { return }
        encode(dictionary.count)
        for (key, value) in dictionary {
            eachKey(key)
            eachValue(value)
        }
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SerializationScalar, Value: SerializationScalar>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: Serializable, Value: SerializationScalar>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable, Value: SerializationScalar>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: KeyedSerializable, Value: SerializationScalar>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: SerializationScalar>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SerializationScalar, Value: Serializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: Serializable, Value: Serializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable, Value: Serializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: KeyedSerializable, Value: Serializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: Serializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SerializationScalar, Value: SequentialSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: Serializable, Value: SequentialSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: KeyedSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SerializationScalar, Value: KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: Serializable, Value: KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: KeyedSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SerializationScalar, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: Serializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position.
    public func encode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

    /// Serializes `values` at the current position using Cocoa archival.
    public func encode<Key: NSCoding, Value: NSCoding>(_ values: [Key: Value]?) {
        encode(elementsFrom: values, byKey: encode, byValue: encode)
    }

}

public protocol SequentialDecoder {
    /// Deserializes a value of `type` at the current position.
    func decode<Value: SerializationScalar>(_ type: Value.Type) throws -> Value?
    /// Deserializes a value of `type` at the current position.
    func decode<Value: Serializable>(_ type: Value.Type) throws -> Value?
    /// Deserializes a value of `type` at the current position.
    func decode<Value: SequentialSerializable>(_ type: Value.Type) throws -> Value?
    /// Deserializes a value of `type` at the current position.
    func decode<Value: KeyedSerializable>(_ type: Value.Type) throws -> Value?
    /// Deserializes a value of `type` at the current position.
    func decode<Value: SequentialSerializable & KeyedSerializable>(_ type: Value.Type) throws -> Value?

    /// Deserializes a value of `type` at the current position using Cocoa archival.
    func decode<Value: NSCoding>(_ type: Value.Type) throws -> Value? where Value: NSObject
    /// Deserializes values of `type` at the current position using Cocoa archival.
    func decode<Value: NSCoding>(_ type: Array<Value>.Type) throws -> [Value]? where Value: NSObject
    /// Deserializes values of `type` at the current position using Cocoa archival.
    func decode<Value: NSCoding>(_ type: Set<Value>.Type) throws -> Set<Value>? where Value: NSObject, Value: Hashable
    /// Deserializes values of `type` at the current position using Cocoa archival.
    func decode<Key: NSCoding, Value: NSCoding>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? where Key: NSObject, Key: Hashable, Value: NSObject
}

extension SequentialDecoder {

    /// Deserializes a value of `type` at the current position.
    public func decode<Value: Serializable>(_ type: Value.Type) throws -> Value? {
        return try decode(Value.Scalar.self).flatMap(Value.init(_:))
    }

    /// Deserializes a value of `type` at the current position using Cocoa archival.
    public func decode<Value: NSCoding>(_ type: Value.Type) throws -> Value? where Value: NSObject {
        return try decode(Data.self).flatMap { (data) throws -> Value? in
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            defer { unarchiver.finishDecoding() }
            return try unarchiver.decodeTopLevelObject() as? Value
        }
    }

    private func decodeArray<Array: RangeReplaceableCollection>(by nextElement: (Array.Iterator.Element.Type) throws -> Array.Iterator.Element?) throws -> Array? {
        guard let count = try decode(Int.self) else { return nil }

        var array = Array()
        var i = 0
        array.reserveCapacity(numericCast(count))

        while i < count, let element = try nextElement(Array.Iterator.Element.self) {
            array.append(element)
            i += 1
        }

        for _ in i ..< count {
            _ = try nextElement(Array.Iterator.Element.self)
        }

        return array
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type) throws -> Array? where Array.Iterator.Element: SerializationScalar {
        return try decodeArray(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type) throws -> Array? where Array.Iterator.Element: Serializable {
        return try decodeArray(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type) throws -> Array? where Array.Iterator.Element: SequentialSerializable {
        return try decodeArray(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type) throws -> Array? where Array.Iterator.Element: KeyedSerializable {
        return try decodeArray(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Array: RangeReplaceableCollection>(_ type: Array.Type) throws -> Array? where Array.Iterator.Element: SequentialSerializable & KeyedSerializable {
        return try decodeArray(by: decode)
    }

    /// Deserializes values of `type` at the current position using Cocoa archival.
    public func decode<Value: NSCoding>(_ type: Array<Value>.Type) throws -> [Value]? where Value: NSObject {
        return try decodeArray( by: decode)
    }

    private func decodeSet<Set: SetAlgebra>(by nextElement: (Set.Element.Type) throws -> Set.Element?) throws -> Set? {
        guard let count = try decode(Int.self) else { return nil }

        var set: Set = []
        var i = 0

        while i < count, let element = try nextElement(Set.Element.self) {
            set.insert(element)
            i += 1
        }

        for _ in i ..< count {
            _ = try nextElement(Set.Element.self)
        }

        return set
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Set: SetAlgebra>(_ type: Set.Type) throws -> Set? where Set.Element: SerializationScalar {
        return try decodeSet(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Set: SetAlgebra>(_ type: Set.Type) throws -> Set? where Set.Element: Serializable {
        return try decodeSet(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Set: SetAlgebra>(_ type: Set.Type) throws -> Set? where Set.Element: SequentialSerializable {
        return try decodeSet(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Set: SetAlgebra>(_ type: Set.Type) throws -> Set? where Set.Element: KeyedSerializable {
        return try decodeSet(by: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Set: SetAlgebra>(_ type: Set.Type) throws -> Set? where Set.Element: SequentialSerializable & KeyedSerializable {
        return try decodeSet(by: decode)
    }

    /// Deserializes values of `type` at the current position using Cocoa archival.
    public func decode<Value: NSCoding>(_ type: Set<Value>.Type) throws -> Set<Value>? where Value: NSObject, Value: Hashable {
        return try decodeSet(by: decode)
    }

    private func decodeDictionary<Key: Hashable, Value>(byKey nextKey: (Key.Type) throws -> Key?, byValue nextValue: (Value.Type) throws -> Value?) throws -> [Key: Value]? {
        guard let count = try decode(Int.self) else { return nil }

        var dictionary = [Key: Value]()
        var i = 0

        while i < count, let key = try nextKey(Key.self), let value = try nextValue(Value.self) {
            dictionary[key] = value
            i += 1
        }

        for _ in i ..< count {
            _ = try nextKey(Key.self)
            _ = try nextValue(Value.self)
        }

        return dictionary
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SerializationScalar, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: Serializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: KeyedSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: SerializationScalar>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SerializationScalar, Value: Serializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: Serializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: KeyedSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: Serializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SerializationScalar, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: Serializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: KeyedSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SerializationScalar, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: Serializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: KeyedSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SerializationScalar, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: Serializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position.
    public func decode<Key: SequentialSerializable & KeyedSerializable, Value: SequentialSerializable & KeyedSerializable>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }

    /// Deserializes values of `type` at the current position using Cocoa archival.
    public func decode<Key: NSCoding, Value: NSCoding>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? where Key: NSObject, Key: Hashable, Value: NSObject {
        return try decodeDictionary(byKey: decode, byValue: decode)
    }
    
}
