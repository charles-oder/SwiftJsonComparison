// BSLCDataModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:37:07 +0000

import Foundation

public struct BSLCDataModel: JsonModel {

    public let note: String?
    public let items: [BSLCItemsModel]?
    public let date: String?
    public let customer: BSLCCustomerModel?
    public let modifiedBy: Int?
    public let endDeliveryDate: String?
    public let idOrderForm: Int?
    public let status: String?
    public let modified: String?
    public let id: Int?
    public let created: String?
    public let startDeliveryDate: String?
    public let orderForm: BSLCOrderformModel?
    public let total: Double?
    public let salesRep: BSLCSalesrepModel?
    public let createdBy: Int?

    public init(
                note: String?,
                items: [BSLCItemsModel]?,
                date: String?,
                customer: BSLCCustomerModel?,
                modifiedBy: Int?,
                endDeliveryDate: String?,
                idOrderForm: Int?,
                status: String?,
                modified: String?,
                id: Int?,
                created: String?,
                startDeliveryDate: String?,
                orderForm: BSLCOrderformModel?,
                total: Double?,
                salesRep: BSLCSalesrepModel?,
                createdBy: Int?
                ) {
        self.note = note
        self.items = items
        self.date = date
        self.customer = customer
        self.modifiedBy = modifiedBy
        self.endDeliveryDate = endDeliveryDate
        self.idOrderForm = idOrderForm
        self.status = status
        self.modified = modified
        self.id = id
        self.created = created
        self.startDeliveryDate = startDeliveryDate
        self.orderForm = orderForm
        self.total = total
        self.salesRep = salesRep
        self.createdBy = createdBy
    }

    public init?(dictionary:[String: Any?]?) {

        self.note = dictionary?["note"] as? String
        if let dictionaryArray = dictionary?["items"] as? [[String:Any?]] {
            var objectArray = [BSLCItemsModel]()
            for d in dictionaryArray {
                if let object = BSLCItemsModel(dictionary:d) {
                    objectArray.append(object)
                }
            }
            self.items = objectArray
        } else {
            self.items = nil
        }
        self.date = dictionary?["date"] as? String
        self.customer = BSLCCustomerModel(dictionary:dictionary?["customer"] as? [String:Any?])
        self.modifiedBy = dictionary?["modifiedBy"] as? Int
        self.endDeliveryDate = dictionary?["endDeliveryDate"] as? String
        self.idOrderForm = dictionary?["idOrderForm"] as? Int
        self.status = dictionary?["status"] as? String
        self.modified = dictionary?["modified"] as? String
        self.id = dictionary?["id"] as? Int
        self.created = dictionary?["created"] as? String
        self.startDeliveryDate = dictionary?["startDeliveryDate"] as? String
        self.orderForm = BSLCOrderformModel(dictionary:dictionary?["orderForm"] as? [String:Any?])
        self.total = dictionary?["total"] as? Double
        self.salesRep = BSLCSalesrepModel(dictionary:dictionary?["salesRep"] as? [String:Any?])
        self.createdBy = dictionary?["createdBy"] as? Int

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["note"] = self.note
        if let objectArray = self.items {
            var dictionaryArray = [[String: Any?]]()
            for object in objectArray {
                dictionaryArray.append(object.jsonDictionary)
            }
            dictionary["items"] = dictionaryArray
        }
        dictionary["date"] = self.date
        dictionary["customer"] = self.customer?.jsonDictionary
        dictionary["modifiedBy"] = self.modifiedBy
        dictionary["endDeliveryDate"] = self.endDeliveryDate
        dictionary["idOrderForm"] = self.idOrderForm
        dictionary["status"] = self.status
        dictionary["modified"] = self.modified
        dictionary["id"] = self.id
        dictionary["created"] = self.created
        dictionary["startDeliveryDate"] = self.startDeliveryDate
        dictionary["orderForm"] = self.orderForm?.jsonDictionary
        dictionary["total"] = self.total
        dictionary["salesRep"] = self.salesRep?.jsonDictionary
        dictionary["createdBy"] = self.createdBy

        return dictionary

    }

}
