// BSMBaseModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:25 +0000

import Foundation

public struct BSMBaseModel: JsonModel {

    public let meta: BSMMetaModel?
    public let data: [BSMDataModel]?

    public init(
                meta: BSMMetaModel?,
                data: [BSMDataModel]?
                ) {
        self.meta = meta
        self.data = data
    }

    public init?(dictionary:[String: Any?]?) {

        self.meta = BSMMetaModel(dictionary:dictionary?["meta"] as? [String:Any?])
        if let dictionaryArray = dictionary?["data"] as? [[String:Any?]] {
            var objectArray = [BSMDataModel]()
            for d in dictionaryArray {
                if let object = BSMDataModel(dictionary:d) {
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
        dictionary["meta"] = self.meta?.jsonDictionary
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
