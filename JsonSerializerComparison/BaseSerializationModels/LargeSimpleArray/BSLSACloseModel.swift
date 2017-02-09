// BSLSACloseModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:00 +0000

import Foundation

public struct BSLSACloseModel: JsonModel {

    public let number: Double?
    public let text: String?

    public init(
                number: Double?,
                text: String?
                ) {
        self.number = number
        self.text = text
    }

    public init?(dictionary:[String: Any?]?) {

        self.number = dictionary?["number"] as? Double
        self.text = dictionary?["text"] as? String

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["number"] = self.number
        dictionary["text"] = self.text

        return dictionary

    }

}
