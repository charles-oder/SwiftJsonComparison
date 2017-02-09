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
    func assertLargeComplexObject(json: String?) {
        guard let jsonString = json else {
            assertionFailure("Empty JSON string")
            return
        }
        let testObject = BSLCBaseModel(json: jsonString)
        
        assert(4 == testObject?.data?.count)
        assert(4 == testObject?.total)
        assert(4 == testObject?.unfilteredTotal)
        
        guard let _  = testObject?.data?.first else {
            assertionFailure("Not enough orders")
            return
        }
        
        let order_1 = testObject?.data?.first
        assert(3 == order_1?.id)
        assert("2016-04-26" == order_1?.date)
        assert("pending" == order_1?.status)
        assert(1 == order_1?.orderForm?.id)
        assert("Order Form" == order_1?.orderForm?.name)
        assert(1 == order_1?.orderForm?.active)
        assert(1 == order_1?.orderForm?.season?.id)
        assert("Spring 2016" == order_1?.orderForm?.season?.name)
        assert(2016 == order_1?.orderForm?.season?.year)
        assert(1 == order_1?.orderForm?.salesTerritories?.count)
        assert(1 == order_1?.orderForm?.salesTerritories?.first?.id)
        assert("North Territory" == order_1?.orderForm?.salesTerritories?.first?.name)
        assert(1 == order_1?.orderForm?.solutions?.count)
        assert(1 == order_1?.orderForm?.solutions?.first?.id)
        assert("DK-01" == order_1?.orderForm?.solutions?.first?.displayName)
        assert(1 == order_1?.orderForm?.solutions?.first?.deviations?.count)
        assert("+-1%" == order_1?.orderForm?.solutions?.first?.deviations?.first)
        assert(2 == order_1?.orderForm?.solutions?.first?.category?.id)
        assert("Nutrient Management" == order_1?.orderForm?.solutions?.first?.category?.name)
        assert(1 == order_1?.orderForm?.solutions?.first?.discountPrograms?.count)
        assert(1 == order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.id)
        assert("Volume Volume Volume" == order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.name)
        assert("5% of more than 50 bags" == order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.description)
        assert(1 == order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.active)
        assert("%-5.00volume(50)" == order_1?.orderForm?.solutions?.first?.discountPrograms?.first?.operation)
        assert(1 == order_1?.orderForm?.paymentTerms?.count)
        assert(1 == order_1?.orderForm?.paymentTerms?.first?.id)
        assert("Prepay discount" == order_1?.orderForm?.paymentTerms?.first?.name)
        assert("3% off" == order_1?.orderForm?.paymentTerms?.first?.description)
        assert(1 == order_1?.orderForm?.paymentTerms?.first?.active)
        assert("%-3.00" == order_1?.orderForm?.paymentTerms?.first?.operation)
        assert("small print goes here" == order_1?.orderForm?.templateTerms)
        assert("2016-04-26" == order_1?.orderForm?.created)
        assert(1 == order_1?.orderForm?.createdBy)
        assert("2016-04-26" == order_1?.orderForm?.modified)
        assert(1 == order_1?.orderForm?.modifiedBy)
        assert(1 == order_1?.idOrderForm)
        assert(1234.56 == order_1?.total)
        assert(1 == order_1?.items?.count)
        assert(5 == order_1?.items?.first?.idSolution)
        assert("DK-01" == order_1?.items?.first?.displayName)
        assert(1258.92 == order_1?.items?.first?.subTotal)
        assert(156 == order_1?.items?.first?.quantity)
        assert(1 == order_1?.items?.first?.idDiscountProgram)
        assert(8.07 == order_1?.items?.first?.price)
        assert(1 == order_1?.customer?.id)
        assert("George Sanders" == order_1?.customer?.displayName)
        assert(30 == order_1?.salesRep?.id)
        assert("Jason Fossella" == order_1?.salesRep?.displayName)
        assert("Some text" == order_1?.note)
        assert("2016-04-26" == order_1?.startDeliveryDate)
        assert("2016-07-24" == order_1?.endDeliveryDate)
        assert("2016-04-26T15:19:21+00:00" == order_1?.created)
        assert(1 == order_1?.createdBy)
        assert("2016-04-26T15:19:21+00:00" == order_1?.modified)
        assert(1 == order_1?.modifiedBy)
    }
    
    func assertLargeSimpleArray(json: String?) {
        guard let jsonString = json else {
            assertionFailure("Empty JSON string")
            return
        }
        let testObject = BSLSABaseModel(json: jsonString)
        
        assert(100 == testObject?.data?.count)
        assert("2016-09-01T15:02:14.978" == testObject?.data?.first?.DateTime)
        assert(105.78500000000001 == testObject?.data?.first?.Open?.number)
        assert("105.7850" == testObject?.data?.first?.Open?.text)
        assert(105.81 == testObject?.data?.first?.High?.number)
        assert("105.8100" == testObject?.data?.first?.High?.text)
        assert(105.78500000000001 == testObject?.data?.first?.Low?.number)
        assert("105.7850" == testObject?.data?.first?.Low?.text)
        assert(105.805 == testObject?.data?.first?.Close?.number)
        assert("105.8050" == testObject?.data?.first?.Close?.text)
        assert(4511 == testObject?.data?.first?.Volume?.number)
        assert("4511" == testObject?.data?.first?.Volume?.text)


    }
    
    func assertMediumFile(json: String?) {
        guard let jsonString = json else {
            assertionFailure("Empty JSON string")
            return
        }
        let testObject = BSMBaseModel(json: jsonString)

        assert("QuoteWatch" == testObject?.meta?.command)
        assert("@C@1" == testObject?.meta?.symbols?.first?.symbol)
        assert("CBT" == testObject?.meta?.symbols?.first?.market)
        assert("@c@1" == testObject?.meta?.expression)
        assert(200 == testObject?.meta?.status)
        assert(2 == testObject?.meta?.requestId)
        assert("108.9863" == testObject?.data?.first?.Last)
        assert("0.4763" == testObject?.data?.first?.Change)
        assert("110.0000" == testObject?.data?.first?.High)
        assert("100.0000" == testObject?.data?.first?.Low)
        assert("770.1000" == testObject?.data?.first?.Open)
        assert("762.5100" == testObject?.data?.first?.Bid)
        assert("762.8300" == testObject?.data?.first?.Ask)
        assert(1270264 == testObject?.data?.first?.CumVolume)
        assert("ALPHABET INC CLASS C" == testObject?.data?.first?.IssueDescription)
        assert("2016-10-03" == testObject?.data?.first?.Settledate)
        assert("1.2875" == testObject?.data?.first?.SettlementPrice)
        assert("@CZ16" == testObject?.data?.first?.ActualSymbol)
        assert(10 == testObject?.data?.first?.QuoteDelay)
        assert("2016-09-09T18:54:35.917" == testObject?.data?.first?.TradeDateTime)
        assert("0.32" == testObject?.data?.first?.PctChange)

    }
    
}

