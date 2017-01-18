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
        return nil
    }
    
    func serializeLargeSimpleArray(_ object: LargeSimpleArray) -> String? {
        return nil
    }
    
    func deserializeMediumFile(jsonString: String) -> MediumFile? {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        do {
            let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any?]
            return MediumFile(dict: dict)
        } catch {
            return nil
        }
    }
    
    func serializeMediumFile(_ object: MediumFile) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object.dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    

}
