//
//  BSLargeComplexFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
public extension LargeComplexFile {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        if let orderDictArray = dict["data"] as? [[String:Any?]] {
            for item in orderDictArray {
                if let order = Order(dict: item) {
                    orders.append(order)
                }
            }
        }
        if let value = dict["total"] as? Int {
            total = value
        }
        if let value = dict["unfilteredTotal"] as? Int {
            unfilteredTotal = value
        }
        alertMessages = dict["alertMessage"] as? [String]
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        var orderDictArray: [[String:Any?]] = []
        for order in orders {
            orderDictArray.append(order.dict)
        }
        output["data"] = orderDictArray
        output["total"] = total
        output["unfilteredTotal"] = unfilteredTotal
        output["alertMessage"] = alertMessages
        return output
    }
    
}

public extension Order {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        idSalesTerritory = dict["idSalesTerritory"] as? Int
        date = dict["date"] as? String
        status = dict["status"] as? String
        if let value = dict["orderForm"] as? [String: Any?] {
            orderForm = OrderForm(dict: value)
        }
        idOrderForm = dict["idOrderForm"] as? Int
        idPaymentTerm = dict["idPaymentTerm"] as? Int
        total = dict["total"] as? Double
        if let valueArray = dict["items"] as? [[String:Any?]] {
            items = []
            for value in valueArray {
                if let item = OrderSolutionLineItem(dict: value) {
                    items?.append(item)
                }
            }
        }
        if let value = dict["customer"] as? [String: Any?] {
            customer = Person(dict: value)
        }
        if let value = dict["salesRep"] as? [String: Any?] {
            salesRep = Person(dict: value)
        }
        note = dict["note"] as? String
        if let value = dict["paymentTerm"] as? [String: Any?] {
            paymentTerm = PaymentTerm(dict: value)
        }
        startDeliveryDate = dict["startDeliveryDate"] as? String
        endDeliveryDate = dict["endDeliveryDate"] as? String
        created = dict["created"] as? String
        createdBy = dict["createdBy"] as? Int
        modified = dict["modified"] as? String
        modifiedBy = dict["modifiedBy"] as? Int
        signature = dict["signature"] as? String
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["idSalesTerritory"] = idSalesTerritory
        output["date"] = date
        output["status"] = status
        output["orderForm"] = orderForm?.dict
        output["idOrderForm"] = idOrderForm
        output["idPaymentTerm"] = idPaymentTerm
        output["total"] = total
        var itemDictArray: [[String: Any?]] = []
        if let itemArray = items {
            for item in itemArray {
                itemDictArray.append(item.dict)
            }
        }
        output["items"] = itemDictArray
        output["customer"] = customer?.dict
        output["salesRep"] = salesRep?.dict
        output["note"] = note
        output["paymentTerm"] = paymentTerm?.dict
        output["startDeliveryDate"] = startDeliveryDate
        output["endDeliveryDate"] = endDeliveryDate
        output["created"] = created
        output["createdBy"] = createdBy
        output["modified"] = modified
        output["modifiedBy"] = modified
        output["signature"] = signature
        return output
    }
    
}

public extension OrderSolutionLineItem {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        idSolution = dict["idSolution"] as? Int
        displayName = dict["displayName"] as? String
        subTotal = dict["subTotal"] as? Double
        quantity = dict["quantity"] as? Double
        idDiscountProgram = dict["idDiscountProgram"] as? Int
        price = dict["price"] as? Double
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["idSolution"] = idSolution
        output["displayName"] = displayName
        output["subTotal"] = subTotal
        output["quantity"] = quantity
        output["idDiscountProgram"] = idDiscountProgram
        output["price"] = price
        return output
    }
    
}


public extension Person {
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        displayName = dict["displayName"] as? String
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["displayName"] = displayName
        return output
    }
}


public extension OrderForm {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        name = dict["name"] as? String
        active = dict["active"] as? Int
        if let value = dict["season"] as? [String: Any?] {
            season = Season(dict: value)
        }
        if let valueArray = dict["salesTerritories"] as? [[String: Any?]] {
            for value in valueArray {
                if let obj = ObjectType(dict: value) {
                    salesTerritories.append(obj)
                }
            }
        }
        if let valueArray = dict["solutions"] as? [[String: Any?]] {
            for value in valueArray {
                if let obj = Solution(dict: value) {
                    solutions.append(obj)
                }
            }
        }
        if let valueArray = dict["paymentTerms"] as? [[String: Any?]] {
            for value in valueArray {
                if let obj = PaymentTerm(dict: value) {
                    paymentTerms.append(obj)
                }
            }
        }
        templateTerms = dict["templateTerms"] as? String
        created = dict["created"] as? String
        createdBy = dict["createdBy"] as? Int
        modified = dict["modified"] as? String
        modifiedBy = dict["modifiedBy"] as? Int
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["name"] = name
        output["active"] = active
        output["season"] = season?.dict
        var salesTerritoryDictArray: [[String: Any?]] = []
        for item in salesTerritories {
            salesTerritoryDictArray.append(item.dict)
        }
        output["salesTerritories"] = salesTerritoryDictArray
        var solutionsDictArray: [[String: Any?]] = []
        for item in solutions {
            solutionsDictArray.append(item.dict)
        }
        output["solutions"] = solutionsDictArray
        var paymentTermsDictArray: [[String: Any?]] = []
        for item in paymentTerms {
            paymentTermsDictArray.append(item.dict)
        }
        output["paymentTerms"] = paymentTermsDictArray
        output["templateTerms"] = templateTerms
        output["created"] = created
        output["createdBy"] = createdBy
        output["modified"] = modified
        output["modifiedBy"] = modifiedBy
        return output
    }
    
}

public extension Season {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        name = dict["name"] as? String
        year = dict["year"] as? Int
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["name"] = name
        output["year"] = year
        return output
    }
    
}

public extension ObjectType {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        name = dict["name"] as? String
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["name"] = name
        return output
    }
    
}

public extension Solution {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        displayName = dict["displayName"] as? String
        UOMName = dict["UOMName"] as? String
        if let value = dict["category"] as? [String: Any?] {
            category = ObjectType(dict: value)
        }
        if let dev = dict["deviations"] as? [String] {
            deviations = dev
        }
        if let value = dict["discountPrograms"] as? [[String: Any?]] {
            for item in value {
                if let c = DiscountProgram(dict: item) {
                    discountPrograms.append(c)
                }
            }
        }
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["displayName"] = displayName
        output["UOMName"] = UOMName
        output["category"] = category?.dict
        output["deviations"] = deviations
        var discountProgramsDictArray: [[String: Any?]] = []
        for item in discountPrograms {
            discountProgramsDictArray.append(item.dict)
        }
        output["discountPrograms"] = discountProgramsDictArray
        return output
    }
    
}

public extension DiscountProgram {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        name = dict["name"] as? String
        active = dict["active"] as? Int
        operation = dict["operation"] as? String
        programDescription = dict["description"] as? String
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["name"] = name
        output["active"] = active
        output["operation"] = operation
        output["description"] = programDescription
        return output
    }
    
}

public extension PaymentTerm {
    
    convenience init?(dict: [String: Any?]) {
        self.init()
        id = dict["id"] as? Int
        name = dict["name"] as? String
        paymentTermDescription = dict["description"] as? String
        active = dict["active"] as? Int
        operation = dict["operation"] as? String
    }
    public var dict: [String: Any?] {
        var output: [String: Any?] = [:]
        output["id"] = id
        output["name"] = name
        output["description"] = paymentTermDescription
        output["active"] = active
        output["operation"] = operation
        return output
    }
    
}


