//
//  BaseTests.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import XCTest
import ObjectMapper

class BaseTests: XCTestCase {
    
    let iterations = 10
    
    func deserializeLargeComplexObject(jsonString: String) -> LargeComplexFile? {
        return Mapper<OMLargeComplexFile>().map(JSONString: jsonString)
    }
    
    func serializeLargeComplexObject(_ object: LargeComplexFile) -> String? {
        return (object as? OMLargeComplexFile)?.toJSONString()
    }
    
    func deserializeLargeSimpleArray(jsonString: String) -> LargeSimpleArray? {
        return Mapper<OMLargeSimpleArray>().map(JSONString: jsonString)
    }
    
    func serializeLargeSimpleArray(_ object: LargeSimpleArray) -> String? {
        return (object as? OMLargeSimpleArray)?.toJSONString()
    }
    
    func deserializeMediumFile(jsonString: String) -> MediumFile? {
        return Mapper<OMMediumFile>().map(JSONString: jsonString)
    }
    
    func serializeMediumFile(_ object: MediumFile) -> String? {
        return (object as? OMMediumFile)?.toJSONString()
    }
    
    func testSerializeLargeComplexObject1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
        
        let testObject = self.deserializeLargeComplexObject(jsonString: jsonString) as? OMLargeComplexFile
        var jsonOutput: String?
        
        self.measure {
            for _ in 1...self.iterations {
                jsonOutput = self.serializeLargeComplexObject(testObject!)
            }
        }
        
