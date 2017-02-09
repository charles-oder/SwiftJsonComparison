// BSLCItemsModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCItemsModel: JsonModel {

    public let idSolution: Int?
    public let displayName: String?
    public let quantity: Int?
    public let idDiscountProgram: Int?
    public let price: Double?
    public let subTotal: Double?

    public init(
                idSolution: Int?,
                displayName: String?,
                quantity: Int?,
                idDiscountProgram: Int?,
                price: Double?,
                subTotal: Double?
                ) {
        self.idSolution = idSolution
        self.displayName = displayName
        self.quantity = quantity
        self.idDiscountProgram = idDiscountProgram
        self.price = price
        self.subTotal = subTotal
    }

    public init?(dictionary:[String: Any?]?) {

        self.idSolution = dictionary?["idSolution"] as? Int
        self.displayName = dictionary?["displayName"] as? String
        self.quantity = dictionary?["quantity"] as? Int
        self.idDiscountProgram = dictionary?["idDiscountProgram"] as? Int
        self.price = dictionary?["price"] as? Double
        self.subTotal = dictionary?["subTotal"] as? Double

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["idSolution"] = self.idSolution
        dictionary["displayName"] = self.displayName
        dictionary["quantity"] = self.quantity
        dictionary["idDiscountProgram"] = self.idDiscountProgram
        dictionary["price"] = self.price
        dictionary["subTotal"] = self.subTotal

        return dictionary

    }

}
