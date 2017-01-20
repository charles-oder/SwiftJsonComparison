// BSLCSolutionsModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCSolutionsModel: JsonModel {

    public let displayName: String?
    public let discountPrograms: [BSLCDiscountprogramsModel]?
    public let id: Int?
    public let UOM: String?
    public let deviations: [String]?
    public let category: BSLCCategoryModel?

    public init(
                displayName: String?,
                discountPrograms: [BSLCDiscountprogramsModel]?,
                id: Int?,
                UOM: String?,
                deviations: [String]?,
                category: BSLCCategoryModel?
                ) {
        self.displayName = displayName
        self.discountPrograms = discountPrograms
        self.id = id
        self.UOM = UOM
        self.deviations = deviations
        self.category = category
    }

    public init?(dictionary:[String: Any?]?) {

        self.displayName = dictionary?["displayName"] as? String
        if let dictionaryArray = dictionary?["discountPrograms"] as? [[String:Any?]] {
            var objectArray = [BSLCDiscountprogramsModel]()
            for d in dictionaryArray {
                if let object = BSLCDiscountprogramsModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.discountPrograms = objectArray
        } else {
            self.discountPrograms = nil
        }
        self.id = dictionary?["id"] as? Int
        self.UOM = dictionary?["UOM"] as? String
        self.deviations = dictionary?["deviations"] as? [String]
        self.category = BSLCCategoryModel(dictionary:dictionary?["category"] as? [String:Any?])

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["displayName"] = self.displayName
        if let objectArray = self.discountPrograms {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["discountPrograms"] = dictionaryArray
        }
        dictionary["id"] = self.id
        dictionary["UOM"] = self.UOM
        dictionary["deviations"] = self.deviations
        dictionary["category"] = self.category?.jsonDictionary

        return dictionary

    }

}
