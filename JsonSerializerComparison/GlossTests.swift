//
//  GlossTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder on 1/18/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Gloss

class GlossTests: TestCase<GLMediumFile, GLLargeComplexFile, GLLargeSimpleArray> {
    
    override func deserializeLargeComplexObject(jsonString: String) -> GLLargeComplexFile? {
        guard let data = jsonString.data(using: .utf8, allowLossyConversion: true) else {
            return nil
        }
        return GLLargeComplexFile(data: data)
    }
    
    override func serializeLargeComplexObject(_ object: GLLargeComplexFile) -> String? {
        guard let dict = object.toJSON() else {
            return nil
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    override func deserializeLargeSimpleArray(jsonString: String) -> GLLargeSimpleArray? {
        guard let data = jsonString.data(using: .utf8, allowLossyConversion: true) else {
            return nil
        }
        return GLLargeSimpleArray(data: data)
    }
    
    override func serializeLargeSimpleArray(_ object: GLLargeSimpleArray) -> String? {
        guard let dict = object.toJSON() else {
            return nil
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    override func deserializeMediumFile(jsonString: String) -> GLMediumFile? {
        guard let data = jsonString.data(using: .utf8, allowLossyConversion: true) else {
            return nil
        }
        return GLMediumFile(data: data)
    }
    
    override func serializeMediumFile(_ object: GLMediumFile) -> String? {
        guard let dict = object.toJSON() else {
            return nil
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
        
}
