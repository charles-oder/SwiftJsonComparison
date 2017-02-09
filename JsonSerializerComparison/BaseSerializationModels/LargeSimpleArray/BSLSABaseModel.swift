// BSLSABaseModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:00 +0000

import Foundation

public struct BSLSABaseModel: JsonModel {

    public let data: [BSLSADataModel]?

    public init(
                data: [BSLSADataModel]?
                ) {
        self.data = data
    }

    public init?(dictionary:[String: Any?]?) {

        if let dictionaryArray = dictionary?["data"] as? [[String:Any?]] {
            var objectArray = [BSLSADataModel]()
            for d in dictionaryArray {
                if let object = BSLSADataModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.data = objectArray
        } else {
            self.data = nil
        }

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        if let objectArray = self.data {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["data"] = dictionaryArray
        }

        return dictionary

    }

}
