// BSLCSeasonModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCSeasonModel: JsonModel {

    public let id: Int?
    public let name: String?
    public let year: Int?

    public init(
                id: Int?,
                name: String?,
                year: Int?
                ) {
        self.id = id
        self.name = name
        self.year = year
    }

    public init?(dictionary:[String: Any?]?) {

        self.id = dictionary?["id"] as? Int
        self.name = dictionary?["name"] as? String
        self.year = dictionary?["year"] as? Int

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["id"] = self.id
        dictionary["name"] = self.name
        dictionary["year"] = self.year

        return dictionary

    }

}
