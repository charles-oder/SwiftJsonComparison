//
//  OMLargeSimpleArray.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
import ObjectMapper

public class OMLargeSimpleArray: LargeSimpleArray, Mappable {
    
    public var om_data = [OMQuoteEntry]() { didSet { data = om_data } }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        om_data    <- map["data"]
    }
    
}

public class OMQuoteEntry: QuoteEntry, Mappable {

    public var om_open: OMQuoteValue? { didSet { Open = om_open } }
    public var om_high: OMQuoteValue? { didSet { High = om_high } }
    public var om_low: OMQuoteValue? { didSet { Low = om_low } }
    public var om_close: OMQuoteValue? { didSet { Close = om_close } }
    public var om_volume: OMQuoteValue? { didSet { Volume = om_volume } }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        DateTime    <- map["DateTime"]
        om_open     <- map["Open"]
        om_high     <- map["High"]
        om_low     <- map["Low"]
        om_close     <- map["Close"]
        om_volume     <- map["Volume"]
    }
    
}

public class OMQuoteValue: QuoteValue, Mappable {

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        number    <- map["number"]
        text      <- map["text"]
    }
    
}
