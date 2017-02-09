//
//  TestCase.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 2/9/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public protocol TestCase {
    
    func testSerializeLargeComplexObject() -> [Double]
    
    func testDeserializeLargeComplexObject() -> [Double]
    
    func testSerializeLargeSimpleArray() -> [Double]
    
    func testDeserializeLargeSimpleArray() -> [Double]
    
    func testSerializeMediumFile() -> [Double]
    
    func testDeserializeMediumFile() -> [Double]

}

extension TestCase {
    var iterations: Int {
        return 2
    }
    
    func measureBlock(operation:()->()) -> [Double] {
        var output = [Double]()
        for _ in 1...iterations {
            let startTime = CFAbsoluteTimeGetCurrent()
            operation()
            let stopTime = CFAbsoluteTimeGetCurrent()
            output.append(stopTime - startTime)
        }
        return output
    }
    
    func runTests() -> String {
        var output = "Test, Average, High, Low, StandardDev\n"
        output += buildLine(title: "SerializeLargeComplexObject", results: TestResult(values: testSerializeLargeComplexObject()))
        output += buildLine(title: "DeserializeLargeComplexObject", results: TestResult(values: testDeserializeLargeComplexObject()))
        output += buildLine(title: "SerializeMediumFile", results: TestResult(values: testSerializeMediumFile()))
        output += buildLine(title: "DeserializeMediumFile", results: TestResult(values: testDeserializeMediumFile()))
        output += buildLine(title: "SerializeLargeSimpleArray", results: TestResult(values: testSerializeLargeSimpleArray()))
        output += buildLine(title: "DeserializeLargeSimpleArray", results: TestResult(values: testDeserializeLargeSimpleArray()))
        return output
    }
    
    func buildLine(title: String, results: TestResult) -> String {
        return "\(title), \(results.meanString), \(results.maxString), \(results.minString), \(results.standardDeviationString)\n"
    }

}

