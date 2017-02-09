// BSLCCustomerModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCCustomerModel: JsonModel {

    public let id: Int?
    public let displayName: String?

    public init(
                id: Int?,
                displayName: String?
                ) {
        self.id = id
        self.displayName = displayName
    }

    public init?(dictionary:[String: Any?]?) {

        self.id = dictionary?["id"] as? Int
        self.displayName = dictionary?["displayName"] as? String

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["id"] = self.id
        dictionary["displayName"] = self.displayName

        return dictionary

    }

}
