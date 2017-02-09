//
//  BaseTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import ObjectMapper

class BaseTests: TestCase<BSMBaseModel, BSLCBaseModel, BSLSABaseModel> {
    
    override var testName: String {
        return "Native"
    }
    
    
    override func deserializeLargeComplexObject(jsonString: String) -> BSLCBaseModel? {
        return BSLCBaseModel(json: jsonString)
    }
    
    override func serializeLargeComplexObject(_ object: BSLCBaseModel) -> String? {
        return object.jsonString
    }
    
    override func deserializeLargeSimpleArray(jsonString: String) -> BSLSABaseModel? {
        return BSLSABaseModel(json: jsonString)
    }
    
    override func serializeLargeSimpleArray(_ object: BSLSABaseModel) -> String? {
        return object.jsonString
    }
    
    override func deserializeMediumFile(jsonString: String) -> BSMBaseModel? {
        return BSMBaseModel(json: jsonString)
    }
    
    override func serializeMediumFile(_ object: BSMBaseModel) -> String? {
        return object.jsonString
    }
    
}
