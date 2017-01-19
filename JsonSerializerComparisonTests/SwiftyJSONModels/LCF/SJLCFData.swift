//
//  SJLCFData.swift
//
//  Created by Charles Oder on 1/18/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class SJLCFData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let note = "note"
    static let items = "items"
    static let date = "date"
    static let customer = "customer"
    static let modifiedBy = "modifiedBy"
    static let endDeliveryDate = "endDeliveryDate"
    static let idOrderForm = "idOrderForm"
    static let status = "status"
    static let modified = "modified"
    static let id = "id"
    static let created = "created"
    static let startDeliveryDate = "startDeliveryDate"
    static let orderForm = "orderForm"
    static let total = "total"
    static let salesRep = "salesRep"
    static let createdBy = "createdBy"
  }

  // MARK: Properties
  public var note: String?
  public var items: [SJLCFItems]?
  public var date: String?
  public var customer: SJLCFCustomer?
  public var modifiedBy: Int?
  public var endDeliveryDate: String?
  public var idOrderForm: Int?
  public var status: String?
  public var modified: String?
  public var id: Int?
  public var created: String?
  public var startDeliveryDate: String?
  public var orderForm: SJLCFOrderForm?
  public var total: Float?
  public var salesRep: SJLCFSalesRep?
  public var createdBy: Int?

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
    note = json[SerializationKeys.note].string
    if let items = json[SerializationKeys.items].array { self.items = items.map { SJLCFItems(json: $0) } }
    date = json[SerializationKeys.date].string
    customer = SJLCFCustomer(json: json[SerializationKeys.customer])
    modifiedBy = json[SerializationKeys.modifiedBy].int
    endDeliveryDate = json[SerializationKeys.endDeliveryDate].string
    idOrderForm = json[SerializationKeys.idOrderForm].int
    status = json[SerializationKeys.status].string
    modified = json[SerializationKeys.modified].string
    id = json[SerializationKeys.id].int
    created = json[SerializationKeys.created].string
    startDeliveryDate = json[SerializationKeys.startDeliveryDate].string
    orderForm = SJLCFOrderForm(json: json[SerializationKeys.orderForm])
    total = json[SerializationKeys.total].float
    salesRep = SJLCFSalesRep(json: json[SerializationKeys.salesRep])
    createdBy = json[SerializationKeys.createdBy].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = note { dictionary[SerializationKeys.note] = value }
    if let value = items { dictionary[SerializationKeys.items] = value.map { $0.dictionaryRepresentation() } }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = customer { dictionary[SerializationKeys.customer] = value.dictionaryRepresentation() }
    if let value = modifiedBy { dictionary[SerializationKeys.modifiedBy] = value }
    if let value = endDeliveryDate { dictionary[SerializationKeys.endDeliveryDate] = value }
    if let value = idOrderForm { dictionary[SerializationKeys.idOrderForm] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = modified { dictionary[SerializationKeys.modified] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = startDeliveryDate { dictionary[SerializationKeys.startDeliveryDate] = value }
    if let value = orderForm { dictionary[SerializationKeys.orderForm] = value.dictionaryRepresentation() }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = salesRep { dictionary[SerializationKeys.salesRep] = value.dictionaryRepresentation() }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.note = aDecoder.decodeObject(forKey: SerializationKeys.note) as? String
    self.items = aDecoder.decodeObject(forKey: SerializationKeys.items) as? [SJLCFItems]
    self.date = aDecoder.decodeObject(forKey: SerializationKeys.date) as? String
    self.customer = aDecoder.decodeObject(forKey: SerializationKeys.customer) as? SJLCFCustomer
    self.modifiedBy = aDecoder.decodeObject(forKey: SerializationKeys.modifiedBy) as? Int
    self.endDeliveryDate = aDecoder.decodeObject(forKey: SerializationKeys.endDeliveryDate) as? String
    self.idOrderForm = aDecoder.decodeObject(forKey: SerializationKeys.idOrderForm) as? Int
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.modified = aDecoder.decodeObject(forKey: SerializationKeys.modified) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.created = aDecoder.decodeObject(forKey: SerializationKeys.created) as? String
    self.startDeliveryDate = aDecoder.decodeObject(forKey: SerializationKeys.startDeliveryDate) as? String
    self.orderForm = aDecoder.decodeObject(forKey: SerializationKeys.orderForm) as? SJLCFOrderForm
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Float
    self.salesRep = aDecoder.decodeObject(forKey: SerializationKeys.salesRep) as? SJLCFSalesRep
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(note, forKey: SerializationKeys.note)
    aCoder.encode(items, forKey: SerializationKeys.items)
    aCoder.encode(date, forKey: SerializationKeys.date)
    aCoder.encode(customer, forKey: SerializationKeys.customer)
    aCoder.encode(modifiedBy, forKey: SerializationKeys.modifiedBy)
    aCoder.encode(endDeliveryDate, forKey: SerializationKeys.endDeliveryDate)
    aCoder.encode(idOrderForm, forKey: SerializationKeys.idOrderForm)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(modified, forKey: SerializationKeys.modified)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(created, forKey: SerializationKeys.created)
    aCoder.encode(startDeliveryDate, forKey: SerializationKeys.startDeliveryDate)
    aCoder.encode(orderForm, forKey: SerializationKeys.orderForm)
    aCoder.encode(total, forKey: SerializationKeys.total)
    aCoder.encode(salesRep, forKey: SerializationKeys.salesRep)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
  }

}