extension TestCase {
    func assertLargeComplexObject(json: String?) -> String? {
        let testObject = BSLCBaseModel(json: json!)
        
        if 4 != testObject?.data?.count { return "Error: data?.count" }
        if 4 != testObject?.total { return "Error: total" }
        if 4 != testObject?.unfilteredTotal { return "Error: unfilteredTotal" }
        
        guard let _  = testObject?.data?.first else {
            return "Error: Not enough orders"
        }
        
        let order_1 = testObject?.data?.first
        if 3 != order_1?.id { return "Error: id" }
        if "2016-04-26" != order_1?.date { return "Error: date" }
        if "pending" != order_1?.status { return "Error: status" }
        if 1 != order_1?.orderForm?.id { return "Error: id" }
        if "Order Form" != order_1?.orderForm?.name { return "Error: orderForm?.name" }
        if 1 != order_1?.orderForm?.active { return "Error: orderForm?.active" }
        if 1 != order_1?.orderForm?.season?.id { return "Error: orderForm?.season?.id" }
        if "Spring 2016" != order_1?.orderForm?.season?.name { return "Error: orderForm?.season?.name" }
        if 2016 != order_1?.orderForm?.season?.year { return "Error: orderForm?.season?.year" }
        if 1 != order_1?.orderForm?.salesTerritories?.count { return "Error: orderForm?.salesTerritories?.count" }
        if 1 != order_1?.orderForm?.salesTerritories?.first?.id { return "Error: orderForm?.salesTerritories?.first?.id" }
        if "North Territory" != order_1?.orderForm?.salesTerritories?.first?.name { return "Error: orderForm?.salesTerritories?.first?.name" }
        if 1 != order_1?.orderForm?.solutions?.count { return "Error: orderForm?.solutions?.count" }
        if 1 != order_1?.orderForm?.solutions?.first?.id { return "Error: orderForm?.solutions?.first?.id" }
        if "DK-01" != order_1?.orderForm?.solutions?.first?.displayName { return "Error: orderForm?.solutions?.first?.displayName" }
        if 1 != order_1?.orderForm?.solutions?.first?.deviations?.count { return "Error: orderForm?.solutions?.first?.deviations?.count" }
        if "+-1%" != order_1?.orderForm?.solutions?.first?.deviations?.first { return "Error: orderForm?.solutions?.first?.deviations?.first" }
        if 2 != order_1?.orderForm?.solutions?.first?.category?.id { return "Error: orderForm?.solutions?.first?.category?.id" }
        if "Nutrient Management" != order_1?.orderForm?.solutions?.first?.category?.name { return "Error: orderForm?.solutions?.first?.category?.name" }
        if 1 != order_1?.orderForm?.solutions?.first?.discountPrograms?.count { return "Error: orderForm?.solutions?.first?.discountPrograms?.count" }
        if 1 != order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.id { return "Error: orderForm?.solutions?.first?.discountPrograms?.first?.id" }
        if "Volume Volume Volume" != order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.name { return "Error: orderForm?.solutions?.first?.discountPrograms?.first?.name" }
        if "5% of more than 50 bags" != order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.description { return "Error: orderForm?.solutions?.first?.discountPrograms?.first?.description" }
        if 1 != order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.active { return "Error: orderForm?.solutions?.first?.discountPrograms?.first?.active" }
        if "%-5.00volume(50)" != order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.operation { return "Error: orderForm?.solutions?.first?.discountPrograms?.first?.operation" }
        if 1 != order_1?.orderForm?.paymentTerms?.count { return "Error: orderForm?.paymentTerms?.count" }
        if 1 != order_1?.orderForm?.paymentTerms?.first?.id { return "Error: orderForm?.paymentTerms?.first?.id" }
        if "Prepay discount" != order_1?.orderForm?.paymentTerms?.first?.name { return "Error: orderForm?.paymentTerms?.first?.name" }
        if "3% off" != order_1?.orderForm?.paymentTerms?.first?.description { return "Error: orderForm?.paymentTerms?.first?.description" }
        if 1 != order_1?.orderForm?.paymentTerms?.first?.active { return "Error: orderForm?.paymentTerms?.first?.active" }
        if "%-3.00" != order_1?.orderForm?.paymentTerms?.first?.operation { return "Error: orderForm?.paymentTerms?.first?.operation" }
        if "small print goes here" != order_1?.orderForm?.templateTerms { return "Error: .orderForm?.templateTerms" }
        if "2016-04-26" != order_1?.orderForm?.created { return "Error: orderForm?.created" }
        if 1 != order_1?.orderForm?.createdBy { return "Error: orderForm?.createdBy" }
        if "2016-04-26" != order_1?.orderForm?.modified { return "Error: orderForm?.modified" }
        if 1 != order_1?.orderForm?.modifiedBy { return "Error: orderForm?.modifiedBy" }
        if 1 != order_1?.idOrderForm { return "Error: idOrderForm" }
        if 1234.56 != order_1?.total { return "Error: total" }
        if 1 != order_1?.items?.count { return "Error: items?.count" }
        if 5 != order_1?.items?.first?.idSolution { return "Error: items?.first?.idSolution" }
        if "DK-01" != order_1?.items?.first?.displayName { return "Error: items?.first?.displayName" }
        if 1258.92 != order_1?.items?.first?.subTotal { return "Error: items?.first?.subTotal" }
        if 156 != order_1?.items?.first?.quantity { return "Error: items?.first?.quantity" }
        if 1 != order_1?.items?.first?.idDiscountProgram { return "Error: items?.first?.idDiscountProgram" }
        if 8.07 != order_1?.items?.first?.price { return "Error: items?.first?.price" }
        if 1 != order_1?.customer?.id { return "Error: customer?.id" }
        if "George Sanders" != order_1?.customer?.displayName { return "Error: customer?.displayName" }
        if 30 != order_1?.salesRep?.id { return "Error: salesRep?.id" }
        if "Jason Fossella" != order_1?.salesRep?.displayName { return "Error: salesRep?.displayName" }
        if "Some text" != order_1?.note { return "Error: note" }
        if "2016-04-26" != order_1?.startDeliveryDate { return "Error: startDeliveryDate" }
        if "2016-07-24" != order_1?.endDeliveryDate { return "Error: endDeliveryDate" }
        if "2016-04-26T15:19:21+00:00" != order_1?.created { return "Error: created" }
        if 1 != order_1?.createdBy { return "Error: createdBy" }
        if "2016-04-26T15:19:21+00:00" != order_1?.modified { return "Error: modified" }
        if 1 != order_1?.modifiedBy { return "Error: modifiedBy" }
        return nil
    }
    
