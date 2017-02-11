//
//  NSCoder.swift
//  Cereal
//
//  Created by Zachary Waldowski on 1/12/17.
//

import Foundation
import CoreGraphics.CGBase

private extension NSCoder {

    func markerClassName(for type: SequentialSerializable.Type) -> String {
        return markerClassName(forName: String(describing: type))
    }

    func markerClassName(for type: KeyedSerializable.Type) -> String {
        return markerClassName(forName: String(describing: type))
    }

    func markerClassName(forName name: String) -> String {
        return "Encoded<\(name)>"
    }
    
}

/// A keyed encoder that works on Cocoa archives.
public struct CodingArchiver: KeyedEncoder {

    fileprivate let archiver: NSKeyedArchiver
    private let legacyStorage: NSMutableData?

    /// Creates an empty archiver.
    public init() {
        if #available(macOS 12.0, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            self.archiver = NSKeyedArchiver()
            self.legacyStorage = nil
        } else {
            let storage = NSMutableData()
            self.archiver = NSKeyedArchiver(forWritingWith: storage)
            self.legacyStorage = storage
        }
    }

    /// Bridges `archiver` from Cocoa. Encoding done with the created archiver
    /// affects the original archiver.
    public init(_ archiver: NSKeyedArchiver) {
        self.archiver = archiver
        self.legacyStorage = nil
    }

    fileprivate init?(coder: NSCoder) {
        guard coder.allowsKeyedCoding, let archiver = coder as? NSKeyedArchiver else { return nil }
        self.archiver = archiver
        self.legacyStorage = nil
    }

    /// Returns the data produced by finishing encoding.
    ///
    /// The first call to this getter effectively makes the archiver read-only,
    /// and using it to encode afterwards will trap.
    public var encodedData: Data {
        if #available(macOS 12.0, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return archiver.encodedData
        } else {
            archiver.finishEncoding()
            return legacyStorage.map { $0 as Data } ?? Data()
        }
    }

    public func encode<Value: SerializationScalar>(_ value: Value?, forKey key: String) {
        switch value {
        case let value as Bool:
            archiver.encode(value, forKey: key)
        case let value as Int:
            archiver.encode(value, forKey: key)
        case let value as Int32:
            archiver.encode(value, forKey: key)
        case let value as Int64:
            archiver.encode(value, forKey: key)
        case let value as Float:
            archiver.encode(value, forKey: key)
        case let value as Double:
            archiver.encode(value, forKey: key)
        default:
            archiver.encode(value, forKey: key)
        }
    }

    public func encode<Value: SequentialSerializable>(_ value: Value?, forKey key: String) {
        archiver.encode(value.map(LegacyEncodingBox.init), forKey: key)
    }

    public func encode<Value: KeyedSerializable>(_ value: Value?, forKey key: String) {
        archiver.encode(value.map(EncodingBox.init), forKey: key)
    }
    
    public func encode<Value: SequentialSerializable & KeyedSerializable>(_ value: Value?, forKey key: String) {
        archiver.encode(value.map(EncodingBox.init), forKey: key)
    }

    public func encode<Value: NSCoding>(_ values: Value?, forKey key: String) {
        archiver.encode(values, forKey: key)
    }

    public func encode<Value: NSCoding>(_ values: [Value]?, forKey key: String) {
        archiver.encode(values, forKey: key)
    }

    public func encode<Value: NSCoding>(_ values: Set<Value>?, forKey key: String) {
        archiver.encode(values, forKey: key)
    }

    public func encode<Key: NSCoding, Value: NSCoding>(_ values: [Key: Value]?, forKey key: String) where Key: Hashable {
        archiver.encode(values, forKey: key)
    }

}

private final class EncodingBox: NSObject, NSCoding {

    let value: KeyedSerializable

    init(_ value: KeyedSerializable) {
        self.value = value
        super.init()
    }

    init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func encode(with coder: NSCoder) {
        guard let encoder = CodingArchiver(coder: coder) else { preconditionFailure() }
        let className = encoder.archiver.markerClassName(for: type(of: value))
        encoder.archiver.setClassName(className, for: type(of: self))
        value.encode(into: encoder)
        encoder.archiver.setClassName(className, for: type(of: self))
    }

}

// MARK: -

private extension CodingArchiver {

    struct Legacy: SequentialEncoder {

        fileprivate let archiver: NSCoder

        init(archiver: NSCoder) {
            self.archiver = archiver
        }

        fileprivate init(_ archiver: CodingArchiver) {
            self.archiver = archiver.archiver
        }

        func encode<Value: SerializationScalar>(_ value: Value?) {
            archiver.encode(value)
        }

        func encode<Value: SequentialSerializable>(_ value: Value?) {
            archiver.encode(value.map(LegacyEncodingBox.init))
        }

        func encode<Value: KeyedSerializable>(_ value: Value?) {
            archiver.encode(value.map(EncodingBox.init))
        }

