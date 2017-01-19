//
//  LargeComplexFIle.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

import ObjectMapper

public class OMLargeComplexFile: LargeComplexFile, Mappable {
    
    var omOrders: [OMOrder] = [] { didSet { orders = omOrders } }
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        omOrders            <- map["data"]
        total               <- map["total"]
        unfilteredTotal     <- map["unfilteredTotal"]
        alertMessages       <- map["alertMessage"]
    }
    
}

public class OMOrder: Order, Mappable {
    
    var om_orderForm: OMOrderForm? { didSet { orderForm = om_orderForm } }
    var om_items: [OMOrderSolutionLineItem]? { didSet { items = om_items } }
    var om_customer: OMPerson? { didSet { customer = om_customer } }
    var om_salesRep: OMPerson? { didSet { salesRep = om_salesRep } }
    var om_paymentTerm: OMPaymentTerm? { didSet { paymentTerm = om_paymentTerm } }
    
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map ["id"]
        idSalesTerritory        <- map ["idSalesTerritory"]
        date                    <- map ["date"]
        status                  <- map ["status"]
        om_orderForm            <- map ["orderForm"]
        idOrderForm             <- map ["idOrderForm"]
        idPaymentTerm           <- map ["idPaymentTerm"]
        total                   <- map ["total"]
        om_items                <- map ["items"]
        om_customer             <- map ["customer"]
        om_salesRep             <- map ["salesRep"]
        note                    <- map ["note"]
        om_paymentTerm          <- map ["paymentTerm"]
        startDeliveryDate       <- map ["startDeliveryDate"]
        endDeliveryDate         <- map ["endDeliveryDate"]
        created                 <- map ["created"]
        createdBy               <- map ["createdBy"]
        modified                <- map ["modified"]
        modifiedBy              <- map ["modifiedBy"]
        signature               <- map ["signature"]
    }
    
}

public class OMOrderSolutionLineItem: OrderSolutionLineItem, Mappable {
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        idSolution          <- map ["idSolution"]
        displayName         <- map ["displayName"]
        subTotal            <- map ["subTotal"]
        quantity            <- map ["quantity"]
        idDiscountProgram   <- map ["idDiscountProgram"]
        price               <- map ["price"]
    }
    
}



public class OMPerson: Person, Mappable {
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        displayName <- map["displayName"]
    }
}



public class OMOrderForm: OrderForm, Mappable {
    
    var om_season: OMSeason? { didSet { season = om_season } }
    var om_salesTerritories: [OMObjectType] = [] { didSet { salesTerritories = om_salesTerritories } }
    var om_solutions: [OMSolution] = [] { didSet { solutions = om_solutions } }
    var om_paymentTerms: [OMPaymentTerm] = [] { didSet { paymentTerms = om_paymentTerms } }
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map["id"]
        name                    <- map["name"]
        active                  <- map["active"]
        om_season               <- map["season"]
        om_salesTerritories     <- map["salesTerritories"]
        om_solutions            <- map["solutions"]
        om_paymentTerms         <- map["paymentTerms"]
        templateTerms           <- map["templateTerms"]
        created                 <- map["created"]
        createdBy               <- map["createdBy"]
        modified                <- map["modified"]
        modifiedBy              <- map["modifiedBy"]
    }
    
}

public class OMSeason: Season, Mappable {
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        id      <- map["id"]
        year    <- map["year"]
    }

}

public class OMObjectType: ObjectType, Mappable {
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        id      <- map["id"]
    }
    
}

public class OMSolution: Solution, Mappable {
    
    var om_category: OMObjectType? { didSet { category = om_category } }
    var om_discountPrograms: [OMDiscountProgram] = [] { didSet { discountPrograms = om_discountPrograms } }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map["id"]
        displayName             <- map["displayName"]
        UOMName                     <- map["UOMName"]
        om_category             <- map["category"]
        deviations              <- map["deviations"]
        om_discountPrograms     <- map["discountPrograms"]
    }
    
}

public class OMDiscountProgram: DiscountProgram, Mappable {
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        active              <- map["active"]
        operation           <- map["operation"]
        programDescription  <- map["description"]
    }
    
}

public class OMPaymentTerm: PaymentTerm, Mappable {
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map["id"]
        name                    <- map["name"]
        paymentTermDescription  <- map["description"]
        active                  <- map["active"]
        operation               <- map["operation"]
    }
    
    
}


