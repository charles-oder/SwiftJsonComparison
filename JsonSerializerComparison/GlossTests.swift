////
////  GlossTests.swift
////  JsonSerializerComparison
////
////  Created by Charles Oder on 1/18/17.
////  Copyright © 2017 DTN. All rights reserved.
////
//
//import Gloss
//
//class GlossTests: TestCase {
//    
//    func deserializeLargeComplexObject(jsonString: String) -> GLLargeComplexFile? {
//        guard let data = jsonString.data(using: .utf8, allowLossyConversion: true) else {
//            return nil
//        }
//        return GLLargeComplexFile(data: data)
//    }
//    
//    func serializeLargeComplexObject(_ object: GLLargeComplexFile) -> String? {
//        guard let dict = object.toJSON() else {
//            return nil
//        }
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//            return String(data: jsonData, encoding: .utf8)
//        } catch {
//            return nil
//        }
//    }
//    
//    func deserializeLargeSimpleArray(jsonString: String) -> GLLargeSimpleArray? {
//        guard let data = jsonString.data(using: .utf8, allowLossyConversion: true) else {
//            return nil
//        }
//        return GLLargeSimpleArray(data: data)
//    }
//    
//    func serializeLargeSimpleArray(_ object: GLLargeSimpleArray) -> String? {
//        guard let dict = object.toJSON() else {
//            return nil
//        }
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//            return String(data: jsonData, encoding: .utf8)
//        } catch {
//            return nil
//        }
//    }
//    
//    func deserializeMediumFile(jsonString: String) -> GLMediumFile? {
//        guard let data = jsonString.data(using: .utf8, allowLossyConversion: true) else {
//            return nil
//        }
//        return GLMediumFile(data: data)
//    }
//    
//    func serializeMediumFile(_ object: GLMediumFile) -> String? {
//        guard let dict = object.toJSON() else {
//            return nil
//        }
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//            return String(data: jsonData, encoding: .utf8)
//        } catch {
//            return nil
//        }
//    }
//    
//    func testSerializeLargeComplexObject1000Times() {
//        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
//        
//        let testObject = self.deserializeLargeComplexObject(jsonString: jsonString)
//        var jsonOutput: String?
//        
//        self.measure { [weak self] in
//            for _ in 1...BaseTests.iterations {
//                jsonOutput = self?.serializeLargeComplexObject(testObject!)
//            }
//        }
//        
//        XCTAssertEqual(true, jsonOutput?.contains("5% of more than 50 bags"))
//        
//    }
//    
//    func testDeserializeLargeComplexObject1000Times() {
//        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeComplexFIle")
//        
//        var testObject: GLLargeComplexFile!
//        self.measure { [weak self] in
//            for _ in 1...BaseTests.iterations {
//                testObject = self?.deserializeLargeComplexObject(jsonString: jsonString)
//            }
//        }
//        
//        
//        XCTAssertEqual(4, testObject?.data.count)
//        XCTAssertEqual(4, testObject?.total)
//        XCTAssertEqual(4, testObject?.unfilteredTotal)
//        
//        guard let _  = testObject?.data.first else {
//            XCTFail("Not enough orders")
//            return
//        }
//        let order_1 = testObject?.data.removeFirst()
//        XCTAssertEqual(3, order_1?.id)
//        XCTAssertEqual("2016-04-26", order_1?.date)
//        XCTAssertEqual("pending", order_1?.status)
//        XCTAssertEqual(1, order_1?.orderForm?.id)
//        XCTAssertEqual("Order Form", order_1?.orderForm?.name)
//        XCTAssertEqual(1, order_1?.orderForm?.active)
//        XCTAssertEqual(1, order_1?.orderForm?.season?.id)
//        XCTAssertEqual("Spring 2016", order_1?.orderForm?.season?.name)
//        XCTAssertEqual(2016, order_1?.orderForm?.season?.year)
//        XCTAssertEqual(1, order_1?.orderForm?.salesTerritories.count)
//        XCTAssertEqual(1, order_1?.orderForm?.salesTerritories.first?.id)
//        XCTAssertEqual("North Territory", order_1?.orderForm?.salesTerritories.first?.name)
//        XCTAssertEqual(1, order_1?.orderForm?.solutions.count)
//        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.id)
//        XCTAssertEqual("DK-01", order_1?.orderForm?.solutions.first?.displayName)
//        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.deviations.count)
//        XCTAssertEqual("+-1%", order_1?.orderForm?.solutions.first?.deviations.first)
//        XCTAssertEqual(2, order_1?.orderForm?.solutions.first?.category?.id)
//        XCTAssertEqual("Nutrient Management", order_1?.orderForm?.solutions.first?.category?.name)
//        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.count)
//        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.first?.id)
//        XCTAssertEqual("Volume Volume Volume", order_1?.orderForm?.solutions.first?.discountPrograms.first?.name)
//        XCTAssertEqual("5% of more than 50 bags", order_1?.orderForm?.solutions.first?.discountPrograms.first?.programDescription)
//        XCTAssertEqual(1, order_1?.orderForm?.solutions.first?.discountPrograms.first?.active)
//        XCTAssertEqual("%-5.00volume(50)", order_1?.orderForm?.solutions.first?.discountPrograms.first?.operation)
//        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.count)
//        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.first?.id)
//        XCTAssertEqual("Prepay discount", order_1?.orderForm?.paymentTerms.first?.name)
//        XCTAssertEqual("3% off", order_1?.orderForm?.paymentTerms.first?.paymentTermDescription)
//        XCTAssertEqual(1, order_1?.orderForm?.paymentTerms.first?.active)
//        XCTAssertEqual("%-3.00", order_1?.orderForm?.paymentTerms.first?.operation)
//        XCTAssertEqual("small print goes here", order_1?.orderForm?.templateTerms)
//        XCTAssertEqual("2016-04-26", order_1?.orderForm?.created)
//        XCTAssertEqual(1, order_1?.orderForm?.createdBy)
//        XCTAssertEqual("2016-04-26", order_1?.orderForm?.modified)
//        XCTAssertEqual(1, order_1?.orderForm?.modifiedBy)
//        XCTAssertEqual(1, order_1?.idOrderForm)
//        XCTAssertEqual(1234.56, order_1?.total)
//        XCTAssertEqual(1, order_1?.items?.count)
//        XCTAssertEqual(5, order_1?.items?.first?.idSolution)
//        XCTAssertEqual("DK-01", order_1?.items?.first?.displayName)
//        XCTAssertEqual(1258.92, order_1?.items?.first?.subTotal)
//        XCTAssertEqual(156, order_1?.items?.first?.quantity)
//        XCTAssertEqual(1, order_1?.items?.first?.idDiscountProgram)
//        XCTAssertEqual(8.07, order_1?.items?.first?.price)
//        XCTAssertEqual(1, order_1?.customer?.id)
//        XCTAssertEqual("George Sanders", order_1?.customer?.displayName)
//        XCTAssertEqual(30, order_1?.salesRep?.id)
//        XCTAssertEqual("Jason Fossella", order_1?.salesRep?.displayName)
//        XCTAssertEqual("Some text", order_1?.note)
//        XCTAssertEqual("2016-04-26", order_1?.startDeliveryDate)
//        XCTAssertEqual("2016-07-24", order_1?.endDeliveryDate)
//        XCTAssertEqual("2016-04-26T15:19:21+00:00", order_1?.created)
//        XCTAssertEqual(1, order_1?.createdBy)
//        XCTAssertEqual("2016-04-26T15:19:21+00:00", order_1?.modified)
//        XCTAssertEqual(1, order_1?.modifiedBy)
//        
//        
//    }
//    
//    func testSerializeLargeSimpleArray1000Times() {
//        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeSimpleArray")
//        
//        let testObject = self.deserializeLargeSimpleArray(jsonString: jsonString)
//        var jsonOutput: String?
//        
//        self.measure { [weak self] in
//            for _ in 1...BaseTests.iterations {
//                jsonOutput = self?.serializeLargeSimpleArray(testObject!)
//            }
//        }
//        
//        XCTAssertEqual(true, jsonOutput?.contains("2016-09-01T15:02:14.978"))
//        
//    }
//    
//    func testDeserializeLargeSimpleArray1000Times() {
//        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "LargeSimpleArray")
//        
//        var testObject: GLLargeSimpleArray!
//        self.measure { [weak self] in
//            for _ in 1...BaseTests.iterations {
//                testObject = self?.deserializeLargeSimpleArray(jsonString: jsonString)
//            }
//        }
//        
//        XCTAssertEqual(100, testObject.data.count)
//        XCTAssertEqual("2016-09-01T15:02:14.978", testObject.data.first?.DateTime)
//        XCTAssertEqual(105.78500000000001, testObject.data.first?.Open?.number)
//        XCTAssertEqual("105.7850", testObject.data.first?.Open?.text)
//        XCTAssertEqual(105.81, testObject.data.first?.High?.number)
//        XCTAssertEqual("105.8100", testObject.data.first?.High?.text)
//        XCTAssertEqual(105.78500000000001, testObject.data.first?.Low?.number)
//        XCTAssertEqual("105.7850", testObject.data.first?.Low?.text)
//        XCTAssertEqual(105.805, testObject.data.first?.Close?.number)
//        XCTAssertEqual("105.8050", testObject.data.first?.Close?.text)
//        XCTAssertEqual(4511.0, testObject.data.first?.Volume?.number)
//        XCTAssertEqual("4511", testObject.data.first?.Volume?.text)
//        
//        
//    }
//    
//    func testSerializeMediumFile1000Times() {
//        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "MediumFile")
//        
//        let testObject = self.deserializeMediumFile(jsonString: jsonString)
//        var jsonOutput: String?
//        
//        self.measure { [weak self] in
//            for _ in 1...BaseTests.iterations {
//                jsonOutput = self?.serializeMediumFile(testObject!)
//            }
//        }
//        
//        XCTAssertEqual(true, jsonOutput?.contains("ALPHABET INC CLASS C"))
//        
//    }
//    
//    func testDeserializeMediumFile1000Times() {
//        let jsonString = JsonLoader().loadTestJSON(jsonFileName: "MediumFile")
//        
//        var testObject: GLMediumFile!
//        self.measure { [weak self] in
//            for _ in 1...BaseTests.iterations {
//                testObject = self?.deserializeMediumFile(jsonString: jsonString)
//            }
//        }
//        
//        XCTAssertEqual("QuoteWatch", testObject.meta?.command)
//        XCTAssertEqual("@C@1", testObject.meta?.symbols.first?.symbol)
//        XCTAssertEqual("CBT", testObject.meta?.symbols.first?.market)
//        XCTAssertEqual("@c@1", testObject.meta?.expression)
//        XCTAssertEqual(200, testObject.meta?.status)
//        XCTAssertEqual(2, testObject.meta?.requestId)
//        XCTAssertEqual("108.9863", testObject.data.first?.Last)
//        XCTAssertEqual("0.4763", testObject.data.first?.Change)
//        XCTAssertEqual("110.0000", testObject.data.first?.High)
//        XCTAssertEqual("100.0000", testObject.data.first?.Low)
//        XCTAssertEqual("770.1000", testObject.data.first?.Open)
//        XCTAssertEqual("762.5100", testObject.data.first?.Bid)
//        XCTAssertEqual("762.8300", testObject.data.first?.Ask)
//        XCTAssertEqual(1270264, testObject.data.first?.CumVolume)
//        XCTAssertEqual("ALPHABET INC CLASS C", testObject.data.first?.IssueDescription)
//        XCTAssertEqual("2016-10-03", testObject.data.first?.Settledate)
//        XCTAssertEqual("1.2875", testObject.data.first?.SettlementPrice)
//        XCTAssertEqual("@CZ16", testObject.data.first?.ActualSymbol)
//        XCTAssertEqual(10, testObject.data.first?.QuoteDelay)
//        XCTAssertEqual("2016-09-09T18:54:35.917", testObject.data.first?.TradeDateTime)
//        XCTAssertEqual("0.32", testObject.data.first?.PctChange)
//        
//        
//    }
//    
//    
//}
