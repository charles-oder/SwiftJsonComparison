//
//  LargeComplexFIle.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import UIKit

import Gloss

public class GLLargeComplexFile: Glossy {
    
    public var data = [GLOrder]()
    public var total: Int = 0
    public var unfilteredTotal: Int = 0
    public var alertMessages: [String]?
    
    public required init?(json: JSON) {
        data                = "data" <~~ json ?? []
        total               = "total" <~~ json ?? 0
        unfilteredTotal     = "unfilteredTotal" <~~ json ?? 0
        alertMessages       = "alertMessage" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "data" ~~> data,
            "total" ~~> total,
            "unfilteredTotal" ~~> unfilteredTotal,
            "alertMessage" ~~> alertMessages
            ])
    }

}

public class GLOrder: Glossy {
    
    public var id: Int?
    public var date: String?
    public var status: String?
    public var orderForm: GLOrderForm?
    public var idOrderForm: Int?
    public var idPaymentTerm: Int?
    public var idSalesTerritory: Int?
    public var total: Double?
    public var items: [GLOrderSolutionLineItem]?
    public var customer: GLPerson?
    public var salesRep: GLPerson?
    public var paymentTerm: GLPaymentTerm?
    public var note: String?
    public var startDeliveryDate: String?
    public var endDeliveryDate: String?
    public var created: String?
    public var createdBy: Int?
    public var modified: String?
    public var modifiedBy: Int?
    public var signature: String?
    
    required public init?(json: JSON) {
        id                      = "id" <~~ json
        idSalesTerritory        = "idSalesTerritory" <~~ json
        date                    = "date" <~~ json
        status                  = "status" <~~ json
        orderForm            = "orderForm" <~~ json
        idOrderForm             = "idOrderForm" <~~ json
        idPaymentTerm           = "idPaymentTerm" <~~ json
        total                   = "total" <~~ json
        items                = "items" <~~ json
        customer             = "customer" <~~ json
        salesRep             = "salesRep" <~~ json
        note                    = "note" <~~ json
        paymentTerm          = "paymentTerm" <~~ json
        startDeliveryDate       = "startDeliveryDate" <~~ json
        endDeliveryDate         = "endDeliveryDate" <~~ json
        created                 = "created" <~~ json
        createdBy               = "createdBy" <~~ json
        modified                = "modified" <~~ json
        modifiedBy              = "modifiedBy" <~~ json
        signature               = "signature" <~~ json
    }
    
    public func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> id,
            "idSalesTerritory" ~~> idSalesTerritory,
            "date" ~~> date,
            "status" ~~> status,
            "orderForm" ~~> orderForm,
            "idOrderForm" ~~> idOrderForm,
            "idPaymentTerm" ~~> idPaymentTerm,
            "total" ~~> total,
            "items" ~~> items,
            "customer" ~~> customer,
            "salesRep" ~~> salesRep,
            "note" ~~> note,
            "paymentTerm" ~~> paymentTerm,
            "startDeliveryDate" ~~> startDeliveryDate,
            "endDeliveryDate" ~~> endDeliveryDate,
            "created" ~~> created,
            "createdBy" ~~> createdBy,
            "modified" ~~> modified,
            "modifiedBy" ~~> modifiedBy,
            "signature" ~~> signature
            ])
    }

}

public class GLOrderSolutionLineItem: Glossy {
    
    public var idSolution: Int?
    public var displayName: String?
    public var subTotal: Double?
    public var quantity: Double?
    public var idDiscountProgram: Int?
    public var price: Double?

    required public init?(json: JSON) {
        idSolution          = "idSolution" <~~ json
        displayName         = "displayName" <~~ json
        subTotal            = "subTotal" <~~ json
        quantity            = "quantity" <~~ json
        idDiscountProgram   = "idDiscountProgram" <~~ json
        price               = "price" <~~ json
    }
    
    public func toJSON() -> JSON? {
        return jsonify([
            "idSolution" ~~> idSolution,
            "displayName" ~~> displayName,
            "subTotal" ~~> subTotal,
            "quantity" ~~> quantity,
            "idDiscountProgram" ~~> idDiscountProgram,
            "price" ~~> price
            ])
    }
}



