//
//  SJLSAData.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLSAData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let close = "Close"
    static let volume = "Volume"
    static let open = "Open"
    static let low = "Low"
    static let dateTime = "DateTime"
    static let high = "High"
  }

  // MARK: Properties
  public var close: SJLSAClose?
  public var volume: SJLSAVolume?
  public var open: SJLSAOpen?
  public var low: SJLSALow?
  public var dateTime: String?
  public var high: SJLSAHigh?

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
    close = SJLSAClose(json: json[SerializationKeys.close])
    volume = SJLSAVolume(json: json[SerializationKeys.volume])
    open = SJLSAOpen(json: json[SerializationKeys.open])
    low = SJLSALow(json: json[SerializationKeys.low])
    dateTime = json[SerializationKeys.dateTime].string
    high = SJLSAHigh(json: json[SerializationKeys.high])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = close { dictionary[SerializationKeys.close] = value.dictionaryRepresentation() }
    if let value = volume { dictionary[SerializationKeys.volume] = value.dictionaryRepresentation() }
    if let value = open { dictionary[SerializationKeys.open] = value.dictionaryRepresentation() }
    if let value = low { dictionary[SerializationKeys.low] = value.dictionaryRepresentation() }
    if let value = dateTime { dictionary[SerializationKeys.dateTime] = value }
    if let value = high { dictionary[SerializationKeys.high] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.close = aDecoder.decodeObject(forKey: SerializationKeys.close) as? SJLSAClose
    self.volume = aDecoder.decodeObject(forKey: SerializationKeys.volume) as? SJLSAVolume
    self.open = aDecoder.decodeObject(forKey: SerializationKeys.open) as? SJLSAOpen
    self.low = aDecoder.decodeObject(forKey: SerializationKeys.low) as? SJLSALow
    self.dateTime = aDecoder.decodeObject(forKey: SerializationKeys.dateTime) as? String
    self.high = aDecoder.decodeObject(forKey: SerializationKeys.high) as? SJLSAHigh
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(close, forKey: SerializationKeys.close)
    aCoder.encode(volume, forKey: SerializationKeys.volume)
    aCoder.encode(open, forKey: SerializationKeys.open)
    aCoder.encode(low, forKey: SerializationKeys.low)
    aCoder.encode(dateTime, forKey: SerializationKeys.dateTime)
    aCoder.encode(high, forKey: SerializationKeys.high)
  }

}
