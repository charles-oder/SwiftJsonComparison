//
//  ObjectMapperTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import XCTest
import ObjectMapper

class ObjectMapperTests: BaseTests {
        
    override func deserializeLargeComplexObject(jsonString: String) -> LargeComplexFile? {
        return Mapper<OMLargeComplexFile>().map(JSONString: jsonString)
    }
    
    override func serializeLargeComplexObject(_ object: LargeComplexFile) -> String? {
        return (object as? OMLargeComplexFile)?.toJSONString()
    }
    
    override func deserializeLargeSimpleArray(jsonString: String) -> LargeSimpleArray? {
        return Mapper<OMLargeSimpleArray>().map(JSONString: jsonString)
    }
    
    override func serializeLargeSimpleArray(_ object: LargeSimpleArray) -> String? {
        return (object as? OMLargeSimpleArray)?.toJSONString()
    }
    
    override func deserializeMediumFile(jsonString: String) -> MediumFile? {
        return Mapper<OMMediumFile>().map(JSONString: jsonString)
    }
    
    override func serializeMediumFile(_ object: MediumFile) -> String? {
        return (object as? OMMediumFile)?.toJSONString()
    }
    
    
}