public class GLPerson: Glossy {
    
    public var id: Int?
    public var displayName: String?

    required public init?(json: JSON) {
        id          = "id" <~~ json
        displayName = "displayName" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> id,
            "displayName" ~~> displayName
            ])
    }
}



public class GLOrderForm: Glossy {
    
    public var id: Int?
    public var name: String?
    public var active: Int?
    public var season: GLSeason?
    public var salesTerritories = [GLObjectType]()
    public var solutions = [GLSolution]()
    public var paymentTerms = [GLPaymentTerm]()
    public var templateTerms: String?
    public var created: String?
    public var createdBy: Int?
    public var modified: String?
    public var modifiedBy: Int?
    
    public required init?(json: JSON) {
        id                      = "id" <~~ json
        name                    = "name" <~~ json
        active                  = "active" <~~ json
        season               = "season" <~~ json
        salesTerritories     = "salesTerritories" <~~ json ?? []
        solutions            = "solutions" <~~ json ?? []
        paymentTerms         = "paymentTerms" <~~ json ?? []
        templateTerms           = "templateTerms" <~~ json
        created                 = "created" <~~ json
        createdBy               = "createdBy" <~~ json
        modified                = "modified" <~~ json
        modifiedBy              = "modifiedBy" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> id,
            "name" ~~> name,
            "active" ~~> active,
            "season" ~~> season,
            "salesTerritories" ~~> salesTerritories,
            "solutions" ~~> solutions,
            "paymentTerms" ~~> paymentTerms,
            "templateTerms" ~~> templateTerms,
            "created" ~~> created,
            "createdBy" ~~> createdBy,
            "modified" ~~> modified,
            "modifiedBy" ~~> modifiedBy
            ])
    }

}

public class GLSeason: Glossy {
    
    public var year: Int?
    public var name: String?
    public var id: Int?

    required public init?(json: JSON) {
        name    = "name" <~~ json
        id      = "id" <~~ json
        year    = "year" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> name,
            "id" ~~> id,
            "year" ~~> year
            ])
    }

}

public class GLObjectType: Glossy {
    
    public var id: Int?
    public var name: String?

    required public init?(json: JSON) {
        name    = "name" <~~ json
        id      = "id" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> name,
            "id" ~~> id
            ])
    }

}

public class GLSolution: Glossy {
    
    public var id: Int?
    public var displayName: String?
    public var UOMName: String?
    public var category: GLObjectType?
    public var deviations: [String] = []
    public var discountPrograms = [GLDiscountProgram]()
    
    required public init?(json: JSON) {
        id                      = "id" <~~ json
        displayName             = "displayName" <~~ json
        UOMName                 = "UOMName" <~~ json
        category             = "category" <~~ json
        deviations              = "deviations" <~~ json ?? []
        discountPrograms     = "discountPrograms" <~~ json ?? []
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> id,
            "displayName" ~~> displayName,
            "UOMName" ~~> UOMName,
            "category" ~~> category,
            "deviations" ~~> deviations,
            "discountPrograms" ~~> discountPrograms
            ])
    }

}

public class GLDiscountProgram: Glossy {
    
    public var id: Int?
    public var name: String?
    public var active: Int?
    public var operation: String?
    public var programDescription: String?

    public required init?(json: JSON) {
        id                  = "id" <~~ json
        name                = "name" <~~ json
        active              = "active" <~~ json
        operation           = "operation" <~~ json
        programDescription  = "description" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> id,
            "name" ~~> name,
            "active" ~~> active,
            "operation" ~~> operation,
            "description" ~~> programDescription
            ])
    }

}

public class GLPaymentTerm: Glossy {
    
    public var id: Int?
    public var name: String?
    public var paymentTermDescription: String?
    public var active: Int?
    public var operation: String?

    required public init?(json: JSON) {
        id                      = "id" <~~ json
        name                    = "name" <~~ json
        paymentTermDescription  = "description" <~~ json
        active                  = "active" <~~ json
        operation               = "operation" <~~ json
    }
    
    public func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> id,
            "name" ~~> name,
            "active" ~~> active,
            "operation" ~~> operation,
            "description" ~~> paymentTermDescription
            ])
    }

}


