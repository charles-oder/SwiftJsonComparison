//
//  BaseSerializer.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public class BaseSerializer {
    
    func deserializeLargeComplexObject(jsonString: String) -> LargeComplexFile? {
        return nil
    }
    
    func serializeLargeComplexObject(_ object: LargeComplexFile) -> String? {
        return nil
    }
    
    func deserializeLargeSimpleArray(jsonString: String) -> LargeSimpleArray? {
        if let dict = getDictForJsonString(json: jsonString) {
            return LargeSimpleArray(dict: dict)
        }
        return nil
    }
    
    func serializeLargeSimpleArray(_ object: LargeSimpleArray) -> String? {
        return getJsonStringFromDict(dict: object.dict)
    }
    
    func deserializeMediumFile(jsonString: String) -> MediumFile? {
        if let dict = getDictForJsonString(json: jsonString) {
            return MediumFile(dict: dict)
        }
        return nil
    }
    
    func serializeMediumFile(_ object: MediumFile) -> String? {
        return getJsonStringFromDict(dict: object.dict)
    }
    
    private func getJsonStringFromDict(dict: [String: Any?]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    private func getDictForJsonString(json: String) -> [String: Any?]? {
        guard let data = json.data(using: .utf8) else {
            return nil
        }
        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any?]
        } catch {
            return nil
        }
    }
    

}
