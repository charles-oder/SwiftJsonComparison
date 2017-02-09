// BSLCOrderformModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCOrderformModel: JsonModel {

    public let createdBy: Int?
    public let name: String?
    public let modified: String?
    public let paymentTerms: [BSLCPaymenttermsModel]?
    public let id: Int?
    public let created: String?
    public let templateTerms: String?
    public let active: Int?
    public let modifiedBy: Int?
    public let salesTerritories: [BSLCSalesterritoriesModel]?
    public let solutions: [BSLCSolutionsModel]?
    public let season: BSLCSeasonModel?

    public init(
                createdBy: Int?,
                name: String?,
                modified: String?,
                paymentTerms: [BSLCPaymenttermsModel]?,
                id: Int?,
                created: String?,
                templateTerms: String?,
                active: Int?,
                modifiedBy: Int?,
                salesTerritories: [BSLCSalesterritoriesModel]?,
                solutions: [BSLCSolutionsModel]?,
                season: BSLCSeasonModel?
                ) {
        self.createdBy = createdBy
        self.name = name
        self.modified = modified
        self.paymentTerms = paymentTerms
        self.id = id
        self.created = created
        self.templateTerms = templateTerms
        self.active = active
        self.modifiedBy = modifiedBy
        self.salesTerritories = salesTerritories
        self.solutions = solutions
        self.season = season
    }

    public init?(dictionary:[String: Any?]?) {

        self.createdBy = dictionary?["createdBy"] as? Int
        self.name = dictionary?["name"] as? String
        self.modified = dictionary?["modified"] as? String
        if let dictionaryArray = dictionary?["paymentTerms"] as? [[String:Any?]] {
            var objectArray = [BSLCPaymenttermsModel]()
            for d in dictionaryArray {
                if let object = BSLCPaymenttermsModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.paymentTerms = objectArray
        } else {
            self.paymentTerms = nil
        }
        self.id = dictionary?["id"] as? Int
        self.created = dictionary?["created"] as? String
        self.templateTerms = dictionary?["templateTerms"] as? String
        self.active = dictionary?["active"] as? Int
        self.modifiedBy = dictionary?["modifiedBy"] as? Int
        if let dictionaryArray = dictionary?["salesTerritories"] as? [[String:Any?]] {
            var objectArray = [BSLCSalesterritoriesModel]()
            for d in dictionaryArray {
                if let object = BSLCSalesterritoriesModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.salesTerritories = objectArray
        } else {
            self.salesTerritories = nil
        }
        if let dictionaryArray = dictionary?["solutions"] as? [[String:Any?]] {
            var objectArray = [BSLCSolutionsModel]()
            for d in dictionaryArray {
                if let object = BSLCSolutionsModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.solutions = objectArray
        } else {
            self.solutions = nil
        }
        self.season = BSLCSeasonModel(dictionary:dictionary?["season"] as? [String:Any?])

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["createdBy"] = self.createdBy
        dictionary["name"] = self.name
        dictionary["modified"] = self.modified
        if let objectArray = self.paymentTerms {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["paymentTerms"] = dictionaryArray
        }
        dictionary["id"] = self.id
        dictionary["created"] = self.created
        dictionary["templateTerms"] = self.templateTerms
        dictionary["active"] = self.active
        dictionary["modifiedBy"] = self.modifiedBy
        if let objectArray = self.salesTerritories {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["salesTerritories"] = dictionaryArray
        }
        if let objectArray = self.solutions {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["solutions"] = dictionaryArray
        }
        dictionary["season"] = self.season?.jsonDictionary

        return dictionary

    }

}
