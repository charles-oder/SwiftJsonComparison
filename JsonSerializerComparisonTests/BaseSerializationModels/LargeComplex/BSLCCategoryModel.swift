// BSLCCategoryModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCCategoryModel: JsonModel {

    public let id: Int?
    public let name: String?

    public init(
                id: Int?,
                name: String?
                ) {
        self.id = id
        self.name = name
    }

    public init?(dictionary:[String: Any?]?) {

        self.id = dictionary?["id"] as? Int
        self.name = dictionary?["name"] as? String

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["id"] = self.id
        dictionary["name"] = self.name

        return dictionary

    }

}
