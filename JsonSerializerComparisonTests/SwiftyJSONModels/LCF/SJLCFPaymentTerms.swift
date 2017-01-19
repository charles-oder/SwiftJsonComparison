//
//  SJLCFPaymentTerms.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLCFPaymentTerms: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let descriptionValue = "description"
    static let name = "name"
    static let active = "active"
    static let id = "id"
    static let operation = "operation"
  }

  // MARK: Properties
  public var descriptionValue: String?
  public var name: String?
  public var active: Int?
  public var id: Int?
  public var operation: String?

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
    descriptionValue = json[SerializationKeys.descriptionValue].string
    name = json[SerializationKeys.name].string
    active = json[SerializationKeys.active].int
    id = json[SerializationKeys.id].int
    operation = json[SerializationKeys.operation].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = active { dictionary[SerializationKeys.active] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = operation { dictionary[SerializationKeys.operation] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.active = aDecoder.decodeObject(forKey: SerializationKeys.active) as? Int
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.operation = aDecoder.decodeObject(forKey: SerializationKeys.operation) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(active, forKey: SerializationKeys.active)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(operation, forKey: SerializationKeys.operation)
  }

}
