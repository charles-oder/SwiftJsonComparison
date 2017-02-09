//
//  SJLSAOpen.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLSAOpen: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let number = "number"
    static let text = "text"
  }

  // MARK: Properties
  public var number: Float?
  public var text: String?

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
    number = json[SerializationKeys.number].float
    text = json[SerializationKeys.text].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = text { dictionary[SerializationKeys.text] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.number = aDecoder.decodeObject(forKey: SerializationKeys.number) as? Float
    self.text = aDecoder.decodeObject(forKey: SerializationKeys.text) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(number, forKey: SerializationKeys.number)
    aCoder.encode(text, forKey: SerializationKeys.text)
  }

}
