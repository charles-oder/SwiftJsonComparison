// BSLCDiscountprogramsModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCDiscountprogramsModel: JsonModel {

    public let description: String?
    public let name: String?
    public let active: Int?
    public let id: Int?
    public let operation: String?

    public init(
                description: String?,
                name: String?,
                active: Int?,
                id: Int?,
                operation: String?
                ) {
        self.description = description
        self.name = name
        self.active = active
        self.id = id
        self.operation = operation
    }

    public init?(dictionary:[String: Any?]?) {

        self.description = dictionary?["description"] as? String
        self.name = dictionary?["name"] as? String
        self.active = dictionary?["active"] as? Int
        self.id = dictionary?["id"] as? Int
        self.operation = dictionary?["operation"] as? String

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["description"] = self.description
        dictionary["name"] = self.name
        dictionary["active"] = self.active
        dictionary["id"] = self.id
        dictionary["operation"] = self.operation

        return dictionary

    }

}
