//
//  SJLCFItems.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLCFItems: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let idSolution = "idSolution"
    static let displayName = "displayName"
    static let quantity = "quantity"
    static let idDiscountProgram = "idDiscountProgram"
    static let price = "price"
    static let subTotal = "subTotal"
  }

  // MARK: Properties
  public var idSolution: Int?
  public var displayName: String?
  public var quantity: Int?
  public var idDiscountProgram: Int?
  public var price: Float?
  public var subTotal: Float?

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
    idSolution = json[SerializationKeys.idSolution].int
    displayName = json[SerializationKeys.displayName].string
    quantity = json[SerializationKeys.quantity].int
    idDiscountProgram = json[SerializationKeys.idDiscountProgram].int
    price = json[SerializationKeys.price].float
    subTotal = json[SerializationKeys.subTotal].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = idSolution { dictionary[SerializationKeys.idSolution] = value }
    if let value = displayName { dictionary[SerializationKeys.displayName] = value }
    if let value = quantity { dictionary[SerializationKeys.quantity] = value }
    if let value = idDiscountProgram { dictionary[SerializationKeys.idDiscountProgram] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    if let value = subTotal { dictionary[SerializationKeys.subTotal] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.idSolution = aDecoder.decodeObject(forKey: SerializationKeys.idSolution) as? Int
    self.displayName = aDecoder.decodeObject(forKey: SerializationKeys.displayName) as? String
    self.quantity = aDecoder.decodeObject(forKey: SerializationKeys.quantity) as? Int
    self.idDiscountProgram = aDecoder.decodeObject(forKey: SerializationKeys.idDiscountProgram) as? Int
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? Float
    self.subTotal = aDecoder.decodeObject(forKey: SerializationKeys.subTotal) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(idSolution, forKey: SerializationKeys.idSolution)
    aCoder.encode(displayName, forKey: SerializationKeys.displayName)
    aCoder.encode(quantity, forKey: SerializationKeys.quantity)
    aCoder.encode(idDiscountProgram, forKey: SerializationKeys.idDiscountProgram)
    aCoder.encode(price, forKey: SerializationKeys.price)
    aCoder.encode(subTotal, forKey: SerializationKeys.subTotal)
  }

}
