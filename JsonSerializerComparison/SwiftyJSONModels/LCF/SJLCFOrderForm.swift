//
//  SJLCFOrderForm.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLCFOrderForm: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let templateTerms = "templateTerms"
    static let name = "name"
    static let modified = "modified"
    static let paymentTerms = "paymentTerms"
    static let id = "id"
    static let created = "created"
    static let createdBy = "createdBy"
    static let active = "active"
    static let modifiedBy = "modifiedBy"
    static let salesTerritories = "salesTerritories"
    static let solutions = "solutions"
    static let season = "season"
  }

  // MARK: Properties
  public var templateTerms: String?
  public var name: String?
  public var modified: String?
  public var paymentTerms: [SJLCFPaymentTerms]?
  public var id: Int?
  public var created: String?
  public var createdBy: Int?
  public var active: Int?
  public var modifiedBy: Int?
  public var salesTerritories: [SJLCFSalesTerritories]?
  public var solutions: [SJLCFSolutions]?
  public var season: SJLCFSeason?

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
    templateTerms = json[SerializationKeys.templateTerms].string
    name = json[SerializationKeys.name].string
    modified = json[SerializationKeys.modified].string
    if let items = json[SerializationKeys.paymentTerms].array { paymentTerms = items.map { SJLCFPaymentTerms(json: $0) } }
    id = json[SerializationKeys.id].int
    created = json[SerializationKeys.created].string
    createdBy = json[SerializationKeys.createdBy].int
    active = json[SerializationKeys.active].int
    modifiedBy = json[SerializationKeys.modifiedBy].int
    if let items = json[SerializationKeys.salesTerritories].array { salesTerritories = items.map { SJLCFSalesTerritories(json: $0) } }
    if let items = json[SerializationKeys.solutions].array { solutions = items.map { SJLCFSolutions(json: $0) } }
    season = SJLCFSeason(json: json[SerializationKeys.season])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = templateTerms { dictionary[SerializationKeys.templateTerms] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = modified { dictionary[SerializationKeys.modified] = value }
    if let value = paymentTerms { dictionary[SerializationKeys.paymentTerms] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = active { dictionary[SerializationKeys.active] = value }
    if let value = modifiedBy { dictionary[SerializationKeys.modifiedBy] = value }
    if let value = salesTerritories { dictionary[SerializationKeys.salesTerritories] = value.map { $0.dictionaryRepresentation() } }
    if let value = solutions { dictionary[SerializationKeys.solutions] = value.map { $0.dictionaryRepresentation() } }
    if let value = season { dictionary[SerializationKeys.season] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.templateTerms = aDecoder.decodeObject(forKey: SerializationKeys.templateTerms) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.modified = aDecoder.decodeObject(forKey: SerializationKeys.modified) as? String
    self.paymentTerms = aDecoder.decodeObject(forKey: SerializationKeys.paymentTerms) as? [SJLCFPaymentTerms]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.active = aDecoder.decodeObject(forKey: SerializationKeys.active) as? Int
    self.modifiedBy = aDecoder.decodeObject(forKey: SerializationKeys.modifiedBy) as? Int
    self.salesTerritories = aDecoder.decodeObject(forKey: SerializationKeys.salesTerritories) as? [SJLCFSalesTerritories]
    self.solutions = aDecoder.decodeObject(forKey: SerializationKeys.solutions) as? [SJLCFSolutions]
    self.season = aDecoder.decodeObject(forKey: SerializationKeys.season) as? SJLCFSeason
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(templateTerms, forKey: SerializationKeys.templateTerms)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(modified, forKey: SerializationKeys.modified)
    aCoder.encode(paymentTerms, forKey: SerializationKeys.paymentTerms)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(active, forKey: SerializationKeys.active)
    aCoder.encode(modifiedBy, forKey: SerializationKeys.modifiedBy)
    aCoder.encode(salesTerritories, forKey: SerializationKeys.salesTerritories)
    aCoder.encode(solutions, forKey: SerializationKeys.solutions)
    aCoder.encode(season, forKey: SerializationKeys.season)
  }

}
