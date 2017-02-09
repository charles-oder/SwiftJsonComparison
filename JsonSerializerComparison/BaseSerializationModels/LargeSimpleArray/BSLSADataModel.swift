// BSLSADataModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:00 +0000

import Foundation

public struct BSLSADataModel: JsonModel {

    public let Close: BSLSACloseModel?
    public let Volume: BSLSAVolumeModel?
    public let Open: BSLSAOpenModel?
    public let Low: BSLSALowModel?
    public let DateTime: String?
    public let High: BSLSAHighModel?

    public init(
                Close: BSLSACloseModel?,
                Volume: BSLSAVolumeModel?,
                Open: BSLSAOpenModel?,
                Low: BSLSALowModel?,
                DateTime: String?,
                High: BSLSAHighModel?,
                OpenInt: Any?
                ) {
        self.Close = Close
        self.Volume = Volume
        self.Open = Open
        self.Low = Low
        self.DateTime = DateTime
        self.High = High
    }

    public init?(dictionary:[String: Any?]?) {

        self.Close = BSLSACloseModel(dictionary:dictionary?["Close"] as? [String:Any?])
        self.Volume = BSLSAVolumeModel(dictionary:dictionary?["Volume"] as? [String:Any?])
        self.Open = BSLSAOpenModel(dictionary:dictionary?["Open"] as? [String:Any?])
        self.Low = BSLSALowModel(dictionary:dictionary?["Low"] as? [String:Any?])
        self.DateTime = dictionary?["DateTime"] as? String
        self.High = BSLSAHighModel(dictionary:dictionary?["High"] as? [String:Any?])

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["Close"] = self.Close?.jsonDictionary
        dictionary["Volume"] = self.Volume?.jsonDictionary
        dictionary["Open"] = self.Open?.jsonDictionary
        dictionary["Low"] = self.Low?.jsonDictionary
        dictionary["DateTime"] = self.DateTime
        dictionary["High"] = self.High?.jsonDictionary

        return dictionary

    }

}