    func assertLargeSimpleArray(json: String?) -> String? {
        let testObject = BSLSABaseModel(json: json!)
        
        if 100 != testObject?.data?.count { return "Error: data?.count" }
        if "2016-09-01T15:02:14.978" != testObject?.data?.first?.DateTime { return "Error: data?.first?.DateTime" }
        if 105.785 != testObject?.data?.first?.Open?.number { return "Error: data?.first?.Open?.number" }
        if "105.7850" != testObject?.data?.first?.Open?.text { return "Error: data?.first?.Open?.text" }
        if 105.81 != testObject?.data?.first?.High?.number { return "Error: data?.first?.High?.number" }
        if "105.8100" != testObject?.data?.first?.High?.text { return "Error: data?.first?.High?.text" }
        if 105.785 != testObject?.data?.first?.Low?.number { return "Error: data?.first?.Low?.number" }
        if "105.7850" != testObject?.data?.first?.Low?.text { return "Error: data?.first?.Low?.text" }
        if 105.805 != testObject?.data?.first?.Close?.number { return "Error: data?.first?.Close?.number" }
        if "105.8050" != testObject?.data?.first?.Close?.text { return "Error: data?.first?.Close?.text" }
        if 4511 != testObject?.data?.first?.Volume?.number { return "Error: data?.first?.Volume?.number" }
        if "4511" != testObject?.data?.first?.Volume?.text { return "Error: data?.first?.Volume?.text" }
        return nil
    }
    
    func assertMediumFile(json: String?) -> String? {
        let testObject = BSMBaseModel(json: json!)

        if "QuoteWatch" != testObject?.meta?.command { return "Error: meta?.command" }
        if "@C@1" != testObject?.meta?.symbols?.first?.symbol { return "Error: meta?.symbols?.first?.symbol" }
        if "CBT" != testObject?.meta?.symbols?.first?.market { return "Error: meta?.symbols?.first?.market" }
        if "@c@1" != testObject?.meta?.expression { return "Error: meta?.expression" }
        if 200 != testObject?.meta?.status { return "Error: meta?.status" }
        if 2 != testObject?.meta?.requestId { return "Error: meta?.requestId" }
        if "108.9863" != testObject?.data?.first?.Last { return "Error: data?.first?.Last" }
        if "0.4763" != testObject?.data?.first?.Change { return "Error: data?.first?.Change" }
        if "110.0000" != testObject?.data?.first?.High { return "Error: data?.first?.High" }
        if "100.0000" != testObject?.data?.first?.Low { return "Error: data?.first?.Low" }
        if "770.1000" != testObject?.data?.first?.Open { return "Error: data?.first?.Open" }
        if "762.5100" != testObject?.data?.first?.Bid { return "Error: data?.first?.Bid" }
        if "762.8300" != testObject?.data?.first?.Ask { return "Error: data?.first?.Ask" }
        if 1270264 != testObject?.data?.first?.CumVolume { return "Error: data?.first?.CumVolume" }
        if "ALPHABET INC CLASS C" != testObject?.data?.first?.IssueDescription { return "Error: data?.first?.IssueDescription" }
        if "2016-10-03" != testObject?.data?.first?.Settledate { return "Error: data?.first?.Settledate" }
        if "1.2875" != testObject?.data?.first?.SettlementPrice { return "Error: data?.first?.SettlementPrice" }
        if "@CZ16" != testObject?.data?.first?.ActualSymbol { return "Error: data?.first?.ActualSymbol" }
        if 10 != testObject?.data?.first?.QuoteDelay { return "Error: data?.first?.QuoteDelay" }
        if "2016-09-09T18:54:35.917" != testObject?.data?.first?.TradeDateTime { return "Error: data?.first?.TradeDateTime" }
        if "0.32" != testObject?.data?.first?.PctChange { return "Error: data?.first?.PctChange" }
        return nil
    }
    
}

