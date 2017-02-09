//
//  ObjectMapperTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import ObjectMapper

class ObjectMapperTests: TestCase<OMMediumFile, OMLargeComplexFile, OMLargeSimpleArray> {
        
    override var testName: String {
        return "ObjectMapper"
    }
    
    override func deserializeLargeComplexObject(jsonString: String) -> OMLargeComplexFile? {
        return Mapper<OMLargeComplexFile>().map(JSONString: jsonString)
    }
    
    override func serializeLargeComplexObject(_ object: OMLargeComplexFile) -> String? {
        return object.toJSONString()
    }
    
    override func deserializeLargeSimpleArray(jsonString: String) -> OMLargeSimpleArray? {
        return Mapper<OMLargeSimpleArray>().map(JSONString: jsonString)
    }
    
    override func serializeLargeSimpleArray(_ object: OMLargeSimpleArray) -> String? {
        return object.toJSONString()
    }
    
    override func deserializeMediumFile(jsonString: String) -> OMMediumFile? {
        return Mapper<OMMediumFile>().map(JSONString: jsonString)
    }
    
    override func serializeMediumFile(_ object: OMMediumFile) -> String? {
        return object.toJSONString()
    }
    
}
