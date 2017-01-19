//
//  SJMFSymbols.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJMFSymbols: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let symbol = "symbol"
    static let market = "market"
  }

  // MARK: Properties
  public var symbol: String?
  public var market: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    symbol = json[SerializationKeys.symbol].string
    market = json[SerializationKeys.market].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = symbol { dictionary[SerializationKeys.symbol] = value }
    if let value = market { dictionary[SerializationKeys.market] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.symbol = aDecoder.decodeObject(forKey: SerializationKeys.symbol) as? String
    self.market = aDecoder.decodeObject(forKey: SerializationKeys.market) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(symbol, forKey: SerializationKeys.symbol)
    aCoder.encode(market, forKey: SerializationKeys.market)
  }

}
