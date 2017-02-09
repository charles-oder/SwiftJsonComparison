// BSMMetaModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:25 +0000

import Foundation

public struct BSMMetaModel: JsonModel {

    public let status: Int?
    public let symbols: [BSMSymbolsModel]?
    public let requestId: Int?
    public let expression: String?
    public let command: String?

    public init(
                status: Int?,
                symbols: [BSMSymbolsModel]?,
                requestId: Int?,
                expression: String?,
                command: String?
                ) {
        self.status = status
        self.symbols = symbols
        self.requestId = requestId
        self.expression = expression
        self.command = command
    }

    public init?(dictionary:[String: Any?]?) {

        self.status = dictionary?["status"] as? Int
        if let dictionaryArray = dictionary?["symbols"] as? [[String:Any?]] {
            var objectArray = [BSMSymbolsModel]()
            for d in dictionaryArray {
                if let object = BSMSymbolsModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.symbols = objectArray
        } else {
            self.symbols = nil
        }
        self.requestId = dictionary?["requestId"] as? Int
        self.expression = dictionary?["expression"] as? String
        self.command = dictionary?["command"] as? String

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["status"] = self.status
        if let objectArray = self.symbols {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["symbols"] = dictionaryArray
        }
        dictionary["requestId"] = self.requestId
        dictionary["expression"] = self.expression
        dictionary["command"] = self.command

        return dictionary

    }

}
