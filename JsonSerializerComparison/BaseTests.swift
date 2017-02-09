//
//  BaseTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import ObjectMapper

class BaseTests: TestCase {
    
    static let iterations = 10
    
    func deserializeLargeComplexObject(jsonString: String) -> BSLCBaseModel? {
        return BSLCBaseModel(json: jsonString)
    }
    
    func serializeLargeComplexObject(_ object: BSLCBaseModel) -> String? {
        return object.jsonString
    }
    
    func deserializeLargeSimpleArray(jsonString: String) -> BSLSABaseModel? {
        return BSLSABaseModel(json: jsonString)
    }
    
    func serializeLargeSimpleArray(_ object: BSLSABaseModel) -> String? {
        return object.jsonString
    }
    
    func deserializeMediumFile(jsonString: String) -> BSMBaseModel? {
        return BSMBaseModel(json: jsonString)
    }
    
    func serializeMediumFile(_ object: BSMBaseModel) -> String? {
        return object.jsonString
    }
    
    func testSerializeLargeComplexObject() -> [Double] {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
        
        let testObject = self.deserializeLargeComplexObject(jsonString: jsonString)
        
        
        return measureBlock { [weak self] in
            
            _ = self?.serializeLargeComplexObject(testObject!)
        }
        
        
    }
    
    func testDeserializeLargeComplexObject() -> [Double] {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
        
        let testObject = deserializeLargeComplexObject(jsonString: jsonString)

        assertLargeComplexObject(json: serializeLargeComplexObject(testObject!))
        
        return measureBlock { [weak self] in
            _ = self?.deserializeLargeComplexObject(jsonString: jsonString)
        }
        

    }
    
    func testSerializeLargeSimpleArray() -> [Double] {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeSimpleArray")
        
        let testObject = self.deserializeLargeSimpleArray(jsonString: jsonString)
        
        let jsonOutput = serializeLargeSimpleArray(testObject!)
        
        assertLargeSimpleArray(json: jsonOutput!)
        
        return measureBlock { [weak self] in
            _ = self?.serializeLargeSimpleArray(testObject!)
        }
        
    }
    
    func testDeserializeLargeSimpleArray() -> [Double] {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeSimpleArray")
        
        let testObject = deserializeLargeSimpleArray(jsonString: jsonString)
        
        assertLargeSimpleArray(json: serializeLargeSimpleArray(testObject!))
        
        return measureBlock { [weak self] in
            _ = self?.deserializeLargeSimpleArray(jsonString: jsonString)
        }
        
    }
    
    func testSerializeMediumFile() -> [Double] {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "MediumFile")
        
        let testObject = self.deserializeMediumFile(jsonString: jsonString)
        let jsonOutput = serializeMediumFile(testObject!)
        
        assertMediumFile(json: jsonOutput)

        return measureBlock { [weak self] in
            _ = self?.serializeMediumFile(testObject!)
        }
        
        
    }
    
    func testDeserializeMediumFile() -> [Double] {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "MediumFile")
        
        let testObject = deserializeMediumFile(jsonString: jsonString)!
        
        assertMediumFile(json: serializeMediumFile(testObject))
        
        
        return measureBlock { [weak self] in
            _ = self?.deserializeMediumFile(jsonString: jsonString)
        }
    }
    
}