        XCTAssertEqual(true, jsonOutput?.contains("5% of more than 50 bags"))
        
    }
    
    func testDeserializeLargeComplexObject1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
        
        var testObject: LargeComplexFile!
        self.measure {
            for _ in 1...self.iterations {
                testObject = self.deserializeLargeComplexObject(jsonString: jsonString)
            }
        }
        
        
        XCTAssertEqual(4, testObject?.orders.count)
        XCTAssertEqual(4, testObject?.total)
        XCTAssertEqual(4, testObject?.unfilteredTotal)
        
        guard let _  = testObject?.orders.first else {
            XCTFail("Not enough orders")
            return
        }
        let order_1 = testObject?.orders.removeFirst()
        XCTAssertEqual(3, order_1?.orderId)
        XCTAssertEqual("2016-04-26", order_1?.date)
        XCTAssertEqual("pending", order_1?.status)
        XCTAssertEqual(1, order_1?.orderForm?.orderFormId)
        XCTAssertEqual("Order Form", order_1?.orderForm?.name)
        XCTAssertEqual(1, order_1?.orderForm?.active)
        XCTAssertEqual(1, order_1?.orderForm?.season?.id)
        XCTAssertEqual("Spring 2016", order_1?.orderForm?.season?.name)
        XCTAssertEqual(2016, order_1?.orderForm?.season?.year)
        XCTAssertEqual(1, order_1?.orderForm?.salesTerritories.count)
        XCTAssertEqual(1, order_1?.orderForm?.salesTerritories.first?.id)
        XCTAssertEqual("North Territory", order_1?.orderForm?.salesTerritories.first?.name)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.count)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.solutionId)
        XCTAssertEqual("DK-01", order_1?.orderForm?.solutions.first?.displayName)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.deviations.count)
        XCTAssertEqual("+-1%", order_1?.orderForm?.solutions.first?.deviations.first)
        XCTAssertEqual(2, order_1?.orderForm?.solutions.first?.category?.id)
        XCTAssertEqual("Nutrient Management", order_1?.orderForm?.solutions.first?.category?.name)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.count)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.first?.discountId)
        XCTAssertEqual("Volume Volume Volume", order_1?.orderForm?.solutions.first?.discountPrograms.first?.name)
        XCTAssertEqual("5% of more than 50 bags", order_1?.orderForm?.solutions.first?.discountPrograms.first?.programDescription)
        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.first?.active)
        XCTAssertEqual("%-5.00volume(50)", order_1?.orderForm?.solutions.first?.discountPrograms.first?.operation)
        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.count)
        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.first?.paymentTermId)
        XCTAssertEqual("Prepay discount", order_1?.orderForm?.paymentTerms.first?.name)
        XCTAssertEqual("3% off", order_1?.orderForm?.paymentTerms.first?.paymentTermDescription)
        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.first?.active)
        XCTAssertEqual("%-3.00", order_1?.orderForm?.paymentTerms.first?.operation)
        XCTAssertEqual("small print goes here", order_1?.orderForm?.templateTerms)
        XCTAssertEqual("2016-04-26", order_1?.orderForm?.createdDateString)
        XCTAssertEqual(1, order_1?.orderForm?.createdById)
        XCTAssertEqual("2016-04-26", order_1?.orderForm?.modifiedDateString)
        XCTAssertEqual(1, order_1?.orderForm?.modifiedById)
        XCTAssertEqual(1, order_1?.idOrderForm)
        XCTAssertEqual(1234.56, order_1?.total)
        XCTAssertEqual(1, order_1?.items?.count)
        XCTAssertEqual(5, order_1?.items?.first?.idSolution)
        XCTAssertEqual("DK-01", order_1?.items?.first?.displayName)
        XCTAssertEqual(1258.92, order_1?.items?.first?.subTotal)
        XCTAssertEqual(156, order_1?.items?.first?.quantity)
        XCTAssertEqual(1, order_1?.items?.first?.idDiscountProgram)
        XCTAssertEqual(8.07, order_1?.items?.first?.price)
        XCTAssertEqual(1, order_1?.customer?.id)
        XCTAssertEqual("George Sanders", order_1?.customer?.displayName)
        XCTAssertEqual(30, order_1?.salesRep?.id)
        XCTAssertEqual("Jason Fossella", order_1?.salesRep?.displayName)
        XCTAssertEqual("Some text", order_1?.note)
        XCTAssertEqual("2016-04-26", order_1?.startDeliveryDate)
        XCTAssertEqual("2016-07-24", order_1?.endDeliveryDate)
        XCTAssertEqual("2016-04-26T15:19:21+00:00", order_1?.createdDate)
        XCTAssertEqual(1, order_1?.createdById)
        XCTAssertEqual("2016-04-26T15:19:21+00:00", order_1?.modifiedDate)
        XCTAssertEqual(1, order_1?.modifiedId)
        
        
    }
    
    func testSerializeLargeSimpleArray1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeSimpleArray")
        
        let testObject = self.deserializeLargeSimpleArray(jsonString: jsonString) as? OMLargeSimpleArray
        var jsonOutput: String?
        
        self.measure {
            for _ in 1...self.iterations {
                jsonOutput = self.serializeLargeSimpleArray(testObject!)
            }
        }
        
        XCTAssertEqual(true, jsonOutput?.contains("2016-09-01T15:02:14.978"))
        
    }
    
    func testDeserializeLargeSimpleArray1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeSimpleArray")
        
        var testObject: LargeSimpleArray!
        self.measure {
            for _ in 1...self.iterations {
                testObject = self.deserializeLargeSimpleArray(jsonString: jsonString)
            }
        }
        
        XCTAssertEqual(100, testObject.data.count)
        XCTAssertEqual("2016-09-01T15:02:14.978", testObject.data.first?.dateTime)
        XCTAssertEqual(105.78500000000001, testObject.data.first?.open?.number)
        XCTAssertEqual("105.7850", testObject.data.first?.open?.text)
        XCTAssertEqual(105.81, testObject.data.first?.high?.number)
        XCTAssertEqual("105.8100", testObject.data.first?.high?.text)
        XCTAssertEqual(105.78500000000001, testObject.data.first?.low?.number)
        XCTAssertEqual("105.7850", testObject.data.first?.low?.text)
        XCTAssertEqual(105.805, testObject.data.first?.close?.number)
        XCTAssertEqual("105.8050", testObject.data.first?.close?.text)
        XCTAssertEqual(4511.0, testObject.data.first?.volume?.number)
        XCTAssertEqual("4511", testObject.data.first?.volume?.text)
        
        
    }
    
    func testSerializeMediumFile1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "MediumFile")
        
        let testObject = self.deserializeMediumFile(jsonString: jsonString)
        var jsonOutput: String?
        
        self.measure {
            for _ in 1...self.iterations {
                jsonOutput = self.serializeMediumFile(testObject!)
            }
        }
        
        XCTAssertEqual(true, jsonOutput?.contains("ALPHABET INC CLASS C"))
        
    }
    
    func testDeserializeMediumFile1000Times() {
        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "MediumFile")
        
        var testObject: MediumFile!
        self.measure {
            for _ in 1...self.iterations {
                testObject = self.deserializeMediumFile(jsonString: jsonString)
            }
        }
        
        XCTAssertEqual("QuoteWatch", testObject.metaData?.command)
        XCTAssertEqual("@C@1", testObject.metaData?.symbols.first?.symbol)
        XCTAssertEqual("CBT", testObject.metaData?.symbols.first?.market)
        XCTAssertEqual("@c@1", testObject.metaData?.expression)
        XCTAssertEqual(200, testObject.metaData?.status)
        XCTAssertEqual(2, testObject.metaData?.requestId)
        XCTAssertEqual("108.9863", testObject.data.first?.Last)
        XCTAssertEqual("0.4763", testObject.data.first?.Change)
        XCTAssertEqual("110.0000", testObject.data.first?.High)
        XCTAssertEqual("100.0000", testObject.data.first?.Low)
        XCTAssertEqual("770.1000", testObject.data.first?.Open)
        XCTAssertEqual("762.5100", testObject.data.first?.Bid)
        XCTAssertEqual("762.8300", testObject.data.first?.Ask)
        XCTAssertEqual(1270264, testObject.data.first?.CumVolume)
        XCTAssertEqual("ALPHABET INC CLASS C", testObject.data.first?.IssueDescription)
        XCTAssertEqual("2016-10-03", testObject.data.first?.Settledate)
        XCTAssertEqual("1.2875", testObject.data.first?.SettlementPrice)
        XCTAssertEqual("@CZ16", testObject.data.first?.ActualSymbol)
        XCTAssertEqual(10, testObject.data.first?.QuoteDelay)
        XCTAssertEqual("2016-09-09T18:54:35.917", testObject.data.first?.TradeDateTime)
        XCTAssertEqual("0.32", testObject.data.first?.PctChange)
        
        
    }
    
    
    
}
