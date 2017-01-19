//
//  SJLCFSolutions.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLCFSolutions: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let displayName = "displayName"
    static let uOM = "UOM"
    static let id = "id"
    static let category = "category"
    static let deviations = "deviations"
    static let discountPrograms = "discountPrograms"
  }

  // MARK: Properties
  public var displayName: String?
  public var uOM: String?
  public var id: Int?
  public var category: SJLCFCategory?
  public var deviations: [String]?
  public var discountPrograms: [SJLCFDiscountPrograms]?

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
    displayName = json[SerializationKeys.displayName].string
    uOM = json[SerializationKeys.uOM].string
    id = json[SerializationKeys.id].int
    category = SJLCFCategory(json: json[SerializationKeys.category])
    if let items = json[SerializationKeys.deviations].array { deviations = items.map { $0.stringValue } }
    if let items = json[SerializationKeys.discountPrograms].array { discountPrograms = items.map { SJLCFDiscountPrograms(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = displayName { dictionary[SerializationKeys.displayName] = value }
    if let value = uOM { dictionary[SerializationKeys.uOM] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = category { dictionary[SerializationKeys.category] = value.dictionaryRepresentation() }
    if let value = deviations { dictionary[SerializationKeys.deviations] = value }
    if let value = discountPrograms { dictionary[SerializationKeys.discountPrograms] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.displayName = aDecoder.decodeObject(forKey: SerializationKeys.displayName) as? String
    self.uOM = aDecoder.decodeObject(forKey: SerializationKeys.uOM) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.category = aDecoder.decodeObject(forKey: SerializationKeys.category) as? SJLCFCategory
    self.deviations = aDecoder.decodeObject(forKey: SerializationKeys.deviations) as? [String]
    self.discountPrograms = aDecoder.decodeObject(forKey: SerializationKeys.discountPrograms) as? [SJLCFDiscountPrograms]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(displayName, forKey: SerializationKeys.displayName)
    aCoder.encode(uOM, forKey: SerializationKeys.uOM)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(category, forKey: SerializationKeys.category)
    aCoder.encode(deviations, forKey: SerializationKeys.deviations)
    aCoder.encode(discountPrograms, forKey: SerializationKeys.discountPrograms)
  }

}