        func encode<Value: SequentialSerializable & KeyedSerializable>(_ value: Value?) {
            archiver.encode(value.map(EncodingBox.init))
        }

        func encode<Value: NSCoding>(_ values: Value?) {
            archiver.encode(values)
        }

        func encode<Value: NSCoding>(_ values: [Value]?) {
            archiver.encode(values)
        }

        func encode<Value: NSCoding>(_ values: Set<Value>?) {
            archiver.encode(values)
        }
        
        func encode<Key: NSCoding, Value: NSCoding>(_ values: [Key: Value]?) {
            archiver.encode(values)
        }
        
    }

}

private final class LegacyEncodingBox: NSObject, NSCoding {

    let value: SequentialSerializable

    init(_ value: SequentialSerializable) {
        self.value = value
        super.init()
    }

    init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func encode(with coder: NSCoder) {
        guard let encoder = CodingArchiver(coder: coder) else { preconditionFailure() }
        let className = encoder.archiver.markerClassName(for: type(of: value))
        encoder.archiver.setClassName(className, for: type(of: self))
        value.encode(into: CodingArchiver.Legacy(encoder))
        encoder.archiver.setClassName(className, for: type(of: self))
    }
    
}

// MARK: -

/// A keyed decoder that works on Cocoa archives.
@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)
public struct CodingUnarchiver: KeyedDecoder {

    fileprivate let archiver: NSKeyedUnarchiver

    /// Bridges `archiver` from Cocoa.
    public init(archiver: NSKeyedUnarchiver) {
        archiver.decodingFailurePolicy = .setErrorAndReturn
        self.archiver = archiver
    }

    /// Creates an unarchiver for processing `data`.
    public init(data: Data) {
        let archiver = NSKeyedUnarchiver(forReadingWith: data)
        self.init(archiver: archiver)
    }

    fileprivate init?(coder: NSCoder) {
        guard coder.allowsKeyedCoding, let archiver = coder as? NSKeyedUnarchiver else { return nil }
        self.archiver = archiver
    }

    public func hasValue(forKey key: String) -> Bool {
        return archiver.containsValue(forKey: key)
    }

    private func decodeValue<Value1, Value2>(forKey key: String, by decoding: (NSKeyedUnarchiver) -> (String) -> Value2) throws -> Value1? {
        if let error = archiver.error { throw error }
        guard archiver.containsValue(forKey: key) else { return nil }
        return decoding(archiver)(key) as? Value1
    }

    public func decode<Value: SerializationScalar>(_ type: Value.Type, forKey key: String) throws -> Value? {
        if type == Int.self {
            return try decodeValue(forKey: key, by: NSKeyedUnarchiver.decodeInteger)
        } else if type == String.self {
            return try archiver.decodeTopLevelObject(of: NSString.self, forKey: key) as? Value
        } else if type == Data.self {
            return try archiver.decodeTopLevelObject(of: NSData.self, forKey: key) as? Value
        } else if type == Double.self {
            return try decodeValue(forKey: key, by: NSKeyedUnarchiver.decodeDouble)
        } else if type == Float.self {
            return try decodeValue(forKey: key, by: NSKeyedUnarchiver.decodeFloat)
        } else if type == Int64.self {
            return try decodeValue(forKey: key, by: NSKeyedUnarchiver.decodeInt64)
        } else if type == Int32.self {
            return try decodeValue(forKey: key, by: NSKeyedUnarchiver.decodeInt32)
        } else if type == CGFloat.self || type == UInt.self || type == Int8.self || type == Int16.self || type == UInt8.self || type == UInt16.self || type == UInt32.self || type == UInt64.self {
            return try archiver.decodeTopLevelObject(of: NSNumber.self, forKey: key) as? Value
        } else {
            preconditionFailure("Unexpected \(SerializationScalar.self) type \(type); you didn't add a custom conformance, did you?")
        }
    }

    public func decode<Value: SequentialSerializable>(_ type: Value.Type, forKey key: String) throws -> Value? {
        archiver.setClass(LegacyDecodingBox<Value>.self, forClassName: archiver.markerClassName(for: Value.self))
        return try archiver.decodeTopLevelObject(of: LegacyDecodingBox<Value>.self, forKey: key)?.value
    }

    public func decode<Value: KeyedSerializable>(_ type: Value.Type, forKey key: String) throws -> Value? {
        archiver.setClass(DecodingBox<Value>.self, forClassName: archiver.markerClassName(for: Value.self))
        return try archiver.decodeTopLevelObject(of: DecodingBox<Value>.self, forKey: key)?.value
    }

    public func decode<Value: SequentialSerializable & KeyedSerializable>(_ type: Value.Type, forKey key: String) throws -> Value? {
        archiver.setClass(DecodingBox<Value>.self, forClassName: archiver.markerClassName(for: Value.self as KeyedSerializable.Type))
        return try archiver.decodeTopLevelObject(of: DecodingBox<Value>.self, forKey: key)?.value
    }

