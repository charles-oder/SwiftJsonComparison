//
//  LargeComplexFIle.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

import ObjectMapper

public class OMLargeComplexFile: Mappable {
    
    public var data = [OMOrder]()
    public var total: Int = 0
    public var unfilteredTotal: Int = 0
    public var alertMessages: [String]?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        data                <- map["data"]
        total               <- map["total"]
        unfilteredTotal     <- map["unfilteredTotal"]
        alertMessages       <- map["alertMessage"]
    }
    
}

public class OMOrder: Mappable {
    
    public var id: Int?
    public var date: String?
    public var status: String?
    public var orderForm: OMOrderForm?
    public var idOrderForm: Int?
    public var idPaymentTerm: Int?
    public var idSalesTerritory: Int?
    public var total: Double?
    public var items: [OMOrderSolutionLineItem]?
    public var customer: OMPerson?
    public var salesRep: OMPerson?
    public var paymentTerm: OMPaymentTerm?
    public var note: String?
    public var startDeliveryDate: String?
    public var endDeliveryDate: String?
    public var created: String?
    public var createdBy: Int?
    public var modified: String?
    public var modifiedBy: Int?
    public var signature: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map ["id"]
        idSalesTerritory        <- map ["idSalesTerritory"]
        date                    <- map ["date"]
        status                  <- map ["status"]
        orderForm            <- map ["orderForm"]
        idOrderForm             <- map ["idOrderForm"]
        idPaymentTerm           <- map ["idPaymentTerm"]
        total                   <- map ["total"]
        items                <- map ["items"]
        customer             <- map ["customer"]
        salesRep             <- map ["salesRep"]
        note                    <- map ["note"]
        paymentTerm          <- map ["paymentTerm"]
        startDeliveryDate       <- map ["startDeliveryDate"]
        endDeliveryDate         <- map ["endDeliveryDate"]
        created                 <- map ["created"]
        createdBy               <- map ["createdBy"]
        modified                <- map ["modified"]
        modifiedBy              <- map ["modifiedBy"]
        signature               <- map ["signature"]
    }
    
}

public class OMOrderSolutionLineItem: Mappable {
    
    public var idSolution: Int?
    public var displayName: String?
    public var subTotal: Double?
    public var quantity: Double?
    public var idDiscountProgram: Int?
    public var price: Double?

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



public class OMPerson: Mappable {
    
    public var id: Int?
    public var displayName: String?

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        displayName <- map["displayName"]
    }
}



public class OMOrderForm: Mappable {
    
    public var id: Int?
    public var name: String?
    public var active: Int?
    public var season: OMSeason?
    public var salesTerritories = [OMObjectType]()
    public var solutions = [OMSolution]()
    public var paymentTerms = [OMPaymentTerm]()
    public var templateTerms: String?
    public var created: String?
    public var createdBy: Int?
    public var modified: String?
    public var modifiedBy: Int?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map["id"]
        name                    <- map["name"]
        active                  <- map["active"]
        season               <- map["season"]
        salesTerritories     <- map["salesTerritories"]
        solutions            <- map["solutions"]
        paymentTerms         <- map["paymentTerms"]
        templateTerms           <- map["templateTerms"]
        created                 <- map["created"]
        createdBy               <- map["createdBy"]
        modified                <- map["modified"]
        modifiedBy              <- map["modifiedBy"]
    }
    
}

public class OMSeason: Mappable {
    
    public var year: Int?
    public var name: String?
    public var id: Int?

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        id      <- map["id"]
        year    <- map["year"]
    }

}

public class OMObjectType: Mappable {
    
    public var id: Int?
    public var name: String?

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        id      <- map["id"]
    }
    
}

public class OMSolution: Mappable {
    
    public var id: Int?
    public var displayName: String?
    public var UOMName: String?
    public var category: OMObjectType?
    public var deviations: [String] = []
    public var discountPrograms = [OMDiscountProgram]()
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id                      <- map["id"]
        displayName             <- map["displayName"]
        UOMName                 <- map["UOMName"]
        category             <- map["category"]
        deviations              <- map["deviations"]
        discountPrograms     <- map["discountPrograms"]
    }
    
}

public class OMDiscountProgram: Mappable {
    
    public var id: Int?
    public var name: String?
    public var active: Int?
    public var operation: String?
    public var programDescription: String?

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

public class OMPaymentTerm: Mappable {
    
    public var id: Int?
    public var name: String?
    public var paymentTermDescription: String?
    public var active: Int?
    public var operation: String?

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


