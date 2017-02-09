//
//  SwiftyJSONTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder on 1/18/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import SwiftyJSON

class SwiftyJSONTests: TestCase<SJMFMediumFile, SJLCFLargeComplexFile, SJLSALargeSimpleArray> {
    
    override var testName: String {
        return "SwiftyJSON"
    }
    
    override func deserializeLargeComplexObject(jsonString: String) -> SJLCFLargeComplexFile? {
        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            return SJLCFLargeComplexFile(json: json)
        }

        return nil
    }
    
    override func serializeLargeComplexObject(_ object: SJLCFLargeComplexFile) -> String? {
        return JSON(object.dictionaryRepresentation()).rawString()
    }
    
    override func deserializeLargeSimpleArray(jsonString: String) -> SJLSALargeSimpleArray? {
        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            return SJLSALargeSimpleArray(json: json)
        }
        
        return nil
    }
    
    override func serializeLargeSimpleArray(_ object: SJLSALargeSimpleArray) -> String? {
        return JSON(object.dictionaryRepresentation()).rawString()
    }
    
    override func deserializeMediumFile(jsonString: String) -> SJMFMediumFile? {
        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            return SJMFMediumFile(json: json)
        }
        
        return nil
    }
    
    override func serializeMediumFile(_ object: SJMFMediumFile) -> String? {
        return JSON(object.dictionaryRepresentation()).rawString()
    }
    
}
