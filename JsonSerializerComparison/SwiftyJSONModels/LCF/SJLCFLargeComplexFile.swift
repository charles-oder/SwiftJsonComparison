//
//  SJLCFLargeComplexFile.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLCFLargeComplexFile: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let data = "data"
    static let unfilteredTotal = "unfilteredTotal"
  }

  // MARK: Properties
  public var total: Int?
  public var data: [SJLCFData]?
  public var unfilteredTotal: Int?

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
    total = json[SerializationKeys.total].int
    if let items = json[SerializationKeys.data].array { data = items.map { SJLCFData(json: $0) } }
    unfilteredTotal = json[SerializationKeys.unfilteredTotal].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    if let value = unfilteredTotal { dictionary[SerializationKeys.unfilteredTotal] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
    self.data = aDecoder.decodeObject(forKey: SerializationKeys.data) as? [SJLCFData]
    self.unfilteredTotal = aDecoder.decodeObject(forKey: SerializationKeys.unfilteredTotal) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(data, forKey: SerializationKeys.data)
    aCoder.encode(unfilteredTotal, forKey: SerializationKeys.unfilteredTotal)
  }

}
