//
//  GLLargeSimpleArray.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
import Gloss

public class GLLargeSimpleArray: Glossy {
    
    public var data = [GLQuoteEntry]()
    
    required public init?(json: JSON) {
        data    = "data" <~~ json ?? []
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "data" ~~> data
            ])
    }

}

public class GLQuoteEntry: Glossy {

    public var DateTime: String?
    public var Open: GLQuoteValue?
    public var High: GLQuoteValue?
    public var Low: GLQuoteValue?
    public var Close: GLQuoteValue?
    public var Volume: GLQuoteValue?
    
    required public init?(json: JSON) {
        DateTime    = "DateTime" <~~ json
        Open     = "Open" <~~ json
        High     = "High" <~~ json
        Low     = "Low" <~~ json
        Close     = "Close" <~~ json
        Volume     = "Volume" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "DateTime" ~~> DateTime,
            "Open" ~~> Open,
            "High" ~~> High,
            "Low" ~~> Low,
            "Close" ~~> Close,
            "Volume" ~~> Volume
            ])
    }

}

public class GLQuoteValue: Glossy {

    public var number: Double?
    public var text: String?

    required public init?(json: JSON) {
        number    = "number" <~~ json
        text      = "text" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "number" ~~> number,
            "text" ~~> text
            ])
    }

}
