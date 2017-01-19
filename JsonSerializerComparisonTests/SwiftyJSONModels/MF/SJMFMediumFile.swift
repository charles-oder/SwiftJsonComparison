//
//  SJMFMediumFile.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJMFMediumFile: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let meta = "meta"
    static let data = "data"
  }

  // MARK: Properties
  public var meta: SJMFMeta?
  public var data: [SJMFData]?

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
    meta = SJMFMeta(json: json[SerializationKeys.meta])
    if let items = json[SerializationKeys.data].array { data = items.map { SJMFData(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = meta { dictionary[SerializationKeys.meta] = value.dictionaryRepresentation() }
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.meta = aDecoder.decodeObject(forKey: SerializationKeys.meta) as? SJMFMeta
    self.data = aDecoder.decodeObject(forKey: SerializationKeys.data) as? [SJMFData]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(meta, forKey: SerializationKeys.meta)
    aCoder.encode(data, forKey: SerializationKeys.data)
  }

}
