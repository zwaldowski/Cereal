//
//  CerealTests.swift
//  CerealTests
//
//  Created by Zachary Waldowski on 1/12/17.
//

import XCTest
import Cereal

class KeyedCoderTests: XCTestCase {

    static var allTests : [(String, (KeyedCoderTests) -> () throws -> Void)] {
        return [
            ("testKeyed", testKeyed),
            ("testArray", testArray),
            ("testDictionary", testDictionary),
        ]
    }

    private let someScalar: UnicodeScalar = "🙈"

    func testSingleValueCodableRoundtrip() {
        let archiver = CodingArchiver()
        archiver.encode(someScalar, forKey: NSKeyedArchiveRootObjectKey)
        let data = archiver.encodedData

        let unarchiver = CodingUnarchiver(data: data)
        XCTAssertEqual(someScalar, try unarchiver.decode(UnicodeScalar.self, forKey: NSKeyedArchiveRootObjectKey))
    }

    private let somePerson1 = Person(fullName: "John Appleseed", favoriteColor: .red, weightClass: .bantham, zodiacSign: .cancer)
    private let somePerson2 = Person(fullName: "Zachary Waldowski", favoriteColor: .blue, weightClass: .heavy, zodiacSign: .taurus)
    private let somePerson3 = Person(fullName: "Christian Keur", favoriteColor: .other(#colorLiteral(red: 0.2823529412, green: 0.2352941176, blue: 0.1960784314, alpha: 1)), weightClass: .welter, zodiacSign: .virgo)

    func testKeyed() {
        let archiver = CodingArchiver()
        archiver.encode(somePerson1, forKey: NSKeyedArchiveRootObjectKey)
        let data = archiver.encodedData

        let unarchiver = CodingUnarchiver(data: data)
        XCTAssertEqual(somePerson1, try unarchiver.decode(Person.self, forKey: NSKeyedArchiveRootObjectKey))
    }

    func testArray() {
        let somePeople = [
            somePerson1, somePerson2, somePerson3
        ]

        let archiver = CodingArchiver()
        archiver.encode(somePeople, forKey: NSKeyedArchiveRootObjectKey)
        let data = archiver.encodedData

        let unarchiver = CodingUnarchiver(data: data)
        XCTAssertEqual(somePeople, try unarchiver.decode(Array<Person>.self, forKey: NSKeyedArchiveRootObjectKey) ?? [])
    }

    func testDictionary() {
        let keyedPeople = [
            "Bob": somePerson1,
            "Ted": somePerson2,
            "Wilkie": somePerson3
        ]

        let archiver = CodingArchiver()
        archiver.encode(keyedPeople, forKey: NSKeyedArchiveRootObjectKey)
        let data = archiver.encodedData

        let unarchiver = CodingUnarchiver(data: data)
        XCTAssertEqual(keyedPeople, try unarchiver.decode(Dictionary<String, Person>.self, forKey: NSKeyedArchiveRootObjectKey) ?? [:])
    }

}
