//
//  OMLargeSimpleArray.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
import ObjectMapper

public class OMLargeSimpleArray: Mappable {
    
    public var data = [OMQuoteEntry]()
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        data    <- map["data"]
    }
    
}

public class OMQuoteEntry: Mappable {

    public var DateTime: String?
    public var Open: OMQuoteValue?
    public var High: OMQuoteValue?
    public var Low: OMQuoteValue?
    public var Close: OMQuoteValue?
    public var Volume: OMQuoteValue?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        DateTime    <- map["DateTime"]
        Open     <- map["Open"]
        High     <- map["High"]
        Low     <- map["Low"]
        Close     <- map["Close"]
        Volume     <- map["Volume"]
    }
    
}

public class OMQuoteValue: Mappable {

    public var number: Double?
    public var text: String?

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        number    <- map["number"]
        text      <- map["text"]
    }
    
}
