// BSLCBaseModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCBaseModel: JsonModel {

    public let total: Int?
    public let data: [BSLCDataModel]?
    public let unfilteredTotal: Int?

    public init(
                total: Int?,
                data: [BSLCDataModel]?,
                unfilteredTotal: Int?
                ) {
        self.total = total
        self.data = data
        self.unfilteredTotal = unfilteredTotal
    }

    public init?(dictionary:[String: Any?]?) {

        self.total = dictionary?["total"] as? Int
        if let dictionaryArray = dictionary?["data"] as? [[String:Any?]] {
            var objectArray = [BSLCDataModel]()
            for d in dictionaryArray {
                if let object = BSLCDataModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.data = objectArray
        } else {
            self.data = nil
        }
        self.unfilteredTotal = dictionary?["unfilteredTotal"] as? Int

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["total"] = self.total
        if let objectArray = self.data {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["data"] = dictionaryArray
        }
        dictionary["unfilteredTotal"] = self.unfilteredTotal

        return dictionary

    }

}
