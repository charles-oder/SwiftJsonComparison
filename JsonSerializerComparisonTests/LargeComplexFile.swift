//
//  LargeComplexFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public class LargeComplexFile {
    
    public var orders = [Order]()
    public var total: Int = 0
    public var unfilteredTotal: Int = 0
    public var alertMessages: [String]?
    
}

public class Order {
    
    public var id: Int?
    public var date: String?
    public var status: String?
    public var orderForm: OrderForm?
    public var idOrderForm: Int?
    public var idPaymentTerm: Int?
    public var idSalesTerritory: Int?
    public var total: Double?
    public var items: [OrderSolutionLineItem]?
    public var customer: Person?
    public var salesRep: Person?
    public var paymentTerm: PaymentTerm?
    public var note: String?
    public var startDeliveryDate: String?
    public var endDeliveryDate: String?
    public var created: String?
    public var createdBy: Int?
    public var modified: String?
    public var modifiedBy: Int?
    public var signature: String?
    
    
}

public class OrderSolutionLineItem {
    
    public var idSolution: Int?
    public var displayName: String?
    public var subTotal: Double?
    public var quantity: Double?
    public var idDiscountProgram: Int?
    public var price: Double?
    
}


public class Person {
    public var id: Int?
    public var displayName: String?
}


public class OrderForm {
    
    public var id: Int?
    public var name: String?
    public var active: Int?
    public var season: Season?
    public var salesTerritories = [ObjectType]()
    public var solutions = [Solution]()
    public var paymentTerms = [PaymentTerm]()
    public var templateTerms: String?
    public var created: String?
    public var createdBy: Int?
    public var modified: String?
    public var modifiedBy: Int?
    
}

public class Season {
    
    public var year: Int?
    public var name: String?
    public var id: Int?
    
}

public class ObjectType {
    
    public var id: Int?
    public var name: String?
    
}

public class Solution {
    
    public var id: Int?
    public var displayName: String?
    public var UOMName: String?
    public var category: ObjectType?
    public var deviations: [String] = []
    public var discountPrograms = [DiscountProgram]()
    
}

public class DiscountProgram {
    
    public var id: Int?
    public var name: String?
    public var active: Int?
    public var operation: String?
    public var programDescription: String?
    
}

public class PaymentTerm {
    
    public var id: Int?
    public var name: String?
    public var paymentTermDescription: String?
    public var active: Int?
    public var operation: String?
    
}