    public func decode<Value: NSCoding>(_ type: Value.Type, forKey key: String) throws -> Value? where Value: NSObject {
        return try archiver.decodeTopLevelObject(of: Value.self, forKey: key)
    }

    public func decode<Value: NSCoding>(_ type: Array<Value>.Type, forKey key: String) throws -> [Value]? where Value: NSObject {
        return try archiver.decodeTopLevelObject(of: [ Value.self ], forKey: key) as? [Value]
    }

    public func decode<Value: NSCoding>(_ type: Set<Value>.Type, forKey key: String) throws -> Set<Value>? where Value: NSObject, Value: Hashable {
        return try archiver.decodeTopLevelObject(of: [ Value.self ], forKey: key) as? Set<Value>
    }

    public func decode<Key: NSCoding, Value: NSCoding>(_ type: Dictionary<Key, Value>.Type, forKey key: String) throws -> [Key: Value]? where Key: NSObject, Key: Hashable, Value: NSObject {
        return try archiver.decodeTopLevelObject(of: [ Key.self, Value.self ], forKey: key) as? [Key: Value]
    }

}

@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)
private final class DecodingBox<Value: KeyedSerializable>: NSObject, NSCoding {

    let value: Value

    init?(coder: NSCoder) {
        guard let decoder = CodingUnarchiver(coder: coder) else { return nil }
        do {
            self.value = try Value(from: decoder)
        } catch {
            decoder.archiver.failWithError(error)
            return nil
        }
        super.init()
    }

    func encode(with aCoder: NSCoder) {
        fatalError()
    }
    
}

// MARK: -

@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)
private extension CodingUnarchiver {

    struct Legacy: SequentialDecoder {

        let archiver: NSCoder

        init(archiver: NSCoder) {
            self.archiver = archiver
        }

        init(_ archiver: CodingUnarchiver) {
            self.archiver = archiver.archiver
        }

        private func decodeValue<Value1, Value2>(forKey key: String, by decoding: (NSCoder) -> () -> Value2) throws -> Value1? {
            if let error = archiver.error { throw error }
            guard archiver.containsValue(forKey: key) else { return nil }
            return decoding(archiver)() as? Value1
        }

        func decode<Value: SerializationScalar>(_ type: Value.Type) throws -> Value? {
            precondition(type == Int.self || type == UInt.self || type == CGFloat.self || type == Int8.self || type == Int16.self || type == Int32.self || type == Int64.self || type == UInt8.self || type == UInt16.self || type == UInt32.self || type == UInt64.self || type == Float.self || type == Double.self || type == Bool.self || type == String.self || type == Data.self, "Unexpected \(SerializationScalar.self) type \(type); you didn't add a custom conformance, did you?")

            return try archiver.decodeTopLevelObject() as? Value
        }

        func decode<Value: SequentialSerializable>(_ type: Value.Type) throws -> Value? {
            return try (archiver.decodeTopLevelObject() as? LegacyDecodingBox<Value>)?.value
        }

        func decode<Value: KeyedSerializable>(_ type: Value.Type) throws -> Value? {
            return try (archiver.decodeTopLevelObject() as? DecodingBox<Value>)?.value
        }

        func decode<Value: SequentialSerializable & KeyedSerializable>(_ type: Value.Type) throws -> Value? {
            return try (archiver.decodeTopLevelObject() as? DecodingBox<Value>)?.value
        }

        func decode<Value: NSCoding>(_ type: Value.Type) throws -> Value? where Value: NSObject {
            return try archiver.decodeTopLevelObject() as? Value
        }

        func decode<Value: NSCoding>(_ type: Array<Value>.Type) throws -> [Value]? where Value: NSObject {
            return try archiver.decodeTopLevelObject() as? [Value]
        }

        func decode<Value: NSCoding>(_ type: Set<Value>.Type) throws -> Set<Value>? where Value: NSObject, Value: Hashable {
            return try archiver.decodeTopLevelObject() as? Set<Value>
        }
        
        func decode<Key: NSCoding, Value: NSCoding>(_ type: Dictionary<Key, Value>.Type) throws -> [Key: Value]? where Key: NSObject, Key: Hashable, Value: NSObject {
            return try archiver.decodeTopLevelObject() as? [Key: Value]
        }
        
    }

}

@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)
private final class LegacyDecodingBox<Value: SequentialSerializable>: NSObject, NSCoding {

    let value: Value

    init?(coder: NSCoder) {
        guard let decoder = CodingUnarchiver(coder: coder) else { return nil }
        do {
            self.value = try Value(from: CodingUnarchiver.Legacy(decoder))
        } catch {
            decoder.archiver.failWithError(error)
            return nil
        }
        super.init()
    }

    func encode(with aCoder: NSCoder) {
        fatalError()
    }
    
}
