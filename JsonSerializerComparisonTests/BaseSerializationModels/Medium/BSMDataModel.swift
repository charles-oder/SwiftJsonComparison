// BSMDataModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:25 +0000

import Foundation

public struct BSMDataModel: JsonModel {

    public let Last: String?
    public let PctChange: String?
    public let SettlementPrice: String?
    public let Open: String?
    public let Low: String?
    public let Bid: String?
    public let QuoteDelay: Int?
    public let ActualSymbol: String?
    public let IssueDescription: String?
    public let TradeDateTime: String?
    public let Change: String?
    public let Settledate: String?
    public let High: String?
    public let Ask: String?
    public let CumVolume: Int?

    public init(
                Last: String?,
                PctChange: String?,
                SettlementPrice: String?,
                Open: String?,
                Low: String?,
                Bid: String?,
                QuoteDelay: Int?,
                ActualSymbol: String?,
                IssueDescription: String?,
                TradeDateTime: String?,
                Change: String?,
                Settledate: String?,
                High: String?,
                Ask: String?,
                CumVolume: Int?
                ) {
        self.Last = Last
        self.PctChange = PctChange
        self.SettlementPrice = SettlementPrice
        self.Open = Open
        self.Low = Low
        self.Bid = Bid
        self.QuoteDelay = QuoteDelay
        self.ActualSymbol = ActualSymbol
        self.IssueDescription = IssueDescription
        self.TradeDateTime = TradeDateTime
        self.Change = Change
        self.Settledate = Settledate
        self.High = High
        self.Ask = Ask
        self.CumVolume = CumVolume
    }

    public init?(dictionary:[String: Any?]?) {

        self.Last = dictionary?["Last"] as? String
        self.PctChange = dictionary?["PctChange"] as? String
        self.SettlementPrice = dictionary?["SettlementPrice"] as? String
        self.Open = dictionary?["Open"] as? String
        self.Low = dictionary?["Low"] as? String
        self.Bid = dictionary?["Bid"] as? String
        self.QuoteDelay = dictionary?["QuoteDelay"] as? Int
        self.ActualSymbol = dictionary?["ActualSymbol"] as? String
        self.IssueDescription = dictionary?["IssueDescription"] as? String
        self.TradeDateTime = dictionary?["TradeDateTime"] as? String
        self.Change = dictionary?["Change"] as? String
        self.Settledate = dictionary?["Settledate"] as? String
        self.High = dictionary?["High"] as? String
        self.Ask = dictionary?["Ask"] as? String
        self.CumVolume = dictionary?["CumVolume"] as? Int

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["Last"] = self.Last
        dictionary["PctChange"] = self.PctChange
        dictionary["SettlementPrice"] = self.SettlementPrice
        dictionary["Open"] = self.Open
        dictionary["Low"] = self.Low
        dictionary["Bid"] = self.Bid
        dictionary["QuoteDelay"] = self.QuoteDelay
        dictionary["ActualSymbol"] = self.ActualSymbol
        dictionary["IssueDescription"] = self.IssueDescription
        dictionary["TradeDateTime"] = self.TradeDateTime
        dictionary["Change"] = self.Change
        dictionary["Settledate"] = self.Settledate
        dictionary["High"] = self.High
        dictionary["Ask"] = self.Ask
        dictionary["CumVolume"] = self.CumVolume

        return dictionary

    }

}
