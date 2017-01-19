//
//  SJMFMeta.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJMFMeta: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let symbols = "symbols"
    static let requestId = "requestId"
    static let expression = "expression"
    static let command = "command"
  }

  // MARK: Properties
  public var status: Int?
  public var symbols: [SJMFSymbols]?
  public var requestId: Int?
  public var expression: String?
  public var command: String?

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
    status = json[SerializationKeys.status].int
    if let items = json[SerializationKeys.symbols].array { symbols = items.map { SJMFSymbols(json: $0) } }
    requestId = json[SerializationKeys.requestId].int
    expression = json[SerializationKeys.expression].string
    command = json[SerializationKeys.command].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = symbols { dictionary[SerializationKeys.symbols] = value.map { $0.dictionaryRepresentation() } }
    if let value = requestId { dictionary[SerializationKeys.requestId] = value }
    if let value = expression { dictionary[SerializationKeys.expression] = value }
    if let value = command { dictionary[SerializationKeys.command] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.symbols = aDecoder.decodeObject(forKey: SerializationKeys.symbols) as? [SJMFSymbols]
    self.requestId = aDecoder.decodeObject(forKey: SerializationKeys.requestId) as? Int
    self.expression = aDecoder.decodeObject(forKey: SerializationKeys.expression) as? String
    self.command = aDecoder.decodeObject(forKey: SerializationKeys.command) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(symbols, forKey: SerializationKeys.symbols)
    aCoder.encode(requestId, forKey: SerializationKeys.requestId)
    aCoder.encode(expression, forKey: SerializationKeys.expression)
    aCoder.encode(command, forKey: SerializationKeys.command)
  }

}
