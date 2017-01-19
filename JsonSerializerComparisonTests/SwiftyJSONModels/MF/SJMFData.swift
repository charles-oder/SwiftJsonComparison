//
//  SJMFData.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJMFData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let last = "Last"
    static let pctChange = "PctChange"
    static let settlementPrice = "SettlementPrice"
    static let open = "Open"
    static let low = "Low"
    static let bid = "Bid"
    static let quoteDelay = "QuoteDelay"
    static let actualSymbol = "ActualSymbol"
    static let issueDescription = "IssueDescription"
    static let tradeDateTime = "TradeDateTime"
    static let change = "Change"
    static let settledate = "Settledate"
    static let high = "High"
    static let ask = "Ask"
    static let cumVolume = "CumVolume"
  }

  // MARK: Properties
  public var last: String?
  public var pctChange: String?
  public var settlementPrice: String?
  public var open: String?
  public var low: String?
  public var bid: String?
  public var quoteDelay: Int?
  public var actualSymbol: String?
  public var issueDescription: String?
  public var tradeDateTime: String?
  public var change: String?
  public var settledate: String?
  public var high: String?
  public var ask: String?
  public var cumVolume: Int?

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
    last = json[SerializationKeys.last].string
    pctChange = json[SerializationKeys.pctChange].string
    settlementPrice = json[SerializationKeys.settlementPrice].string
    open = json[SerializationKeys.open].string
    low = json[SerializationKeys.low].string
    bid = json[SerializationKeys.bid].string
    quoteDelay = json[SerializationKeys.quoteDelay].int
    actualSymbol = json[SerializationKeys.actualSymbol].string
    issueDescription = json[SerializationKeys.issueDescription].string
    tradeDateTime = json[SerializationKeys.tradeDateTime].string
    change = json[SerializationKeys.change].string
    settledate = json[SerializationKeys.settledate].string
    high = json[SerializationKeys.high].string
    ask = json[SerializationKeys.ask].string
    cumVolume = json[SerializationKeys.cumVolume].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = last { dictionary[SerializationKeys.last] = value }
    if let value = pctChange { dictionary[SerializationKeys.pctChange] = value }
    if let value = settlementPrice { dictionary[SerializationKeys.settlementPrice] = value }
    if let value = open { dictionary[SerializationKeys.open] = value }
    if let value = low { dictionary[SerializationKeys.low] = value }
    if let value = bid { dictionary[SerializationKeys.bid] = value }
    if let value = quoteDelay { dictionary[SerializationKeys.quoteDelay] = value }
    if let value = actualSymbol { dictionary[SerializationKeys.actualSymbol] = value }
    if let value = issueDescription { dictionary[SerializationKeys.issueDescription] = value }
    if let value = tradeDateTime { dictionary[SerializationKeys.tradeDateTime] = value }
    if let value = change { dictionary[SerializationKeys.change] = value }
    if let value = settledate { dictionary[SerializationKeys.settledate] = value }
    if let value = high { dictionary[SerializationKeys.high] = value }
    if let value = ask { dictionary[SerializationKeys.ask] = value }
    if let value = cumVolume { dictionary[SerializationKeys.cumVolume] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.last = aDecoder.decodeObject(forKey: SerializationKeys.last) as? String
    self.pctChange = aDecoder.decodeObject(forKey: SerializationKeys.pctChange) as? String
    self.settlementPrice = aDecoder.decodeObject(forKey: SerializationKeys.settlementPrice) as? String
    self.open = aDecoder.decodeObject(forKey: SerializationKeys.open) as? String
    self.low = aDecoder.decodeObject(forKey: SerializationKeys.low) as? String
    self.bid = aDecoder.decodeObject(forKey: SerializationKeys.bid) as? String
    self.quoteDelay = aDecoder.decodeObject(forKey: SerializationKeys.quoteDelay) as? Int
    self.actualSymbol = aDecoder.decodeObject(forKey: SerializationKeys.actualSymbol) as? String
    self.issueDescription = aDecoder.decodeObject(forKey: SerializationKeys.issueDescription) as? String
    self.tradeDateTime = aDecoder.decodeObject(forKey: SerializationKeys.tradeDateTime) as? String
    self.change = aDecoder.decodeObject(forKey: SerializationKeys.change) as? String
    self.settledate = aDecoder.decodeObject(forKey: SerializationKeys.settledate) as? String
    self.high = aDecoder.decodeObject(forKey: SerializationKeys.high) as? String
    self.ask = aDecoder.decodeObject(forKey: SerializationKeys.ask) as? String
    self.cumVolume = aDecoder.decodeObject(forKey: SerializationKeys.cumVolume) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(last, forKey: SerializationKeys.last)
    aCoder.encode(pctChange, forKey: SerializationKeys.pctChange)
    aCoder.encode(settlementPrice, forKey: SerializationKeys.settlementPrice)
    aCoder.encode(open, forKey: SerializationKeys.open)
    aCoder.encode(low, forKey: SerializationKeys.low)
    aCoder.encode(bid, forKey: SerializationKeys.bid)
    aCoder.encode(quoteDelay, forKey: SerializationKeys.quoteDelay)
    aCoder.encode(actualSymbol, forKey: SerializationKeys.actualSymbol)
    aCoder.encode(issueDescription, forKey: SerializationKeys.issueDescription)
    aCoder.encode(tradeDateTime, forKey: SerializationKeys.tradeDateTime)
    aCoder.encode(change, forKey: SerializationKeys.change)
    aCoder.encode(settledate, forKey: SerializationKeys.settledate)
    aCoder.encode(high, forKey: SerializationKeys.high)
    aCoder.encode(ask, forKey: SerializationKeys.ask)
    aCoder.encode(cumVolume, forKey: SerializationKeys.cumVolume)
  }

}
